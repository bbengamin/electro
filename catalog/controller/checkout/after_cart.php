<?php

class ControllerCheckoutAfterCart extends Controller {

    public function index($input) {
        $data = array();
        $product_id = $input['product_id'];
        
        $this->load->model('catalog/product');
        $this->load->model('tool/image');
        
        $product_info = $this->model_catalog_product->getProduct($product_id);
        
        $data['sale']		= $product_info['sale'];
		$data['bestseller'] = $product_info['bestseller'];
		$data['latest']		= $product_info['latest'];
		
		$data['name'] = $product_info['name'];
		$data['href'] = $this->url->link('product/product', 'product_id=' . $product_id );
		$data['checkout'] = $this->url->link('checkout/buy');
		
		if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
			$data['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
		} else {
			$data['price'] = false;
		}

		if ((float)$product_info['special']) {
			$data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			$data['saved'] = $this->currency->format($this->tax->calculate($product_info['price'] - $product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
		} else {
			$data['saved'] = false;
			$data['special'] = false;
		}
		
		if ($product_info['image']) {
			$data['thumb'] = $this->model_tool_image->resize($product_info['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
		} else {
			$data['thumb'] = '';
		}
		
		$cat_q = $this->db->query("SELECT category_id FROM oc_product_to_category WHERE product_id=" . $product_id);
		
		$filter_data = array(
			'sort'  => 'p.sort_order',
			'order' => 'ASC',
			'filter_category_id' => $cat_q->row['category_id'],
			'start' => 0,
			'limit' => 6
		);

		//$results = $this->model_catalog_product->getProductSpecials($filter_data);
		$results = $this->model_catalog_product->getProducts($filter_data);
		$data['products'] = array();
		foreach ($results as $result) {
			if($result['product_id'] == $product_id){
				continue;
			}
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
				'bestseller'  => $result['bestseller'],
				'latest'      => $result['latest'],
				'sale'        => $result['sale'],
				'price'       => $price,
				'special'     => $special,
				'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
				'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
			);
		}

		
		return $this->load->view('default/template/checkout/after_cart.tpl', $data);
    }

}