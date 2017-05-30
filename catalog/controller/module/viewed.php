<?php
class ControllerModuleViewed extends Controller {
	public function index($setting) {
		$this->load->language('module/viewed');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();
		
		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
			$product_id = 0;
		}

		if (isset($this->session->data['viewed']) && !empty($this->session->data['viewed'])) {
			$products = $this->session->data['viewed'];
		
			$sorted = array();
			foreach ($products as $product => $count) {
				$sorted[] = array(
					'product_id' => $product,
					'count' => $count
				);
			}
			
			$sort_order = array();
            foreach ($sorted as $key => $value) {
                $sort_order[$key] = $value['count'];
            }
            array_multisort($sort_order, SORT_DESC, $sorted);
			
			foreach ($sorted as $item) {
				$product = $item['product_id'];
				if($product_id != $product && count($data['products']) < $setting['limit'] && $product){
					$result =  $this->model_catalog_product->getProduct($product);
					if ($result['image']) {
						$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_related_width'), $this->config->get('config_image_related_height'));
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('config_image_related_width'), $this->config->get('config_image_related_height'));
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
						'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 55) . '..',
						'price'       => $price,
						'special'     => $special,
						'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
					);
				}
			}

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/viewed.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/viewed.tpl', $data);
			} else {
				return $this->load->view('default/template/module/viewed.tpl', $data);
			}
		}
	}
}
