<?php
class ControllerCronViewed extends Controller {
	
	public function index() {
		$product_list = $this->db->query('SELECT product_id FROM `oc_product`');
		
		foreach ($product_list->rows as $product) {
			$new_count = rand(1,9);
			$this->db->query("UPDATE `oc_product` SET `view_now` = '" . $new_count . "' WHERE `product_id` = '" . $product['product_id'] . "'");
		}
	}
}