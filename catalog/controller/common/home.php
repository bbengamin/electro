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