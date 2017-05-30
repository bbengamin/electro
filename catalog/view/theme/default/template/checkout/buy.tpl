<?php echo $header; ?>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
    <?php if ($attention) { ?>
        <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
    <?php } ?>
    <?php if ($success) { ?>
        <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
    <?php } ?>
    <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
    <?php } ?>
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
            <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
            <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
            <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
            <div class='category-title'>
                <h2>Корзина покупок</h2>
            </div>
            <form action="<?php echo $action; ?>" id='buy-form' method="post" enctype="multipart/form-data">
                <div id='buy-load' >
                <div class="table-responsive hidden-xs" >
                    <table class="table table-bordered" id='marin-cart-table'>
                        <thead>
                            <tr>
                                <td class="text-center img-cart-col"><?php echo $column_image; ?></td>
                                <td class="text-center name-cart-col"><?php echo $column_name; ?></td>
                                
                                <td class="text-center quantity-cart-col"><?php echo $column_quantity; ?></td>
                                <td class="text-center price-cart-col"><?php echo $column_price; ?></td>
                                <td class="text-center total-cart-col"><?php echo $column_total; ?></td>
                                <td class="text-center delete-cart-col"></td>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($products as $product) { ?>
                                <tr>
                                    <td class="text-center img-cart-col"><?php if ($product['thumb']) { ?>
                                            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
                                        <?php } ?></td>
                                    <td class="text-left name-cart-col"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                        <?php if (!$product['stock']) { ?>
                                            <span class="text-danger">***</span>
                                        <?php } else { ?>
                                            <div class="stok-in">
                                                <span class='saved-text'>В наличии</span>
                                            </div>
                                        <?php } ?>
                                        <?php if ($product['option']) { ?>
                                            <?php foreach ($product['option'] as $option) { ?>
                                                <br />
                                                <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                                            <?php } ?>
                                        <?php } ?>
                                        <?php if ($product['reward']) { ?>
                                            <br />
                                            <small><?php echo $product['reward']; ?></small>
                                        <?php } ?>
                                        <?php if ($product['recurring']) { ?>
                                            <br />
                                            <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
                                        <?php } ?>
                                     </td>
                                   
                                    <td class="text-center quantity-cart-col">
                                        <div class="quanty-box" >
                                            <div class='minus'>-</div>
                                            <input type="text" class='quantity-input' name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />
                                            <div class='plus'>+</div>
                                        </div>
                                        </td>
                                    <td class="text-center price-cart-col"><?php echo $product['price']; ?></td>
                                    <td class="text-center total-cart-col"><?php echo $product['total']; ?></td>
                                    <td class="text-center delete-cart-col">
                                        <div data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="cart-main-remove" onclick="cart.remove('<?php echo $product['key']; ?>');">
                                            <i class="material-icons">delete_forever</i>
                                        </div>
                                    </td>
                                </tr>
                            <?php } ?>
                            </tbody>
                            </table>
                            <table class='table table-bordered' id='total-cart-table'>
                            <tbody>
                            <?php foreach ($vouchers as $vouchers) { ?>
                                <tr>
                                    <td></td>
                                    <td class="text-left"><?php echo $vouchers['description']; ?></td>
                                    <td class="text-left"></td>
                                    <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                                            <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                                            <span class="input-group-btn"><button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="voucher.remove('<?php echo $vouchers['key']; ?>');"><i class="fa fa-times-circle"></i></button></span></div></td>
                                    <td class="text-right"><?php echo $vouchers['amount']; ?></td>
                                    <td class="text-right"><?php echo $vouchers['amount']; ?></td>
                                </tr>
                            <?php } ?>
                            <?php foreach ($totals as $total) { ?>
                                <tr class="total-item">
                                    <td class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
                                    <td class="text-right"><?php echo $total['text']; ?></td>
                                </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                    
                    
                    
                    
                </div>
                <div class="mobile-cart-box visible-xs">
                        <div class="mobile-cart-inner">
                            <?php foreach ($products as $product) { ?>
                            <div class="mob-item-cart">
                                <div class="mob-cart-item mob-cart-item-img">
                                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
                                </div>
                                <div class="mob-cart-item mob-cart-item-text-box">
                                    <div class="mob-cart-item mob-cart-item-name"><?php echo $product['name']; ?></div>    
                                    <div class="mob-cart-item mob-cart-item-qua">
                                        <div class="quanty-box" >
                                            <div class='minus'>-</div>
                                            <input type="text" class='quantity-input' name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />
                                            <div class='plus'>+</div>
                                        </div>
                                    </div>    
                                    <div class="mob-cart-item mob-cart-item-price">
                                        <?php echo $product['price']; ?>
                                    </div>    
                                </div>
                                <div data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="cart-main-remove cart-main-remove-mob" onclick="cart.remove('<?php echo $product['key']; ?>');">
                                    <i class="material-icons">delete_forever</i>
                                </div>
                            </div>
                            <?php } ?>
                            
                        </div>
                        <div class="cart-total-box">
                            <ul class="totals-box list-unstyled">
                                <?php foreach ($totals as $total) { ?>
                                <li>
                                    <span class="total-item total-head-item"><strong><?php echo $total['title']; ?>:</strong></span>
                                    <span class="total-item total-not-head-item"><?php echo $total['text']; ?></span>
                                </li>
                                <?php } ?>
                            </ul>
                        </div>
                    </div>
                </div>
            </form>
            <?php /* if (($coupon || $voucher || $reward || $shipping) && $settings['buy_cart_modules']) {  ?>
                <h2><?php echo $text_next; ?></h2>
                <p><?php echo $text_next_choice; ?></p>
                <div class="panel-group" id="accordion"><?php echo $coupon; ?><?php echo $voucher; ?><?php echo $reward; ?><?php echo $shipping; ?></div>
            <?php } */ ?>
            <hr />
            <h2 class="text-center h1" id="checkout-f"><?php echo $settings['buy_h2'.$lang]; ?></h2>
            <br />
            <div class="row" id="checkout-form">
                <div class="col-sm-12 steps_checkout step_1">
                    <div class="loading-box-checkout">
                        <div class="gear"></div> 
                    </div>
                    <div class="chekout-box-item">
                        <div class="row"></div>
                        <h3 class='checkout-title-text'>Личные данные</h3>
                        <?php if($settings['buy_form_headings']){ ?>
                        <div class="form-group">
                            <h2><span class="label label-primary">1</span> <?php echo $settings['buy_heading_1'.$lang]; ?></h2>
                        </div>
                        <?php } ?>
                        <div class="form-group" style="display: <?php echo (count($customer_groups) > 1 ? 'block' : 'none'); ?>;">
                            <label class="control-label"><?php echo $entry_customer_group; ?></label>
                            <?php foreach ($customer_groups as $customer_group) { ?>
                                <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
                                            <?php echo $customer_group['name']; ?></label>
                                    </div>
                                <?php } else { ?>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" />
                                            <?php echo $customer_group['name']; ?></label>
                                    </div>
                                <?php } ?>
                            <?php } ?>
                        </div>
                        <?php if($settings['buy_firstname_status']){ ?>
                        <div class="form-group<?php if($settings['buy_firstname_required']){ ?> required<?php } ?>">
                            <label class="control-label" for="input-payment-firstname"><?php echo $entry_firstname; ?></label>
                            <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-payment-firstname" class="form-control" />
                        </div>
                        <?php } ?>
                        <?php if($settings['buy_lastname_status']){ ?>
                        <div class="form-group<?php if($settings['buy_lastname_required']){ ?> required<?php } ?>">
                            <label class="control-label" for="input-payment-lastname"><?php echo $entry_lastname; ?></label>
                            <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-payment-lastname" class="form-control" />
                        </div>
                        <?php } ?>
                        <?php if($settings['buy_email_status']){ ?>
                        <div class="form-group<?php if($settings['buy_email_required']){ ?> required<?php } ?>">
                            <label class="control-label" for="input-payment-email"><?php echo $entry_email; ?></label>
                            <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-payment-email" class="form-control" />
                        </div>
                        <?php } ?>
                        <?php if($settings['buy_telephone_status']){ ?>
                        <div class="form-group<?php if($settings['buy_telephone_required']){ ?> required<?php } ?>">
                            <label class="control-label" for="input-payment-telephone"><?php echo $entry_telephone; ?></label>
                            <input type="tel" name="telephone" value="<?php echo $telephone; ?>"  placeholder="<?php echo $entry_telephone; ?>" id="input-payment-telephone" class="form-control" />
                        </div>
                        <?php } ?>
                        <?php if($settings['buy_city_status']){ ?>
                        <div class="form-group<?php if($settings['buy_city_required']){ ?> required<?php } ?>">
                            <label class="control-label" for="input-payment-city"><?php echo $entry_city; ?></label>
                            <input type="text" name="city" value="<?php echo $city; ?>" autocomplete="off" placeholder="<?php echo $entry_city; ?>" id="input-payment-city" class="form-control" />
                            <div class='hidden' id='cities-dropdown'></div>
                        </div>
                        <?php } ?>
                        <?php if($settings['buy_fax_status']){ ?>
                        <div class="form-group<?php if($settings['buy_fax_required']){ ?> required<?php } ?>">
                            <label class="control-label" for="input-payment-fax"><?php echo $entry_fax; ?></label>
                            <input type="text" name="fax" value="<?php echo $fax; ?>" placeholder="<?php echo $entry_fax; ?>" id="input-payment-fax" class="form-control" />
                        </div>
                        <?php } ?>
                        <?php if($settings['buy_company_status']){ ?>
                        <div class="form-group<?php if($settings['buy_company_required']){ ?> required<?php } ?>">
                            <label class="control-label" for="input-payment-company"><?php echo $entry_company; ?></label>
                            <input type="text" name="company" value="<?php echo $company; ?>" placeholder="<?php echo $entry_company; ?>" id="input-payment-company" class="form-control" />
                        </div>
                        <?php } ?>
                        
                        <input type="hidden" name="cityId" id='cityId' value=""/>
                        <div class='continue'>
                             <input type="button" value="Продолжить" id="button-continue" class="login-page-btns checkout-btnes" />
                        </div>
                        
                    <?php if(!$settings['buy_form_design']){ ?>
                    </div>
                </div>
                <div class="col-sm-12 hidden steps_checkout step2">
                    <div class="loading-box-checkout">
                        <div class="gear"></div> 
                    </div>
                <div class="chekout-box-item">
                    <div class="row">
                        <h3 class='checkout-title-text'>Адрес доставки</h3>
                    </div>
                <?php } ?>
                    <?php if($settings['buy_form_headings']){ ?>
                    <div class="form-group">
                        <h2><span class="label label-primary">2</span> <?php echo $settings['buy_heading_2'.$lang]; ?></h2>
                    </div>
                    <?php } ?>
                    <?php if($settings['buy_country_status']){ ?>
                    <div class="form-group<?php if($settings['buy_country_required']){ ?> required<?php } ?>" id="payment-country">
                        <label class="control-label" for="input-payment-country"><?php echo $entry_country; ?></label>
                        <select name="country_id" id="input-payment-country" class="form-control">
                            <option value=""><?php echo $text_select; ?></option>
                            <?php foreach ($countries as $country) { ?>
                                <?php if ($country['country_id'] == $country_id) { ?>
                                    <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                                <?php } else { ?>
                                    <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                                <?php } ?>
                            <?php } ?>
                        </select>
                    </div>
                    <?php }else{ ?>
                    <div class="hidden">
                        <select name="country_id">
                            <option value="<?php echo $country_id; ?>" selected="selected"></option>
                        </select>
                    </div>
                    <?php } ?>
                    <?php if($settings['buy_zone_status']){ ?>
                    <div class="form-group has-feedback<?php if($settings['buy_zone_required']){ ?> required<?php } ?>" id="payment-zone">
                        <label class="control-label" for="input-payment-zone"><?php echo $entry_zone; ?></label>
                        <select name="zone_id" id="input-payment-zone" class="form-control" onchange="updateShM(this.value);">
                        </select>
                    </div>
                    <?php }else{ ?>
                    <div class="hidden">
                        <select name="zone_id">
                            <option value="<?php echo $zone_id; ?>" selected="selected"></option>
                        </select>
                    </div>
                    <?php } ?>
                   
                    <?php if($settings['buy_postcode_status']){ ?>
                    <div class="form-group<?php if($settings['buy_postcode_required']){ ?> required<?php } ?>">
                        <label class="control-label" for="input-payment-postcode"><?php echo $entry_postcode; ?></label>
                        <input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-payment-postcode" class="form-control" />
                    </div>
                    <?php } ?>
                   
                    <?php if($settings['buy_address_2_status']){ ?>
                    <div class="form-group<?php if($settings['buy_address_2_required']){ ?> required<?php } ?>">
                        <label class="control-label" for="input-payment-address-2"><?php echo $entry_address_2; ?></label>
                        <input type="text" name="address_2" value="<?php echo $address_2; ?>" placeholder="<?php echo $entry_address_2; ?>" id="input-payment-address-2" class="form-control" />
                    </div>
                    <?php } ?>
                    <?php if($settings['buy_form_headings'] && ($settings['buy_shipping_select'] || $settings['buy_payment_select'])) { ?>
                    <div class="form-group">
                        <h2><span class="label label-primary">3</span> <?php echo $settings['buy_heading_3'.$lang]; ?></h2>
                    </div>
                    <?php } ?>
                    <?php if($settings['buy_shipping_select']){ ?>
                    <div class="form-group">
                        <div id="shipping_methods"></div>
                    </div>
                    <?php }else{ ?>
                        <div class="hidden"><input type="radio" name="shipping_method" value="flat.flat" checked="checked"></div>
                    <?php } ?>
                    <br />
                    
                     <?php if($settings['buy_address_1_status']){ ?>
                    <div class="form-group<?php if($settings['buy_address_1_required']){ ?> required<?php } ?>">
                        <label class="control-label" for="input-payment-address-1"><?php echo $entry_address_1; ?></label>
                        <input type="text" name="address_1" value="<?php echo $address_1; ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-payment-address-1" class="form-control" />
                    </div>
                    <?php } ?>
                    <?php if($settings['buy_payment_select']){ ?>
                    <div class="form-group">
                        <div id="payment_methods"></div>
                    </div>
                    <?php }else{ ?>
                        <div class="hidden"><input type="radio" name="payment_method" value="cod" checked="checked"></div>
                    <?php } ?>
                    <?php if($settings['buy_comment_status']){ ?>
                    <br />
                    <div class="form-group<?php if($settings['buy_comment_required']){ ?> required<?php } ?>">
                        <label class="control-label" for="input-comment"><strong><?php echo $entry_comment; ?></strong></label>
                        <textarea name="comment" rows="8" class="form-control" id="input-comment"><?php echo $comment; ?></textarea>
                    </div>
                    <?php } ?>
                    <?php if ($text_agree) { ?>
                        <div class="buttons">
                            <div class="text-center">
                               <!-- <label><?php echo $text_agree; ?>
                                <?php if ($agree) { ?>
                                    <input type="checkbox" name="agree" value="1" checked="checked" />
                                <?php } else { ?>
                                    <input type="checkbox" name="agree" value="1" />
                                <?php } ?>
                                </label> -->
                                <input type="hidden" name="agree" value="1" />
                                <br />
                                <br />
                                <input type="button" value="<?php echo $button_order; ?>" id="button-order" data-loading-text="<?php echo $text_loading; ?>" class="login-page-btns checkout-btnes" />
                            </div>
                            <div id="payment-form"></div>
                        </div>
                    <?php } else { ?>
                        <br />
                        <div class="buttons">
                            <div class="text-center">
                                <input type="button" value="<?php echo $button_order; ?>" id="button-order" data-loading-text="<?php echo $text_loading; ?>" class="login-page-btns checkout-btnes" />
                            </div>
                            <div id="payment-form"></div>
                        </div>
                    <?php } ?>
                </div>
                </div>
            </div>








            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>
