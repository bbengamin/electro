<?php
class ControllerCronBought extends Controller {
	
	public function index() {
		$bought_list = $this->db->query('SELECT product_id FROM `oc_product` WHERE bought=1');
		
		$total = $bought_list->num_rows; 
		$new_index = rand(0, $total-1);
		$product_id = $bought_list->rows[$new_index]['product_id'];
		
		$this->load->model('catalog/product');
		$product = $this->model_catalog_product->getProduct($product_id);
		$html = '<span class='bouht-title'>Только что купили</span> <a class="bought-color" href="' . $this->url->link('product/product', 'product_id=' . $product_id) . '">' . $product['name'] . '</a> за <span class="bought-color">' . $this->currency->format($product['price']) . '</span>';
		
		
		$this->db->query("DELETE FROM `oc_setting` WHERE store_id = '0' AND `code` = 'cron' AND `key`= 'bought'");
		
		
		
		$this->db->query("INSERT INTO `oc_setting` SET store_id = '0', `code` = 'cron', `key` = 'bought', `value` = '" . $this->db->escape($html) . "'");
	}
}