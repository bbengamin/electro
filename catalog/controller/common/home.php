<?php
class ControllerCommonHome extends Controller {
	
	public function index() {
	
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}
		
		$data['categories'] = $this->getMainCategories();

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/home.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/common/home.tpl', $data));
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
				'name'        => $result['name'],
				'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
				'price'       => $price,
				'special'     => $special,
				'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
				'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
			);
		}
		
		$data['more'] = $this->url->link("product/category", "path=" . $category_id);
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/products_home.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/products_home.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/common/products_home.tpl', $data));
		}
	}
	private function getMainCategories(){
		$result = array();
		
		$this->load->model('catalog/category');
		$this->load->model('tool/image');
		
		$category_q = $this->db->query("SELECT * FROM oc_category as c LEFT JOIN oc_category_description as cd ON cd.category_id=c.category_id AND cd.language_id='" . (int)$this->config->get('config_language_id') . "' WHERE show_home='1' ORDER BY c.category_id");
		if($category_q->num_rows){
			foreach($category_q->rows as $row){
				$image = $this->model_tool_image->resize($row['image'], 300, 300);
				$result[] = array(
					'category_id' => $row['category_id'],
					'name' => $row['name'],
					'image' => $image
				);
			}
		}
		
		return $result;
	}
	
}