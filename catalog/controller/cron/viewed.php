<?php
class ControllerCronViewed extends Controller {
	
	private function translit($text){
		$ru = explode('-', "А-а-Б-б-В-в-Ґ-ґ-Г-г-Д-д-Е-е-Ё-ё-Є-є-Ж-ж-З-з-И-и-І-і-Ї-ї-Й-й-К-к-Л-л-М-м-Н-н-О-о-П-п-Р-р-С-с-Т-т-У-у-Ф-ф-Х-х-Ц-ц-Ч-ч-Ш-ш-Щ-щ-Ъ-ъ-Ы-ы-Ь-ь-Э-э-Ю-ю-Я-я"); 
		$en = explode('-', "A-a-B-b-V-v-G-g-G-g-D-d-E-e-E-e-E-e-ZH-zh-Z-z-I-i-I-i-I-i-J-j-K-k-L-l-M-m-N-n-O-o-P-p-R-r-S-s-T-t-U-u-F-f-H-h-TS-ts-CH-ch-SH-sh-SCH-sch---Y-y---E-e-YU-yu-YA-ya");

	 	$res = str_replace($ru, $en, $text);
		$res = preg_replace("/[\s]+/ui", '-', $res);
		$res = strtolower(preg_replace("/[^0-9a-zа-я\-]+/ui", '', $res));
	    return $res;  
	}
	
	public function generate() {
		$prods = $this->db->query('SELECT * FROM oc_product_description WHERE language_id=2');
		
		foreach($prods->rows as $row){
			$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$row['product_id'] . "'");

			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product_id=" . (int)$row['product_id'] . "', keyword = '" . $this->db->escape($this->translit($row['name'])) . "'");
		}
		
		$cats = $this->db->query('SELECT * FROM oc_category_description WHERE language_id=2');
		
		foreach($cats->rows as $row){
			$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'category_id=" . (int)$row['category_id'] . "'");

			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'category_id=" . (int)$row['category_id'] . "', keyword = '" . $this->db->escape($this->translit($row['name'])) . "'");
		}
		
		
	}
	public function index() {
		$product_list = $this->db->query('SELECT product_id FROM `oc_product`');
		
		foreach ($product_list->rows as $product) {
			$new_count = rand(1,9);
			$this->db->query("UPDATE `oc_product` SET `view_now` = '" . $new_count . "' WHERE `product_id` = '" . $product['product_id'] . "'");
		}
	}
}