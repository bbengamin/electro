<?php

class ModelShippingnovaposhta extends Model {

    function getQuote($address) {
        $this->load->language('shipping/novaposhta');

        if ($this->config->get('novaposhta_status')) {
            $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int) $this->config->get('novaposhta_geo_zone_id') . "' AND country_id = '" . (int) $address['country_id'] . "' AND (zone_id = '" . (int) $address['zone_id'] . "' OR zone_id = '0')");

            if (!$this->config->get('novaposhta_geo_zone_id')) {
            } elseif ($query->num_rows) {
                $status = TRUE;
            } else {
                $status = FALSE;
            }
        } else {
            $status = FALSE;
        }

                $status = TRUE;
        $method_data = array();

        if ($status && isset($address['city'])) {
            $quote_data = array();

            $cost = $this->config->get('novaposhta_delivery_price');			
			
         /*   if ($this->config->get('novaposhta_min_total_for_free_delivery') > $this->cart->getSubTotal()) {
                $cost = (($this->cart->getWeight() * $this->config->get('novaposhta_delivery_price')) + $this->config->get('novaposhta_delivery_order') + ($this->cart->getSubTotal() * $this->config->get('novaposhta_delivery_insurance') / 100) + ($this->cart->getSubTotal() * $this->config->get('novaposhta_delivery_nal') / 100));
            }
*/

            $req = array();
            $req['modelName'] = "AddressGeneral";
            $req['calledMethod'] = "getWarehouses";
            $req['apiKey'] = "cded6c36ad86d141f3d5c3dc21fbf878";
            $req['methodProperties'] = array('CityName' => $address['city']);
            
            $response = $this->sendRequest("https://api.novaposhta.ua/v2.0/json/Address/getWarehouses", $req);

            $points = array();
            foreach($response['data'] as $point) {
                $points[] = array(
                    'name' => $point['DescriptionRu']
                );
            }
            $quote_data['novaposhta'] = array(
                'code' => 'novaposhta.novaposhta',
                'title' => $this->language->get('text_description'),
                'cost' => $cost,
                'point' => $points,
                'tax_class_id' => 0,
                'text' => $this->currency->format($cost)
            );

            $method_data = array(
                'code' => 'novaposhta',
                'title' => $this->language->get('text_title'),
                'quote' => $quote_data,
                'sort_order' => $this->config->get('novaposhta_sort_order'),
                'error' => FALSE
            );
        }

        return $method_data;
    }
    public function sendRequest($url, $data){
        $ch = curl_init($url);
        $payload = json_encode($data);
        
        curl_setopt( $ch, CURLOPT_POSTFIELDS, $payload );
        curl_setopt( $ch, CURLOPT_HTTPHEADER, array('Content-Type:application/json'));
        curl_setopt( $ch, CURLOPT_RETURNTRANSFER, true );
        $result = curl_exec($ch);
        curl_close($ch);
        
        return json_decode($result, true);
    }
}

?>