<?php if($settings['buy_telephone_mask']){ ?>
<?php } ?>
<script type="text/javascript"><!--
$('#buy-form').on("click", ".minus" ,function(){
    var count = parseInt($(this).next().val());
    $(this).next().val(count-1);
    if(count <= 1 || isNaN(count)){
        $(this).next().val(1);
    }
    $(this).next().trigger('change');
});

$('#buy-form').on("click", ".plus" ,function(){
    var count = parseInt($(this).prev().val());
    $(this).prev().val(count+1);
    $(this).prev().trigger('change');
});
$('#buy-form').on('change', '.quantity-input',function() {
    $.ajax({
        url: 'index.php?route=checkout/buy/editMy',
        type: 'post',
        data: $(this),
        dataType: 'json',
        success: function(json) {
            $('#buy-form').load('index.php?route=checkout/buy #buy-load');
        }
    });
    
});

$('#button-continue').on('click', function() {
    if(updateShM()){
        $('.step2').removeClass('hidden');
    }
});

var delayTimer;
$('#input-payment-city').on('keyup', function() {
    self = $(this);
    clearTimeout(delayTimer);
    delayTimer = setTimeout(function() {
		var value = self.val();
		
		$.ajax({
			url: 'index.php?route=checkout/buy/citySearch',
			type: 'get',
			data: 'text=' + value,
			dataType: 'json',
			success: function(json) {
			    var cities = "";
			    $.each(json['cities'], function(key, val) {
			        cities += "<div class='city-element' data-id='" + val.id + "'>" + val.name + "</div>"
                });
				$('#cities-dropdown').html(cities);
				if(json['cities'].length > 1 || $('#cityId').val() != ""){
				    $('#cities-dropdown').removeClass('hidden');
				}else{
				    $('.city-element').trigger('click');
				    $('#cities-dropdown').addClass('hidden');
				}
			}
		});
    }, 300);
});

