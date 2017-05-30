<?php
class ControllerProductAjax extends Controller {
	public function index() {
		$data = array();
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');

		$this->load->model('tool/image');
		
		if (isset($this->request->get['manufacturer_id'])) {
			$manufacturer_id = (int)$this->request->get['manufacturer_id'];
		} else {
			$manufacturer_id = 0;
		}

		if (isset($this->request->get['filter'])) {
			$filter = $this->request->get['filter'];
		} else {
			$filter = '';
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		
		if (isset($this->request->get['search'])) {
			$search = $this->request->get['search'];
		} else {
			$search = false;
		}
		
		if (isset($this->request->get['route'])) {
			$route = $this->request->get['route'];
		} else {
			$route = 'product/category';
		}

		if (isset($this->request->get['limit'])) {
			$limit = (int)$this->request->get['limit'];
		} else {
			$limit = $this->config->get('config_product_limit');
		}
		
		$fmSettings = $this->config->get('mega_filter_settings');
				
		if( ! empty( $fmSettings['not_remember_filter_for_subcategories'] ) && false !== ( $mfpPos = strpos( $url, '&mfp=' ) ) ) {
			$mfUrlBeforeChange = $url;
			$mfSt = mb_strpos( $url, '&', $mfpPos+1, 'utf-8');
			$url = $mfSt === false ? '' : mb_substr($url, $mfSt, mb_strlen( $url, 'utf-8' ), 'utf-8');
		}
			
		if( isset( $mfUrlBeforeChange ) ) {
			$url = $mfUrlBeforeChange;
			unset( $mfUrlBeforeChange );
		}
		
		$fmSettings = $this->config->get('mega_filter_settings');
		
		if( ! empty( $fmSettings['show_products_from_subcategories'] ) ) {
			if( ! empty( $fmSettings['level_products_from_subcategories'] ) ) {
				$fmLevel = (int) $fmSettings['level_products_from_subcategories'];
				$fmPath = explode( '_', empty( $this->request->get['path'] ) ? '' : $this->request->get['path'] );

				if( $fmPath && count( $fmPath ) >= $fmLevel ) {
					$filter_data['filter_sub_category'] = '1';
				}
			} else {
				$filter_data['filter_sub_category'] = '1';
			}
		}
		$filter_data['filter_sub_category'] = '1';
		
		if( ! empty( $this->request->get['manufacturer_id'] ) ) {
			$filter_data['filter_manufacturer_id'] = (int) $this->request->get['manufacturer_id'];
		}


		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order']) && !empty($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}
		
		if( ! empty( $this->request->get['page'] ) ) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		if( ! empty( $this->request->get['mfp'] ) ) {
			$url .= '&mfp=' . $this->request->get['mfp'];
		}

		if( ! empty( $this->request->get['search'] ) ) {
			$url .= '&search=' . $this->request->get['search'];
		}
		
		if( ! empty( $this->request->get['manufacturer_id'] ) ) {
			$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
		}
		if (isset($this->request->get['path'])) {

			$path = '';

			$parts = explode('_', (string)$this->request->get['path']);

			$category_id = (int)array_pop($parts);

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = (int)$path_id;
				} else {
					$path .= '_' . (int)$path_id;
				}

				$category_info = $this->model_catalog_category->getCategory($path_id);

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['name'],
						'href' => $this->url->link('product/category', 'path=' . $path . $url)
					);
				}
			}
		} else {
			$category_id = 0;
		}

		$data['products'] = array();
		
		if($this->request->get['mode'] == "search"){
			$filter_data = array(
				'filter_name'         => $search,
				'filter_tag'          => $search,
				'filter_description'  => true,
				'filter_description'  => true,
				'filter_category_id'  => 0,
				'filter_sub_category' => 1,
				'sort'                => $sort,
				'order'               => $order,
				'start'               => ($page - 1) * $limit,
				'limit'               => $limit
			);
		}else{
			$filter_data = array(
				'filter_category_id' => $category_id,
				'filter_filter'      => $filter,
				'filter_manufacturer_id' => $manufacturer_id,
				'filter_sub_category' => 1,
				'sort'               => $sort,
				'order'              => $order,
				'start'              => ($page - 1) * $limit,
				'limit'              => $limit
			);
		}

		
		if($this->request->get['mode'] == "special"){
			$product_total = $this->model_catalog_product->getTotalProductSpecials();
			$results = $this->model_catalog_product->getProductSpecials($filter_data);
		} else {
			$product_total = $this->model_catalog_product->getTotalProducts($filter_data);
			$results = $this->model_catalog_product->getProducts($filter_data);
		}

		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			} else {
				$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			}
			
			$images = array();

			$results_img = $this->model_catalog_product->getProductImages($result['product_id']);
	
			foreach ($results_img as $result_img) {
				$images[] = array(
					'popup' => $this->model_tool_image->resize($result_img['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height')),
					'thumb' => $this->model_tool_image->resize($result_img['image'], $this->config->get('config_image_additional_width'), $this->config->get('config_image_additional_height'))
				);
			}

			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}

			if ((float)$result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$special = false;
			}

			$data['products'][] = array(
				'product_id'  => $result['product_id'],
				'thumb'       => $image,
				'images'       => $images,
				'name'        => $result['name'],
				'bestseller'  => $result['bestseller'],
				'latest'      => $result['latest'],
				'sale'        => $result['sale'],
				'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
				'price'       => $price,
				'special'     => $special,
				'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
				'href'        => $this->url->link('product/product', 'path=' . $this->request->get['path'] . '&product_id=' . $result['product_id'] . $url)
			);
		}
		
		$data['more'] = $product_total > $page * $limit;
		
		$data['url'] = str_replace(HTTP_SERVER , "", $this->url->link($this->request->get['my_route'], 'path=' . $this->request->get['path'] . $url));
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/products_category.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/product/products_category.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/product/products_category.tpl', $data));
		}
	}
	
	public function mainProducts(){
		$data = array();
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		$category_q = $this->db->query("SELECT * FROM oc_category as c LEFT JOIN oc_category_description as cd ON cd.category_id=c.category_id AND cd.language_id='" . (int)$this->config->get('config_language_id') . "' WHERE show_home='1' ORDER BY c.category_id");
		
		if(isset($this->request->get['category_id'])){
			$category_id = $this->request->get['category_id']; 
		}else{
			$category_id = $category_q->row['category_id'];
		}
		
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		$data_filter = array(
			'filter_category_id' => $category_id,
			'start' => 0,
			'limit' => 8
		);
		
		$category_name_q = $this->db->query("SELECT name FROM oc_category_description WHERE language_id='" . (int)$this->config->get('config_language_id') . "' AND category_id=" . $category_id);
		$data['name'] = $category_name_q->row['name'];
		
		$results = $this->model_catalog_product->getProducts($data_filter);
		$data['products'] = array();
		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			} else {
				$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			}
			
			$images = array();
			

			$results_img = $this->model_catalog_product->getProductImages($result['product_id']);
	
			foreach ($results_img as $result_img) {
				$images[] = array(
					'popup' => $this->model_tool_image->resize($result_img['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height')),
					'thumb' => $this->model_tool_image->resize($result_img['image'], $this->config->get('config_image_additional_width'), $this->config->get('config_image_additional_height'))
				);
			}

			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}

			if ((float)$result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$special = false;
			}

			$data['products'][] = array(
				'product_id'  => $result['product_id'],
				'thumb'       => $image,
				'images'       => $images,
				'name'        => $result['name'],
				'bestseller'  => $result['bestseller'],
				'latest'      => $result['latest'],
				'sale'        => $result['sale'],
				'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
				'price'       => $price,
				'special'     => $special,
				'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
				'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
			);
		}
		
		$data['more'] = $this->url->link("product/category", "path=" . $category_id);
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/products_home.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/product/products_home.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/product/products_home.tpl', $data));
		}
	}
}