$(document).on('click', '.city-element', function() {
    $('#input-payment-city').val($(this).text());
    $('#cityId').val($(this).attr('data-id'));
    $('#cities-dropdown').addClass('hidden');
});

cart.remove = function(key) {
        $.ajax({
            url: 'index.php?route=checkout/cart/remove',
            type: 'post',
            data: 'key=' + key,
            dataType: 'json',
            beforeSend: function() {
                $('#cart > button').button('loading');
            },
            success: function(json) {
                location = 'index.php?route=checkout/buy';
                /*$('#cart > button').button('reset');

                $('#cart-total').html(json['total']);

                if (getURLVar('route') == 'checkout/buy') {
                } else {
                    $('#buy-form').load('index.php?route=checkout/buy #buy-load');
                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }*/
            }
        });
    }
    $('#checkout-form select[name=\'country_id\']').on('change', function() {
        $.ajax({
            url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
            dataType: 'json',
            beforeSend: function() {
                $('#checkout-form #payment-zone').append('<span class="form-control-feedback"><i class="fa fa-circle-o-notch fa-spin"></i></span>');
            },
            complete: function() {
                $('#checkout-form #payment-zone .form-control-feedback').remove();
            },
            success: function(json) {
                if (json['postcode_required'] == '1') {
                    $('#checkout-form input[name=\'postcode\']').parent().addClass('required');
                } else {
                    $('#checkout-form input[name=\'postcode\']').parent().removeClass('required');
                }

                html = '<option value=""> --- Please Select --- </option>';

                if (json['zone']) {
                    for (i = 0; i < json['zone'].length; i++) {
                        html += '<option value="' + json['zone'][i]['zone_id'] + '"';
                        
                        <?php if(!empty($zone_id)){ ?>
                        if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
                            html += ' selected="selected"';
                        }
                        <?php } ?>

                        html += '>' + json['zone'][i]['name'] + '</option>';
                    }
                } else {
                    html += '<option value="0" selected="selected"> --- None --- </option>';
                }

                $('#checkout-form select[name=\'zone_id\']').html(html);
                var zone_id = $('#checkout-form select[name="zone_id"]').val();
                if (zone_id) {
                }
               // updateShM(zone_id);
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    $('#checkout-form select[name=\'country_id\']').trigger('change');
    function updateShM(zone_id) {
        $('.error').remove();
        $('.loading-box-checkout').addClass('loading');
        var valid = true;
        $.ajax({
            async: false,
            cache: false,
            url: 'index.php?route=checkout/buy/getShippingMethods',
            type: 'post',
            data: $('#checkout-form input, #checkout-form select'),
            dataType: 'json',
            success: function(json) {
                if (json['error']) {
					$.each(json['error'], function(key, val) {
						$('#checkout-form').find('[name="' + key + '"]').after('<span class="error">' + val + '</span>');
                    });
                    valid = false;
				}else{
                    $('#shipping_methods').html(json.shipping);
                    selectShipping();
				}
               // $('.loading-box-checkout').hide();
               // $('.loading-box-checkout').removeClass('loading');
            }
        });
        $('#payment_methods').load('index.php?route=checkout/buy/getPaymentMethods&zone_id=' + zone_id, function() {
            $('#pay_loading').empty();
        });
        return valid;
    }
    function getPaymentForm(code, callback) {
        $.ajax({
            async: false,
            cache: false,
            url: 'index.php?route=checkout/buy/getPaymentForm',
            type: 'post',
            data: 'code=' + code.split('.')[0] + '&payment_method=' + code,
            dataType: 'json',
            success: function(json) {
                $('#payment_form2').html(json['output']);
                callback();
            }
        });
    }
    $('#button-order').click(function() {
        $('.error').remove();
        $.ajax({
            url: 'index.php?route=checkout/buy/save',
            type: 'post',
            data: $('#checkout-form input[type=\'text\'], #checkout-form input[type=\'tel\'], #checkout-form input[type=\'checkbox\']:checked, #checkout-form select, #checkout-form input[type=\'radio\']:checked, #checkout-form textarea, #checkout-form input[type=\'hidden\']'),
            dataType: 'json',
            beforeSend: function() {
                $('#button-order').button('loading');
                $('.loading-box-checkout').addClass('loading');
            },
            complete: function() {
                $('#button-order').button('reset');
                
            },
            success: function(json) {
                $('.error').remove();
                $('.warning').remove();
                if (json['redirect']) {
                    location = json['redirect'];
                }
                if (json['error']) {
                    $('#checkout-form .has-error').removeClass('has-error');
                    $('#checkout-form .text-danger').remove();
                    if (json['error']['warning']) {
                        addWarning(json['error']['warning']);
                    }
                    if (json['error']['firstname']) {
                        addError('#input-payment-firstname', json['error']['firstname']);
                    }
                    if (json['error']['lastname']) {
                        addError('#input-payment-lastname', json['error']['lastname']);
                    }
                    if (json['error']['email']) {
                        addError('#input-payment-email', json['error']['email']);
                    }
                    if (json['error']['telephone']) {
                        addError('#input-payment-telephone', json['error']['telephone']);
                    }
                    if (json['error']['fax']) {
                        addError('#input-payment-fax', json['error']['fax']);
                    }
                    if (json['error']['company']) {
                        addError('#input-payment-company', json['error']['company']);
                    }
                    if (json['error']['country']) {
                        addError('#input-payment-country', json['error']['country']);
                    }
                    if (json['error']['zone']) {
                        addError('#input-payment-zone', json['error']['zone']);
                    }
                    if (json['error']['city']) {
                        addError('#input-payment-city', json['error']['city']);
                    }
                    if (json['error']['novaposhta-select']) {
                        addError('#novaposhta', json['error']['novaposhta-select']);
                    }
                    if (json['error']['postcode']) {
                        addError('#input-payment-postcode', json['error']['postcode']);
                    }
                    if (json['error']['address_1']) {
                        addError('#input-payment-address-1', json['error']['address_1']);
                    }
                    $('.loading-box-checkout').removeClass('loading');
                    $('.wait').remove();
                } else {
                    $.ajax({
                        url: 'index.php?route=checkout/buy/confirm',
                        type: 'get',
                        dataType: 'json',
                        success: function() {
                            var code = $('#checkout-form input[name=\'payment_method\']:checked').val();
                            getPaymentForm(code, function() {

                                if ($('p,h1,h2,h3,input[type=text],input[type=radio],input[type=checkbox],input[type=password],select', $('#payment-form')).length > 0) {
                                    $('#payment-form').css('display', 'block');
                                } else {
                                    var payment_form = $('#payment-form form#payment');

                                    if (payment_form.length) {
                                        payment_form.submit();
                                    } else {
                                        var href = $('#payment-form div.buttons a').attr('href');
                                        if (typeof href != 'undefined' && href != '' && href != '#') {
                                            location = href;
                                        } else {
                                            $('#payment-form div.buttons a,#payment-form div.buttons input[type=button],#payment-form div.buttons input[type=submit],#payment-form form input[type=submit]').click();
                                        }
                                    }
                                }
                            });
                        },
                        error: function(xhr, ajaxOptions, thrownError) {
                            alert(thrownError);
                            }
                    });
                }
            }
        });
    });
    function getPaymentForm(code, callback) {
        $.ajax({
            async: false,
            cache: false,
            url: 'index.php?route=checkout/buy/getPaymentForm',
            type: 'post',
            data: 'code=' + code.split('.')[0] + '&payment_method=' + code,
            dataType: 'json',
            success: function(json) {
                $('#payment-form').html(json['output']);
                callback();
            }
        });
    }
    function addWarning(text) {
        $('#checkout-form .alert').remove();
        $('#checkout-form').prepend('<div class="alert alert-danger alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>' + text + '</div>');
        $('html, body').animate({
            scrollTop: $("#checkout-form").offset().top - 15
        }, {
            duration: 500,
            complete: function() {
                $('#checkout-form .alert').animate({opacity: 0}, 100).animate({opacity: 1}, 100);
            }
        });

    }
    function addError(el, text) {
        $(el).parent().addClass('has-error');
        $(el).after('<div class="text-danger">' + text + '</div>');
    }
    function selectShipping(){
        $('.sh-additional').addClass('hidden');
        $('#input-payment-address-1').parent().addClass('hidden');
        if(typeof($('input[name="shipping_method"]')) !== 'undefined'){
            
            $('.loading-box-checkout').addClass('loading');
            
            var cod = $('input[name="shipping_method"]:checked').val();
            if(cod == "novaposhta.novaposhta"){
               $('.sh-additional').removeClass('hidden');
            }else if(cod == 'citylink.citylink'){
                $('#input-payment-address-1').parent().removeClass('hidden');
            }
            $.ajax({
                async: false,
                cache: false,
                url: 'index.php?route=checkout/buy/selectShipping',
                type: 'post',
                data: 'code='+$('input[name="shipping_method"]:checked').val(),
                dataType: 'json',
                success: function(json) {
                    if(json['totals']){
                        var container = $('.total-item').closest('table');
                        container.children('tbody').children('.total-item').remove();
                        container.children('tbody').append(json['totals']);
                    }
                    setTimeout(function(){
                        $('.loading-box-checkout').removeClass('loading');
                    }, 500)
                    //
                }
            });
        }
    }
    <?php if($settings['buy_telephone_mask']){ ?>
    $("#checkout-form input[name='telephone']").mask("<?php echo $settings['buy_telephone_mask'];?>");
    <?php } ?>
//--></script>
<style type="text/css">
    #checkout-form .has-feedback .form-control-feedback{top:26px;right:10px}
    #checkout-form #shipping_methods .radio, #checkout-form #payment_methods .radio{margin-left:20px}
    #checkout-form #payment-form{display:none}
</style>
<?php echo $footer; ?>