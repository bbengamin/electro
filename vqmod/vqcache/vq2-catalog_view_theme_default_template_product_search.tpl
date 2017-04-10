<?php echo $header; ?><?php if( ! empty( $mfilter_json ) ) { echo '<div id="mfilter-json" style="display:none">' . base64_encode( $mfilter_json ) . '</div>'; } ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?><div id="mfilter-content-container">
     <div class='category-title category-title-smaller'>
        <h2><?php echo $text_search; ?> по запросу <?php echo $heading_title; ?></h2>
      </div>
      <label class="control-label" for="input-search">Введите поисковую фразу, например "бензопила"</label>
      <div class="row">
        <div class="col-sm-8">
          <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
        </div>
        <div class="col-sm-4">
          <label for='button-search' class="login-page-btns search-page-btn">
            <input id="button-search" class='hidden' type="button" value="<?php echo $button_search; ?>"  />
            <span>Поиск <i class="material-icons">youtube_searched_for</i></span>
          </label>
        </div>
        <!--<div class="col-sm-3">
          <select name="category_id" class="form-control">
            <option value="0"><?php echo $text_category; ?></option>
            <?php foreach ($categories as $category_1) { ?>
            <?php if ($category_1['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_1['children'] as $category_2) { ?>
            <?php if ($category_2['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_2['children'] as $category_3) { ?>
            <?php if ($category_3['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-sm-3">
          <label class="checkbox-inline">
            <?php if ($sub_category) { ?>
            <input type="checkbox" name="sub_category" value="1" checked="checked" />
            <?php } else { ?>
            <input type="checkbox" name="sub_category" value="1" />
            <?php } ?>
            <?php echo $text_sub_category; ?></label>
        </div>
        <div class="col-sm-3">
          <p>
            <label class="checkbox-inline">
              <?php if ($description) { ?>
              <input type="checkbox" name="description" value="1" id="description" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="description" value="1" id="description" />
              <?php } ?>
              <?php echo $entry_description; ?></label>
          </p>
        </div>-->
      </div>
      
      
      
     
      
      <?php if ($products) { ?>
        <div class="sort-items-box">
          <div class="row">
            <?php foreach ($sorts as $key => $sort) { ?>
                <a href="<?php echo $sort['href']; ?>" class="<?php echo $key; ?> <?php echo $sort['direction']; ?>"><?php echo $sort['text']; ?></a>
            <?php } ?>
          </div>
        </div>
      <div id='ajaxProductContainer'>
      <div class="row">
        <?php foreach ($products as $product) { ?>
           <div class="product-layout product-grid col-xs-12 col-sm-6 col-md-4">
            <div class="product-thumb">
              <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
              <div class="images-box-category">
                <div class="image">
                  <div class="marks-box">
                    <?php if($product['bestseller']) { ?>
                      <span class='marks hit-mark'>Хит продаж</span>
                    <?php } ?>
                    <?php if($product['sale']) { ?>
                      <span class='marks special-mark'>Акция</span>
                    <?php } ?>
                    <?php if($product['latest']) { ?>
                      <span class='marks latest-mark'>Новинка</span>
                    <?php } ?>
                  </div>
                  <a href="<?php echo $product['popup']; ?>" data-fancybox="<?php echo $product['product_id']; ?>" data-caption="<?php echo $product['name']; ?>">
                      <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
                  </a>
                </div>
                
                <div class="category-additional-images">
                <ul class="additional-categoey-img-box list-unstyled">
                 <?php foreach ($product['images'] as $image) { ?>
                  <li>
                    <a href="<?php echo $product['thumb']; ?>" data-fancybox="<?php echo $product['product_id']; ?>" data-caption="<?php echo $product['name']; ?>">
                      <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
                    </a>
                  </li>
                 <?php } ?>
                </ul>
              </div>
            </div>
              <div>
                <div class="caption">
                  <?php if ($product['price']) { ?>
                  <p class="price">
                    <?php if (!$product['special']) { ?>
                    <span class='current-price'>
                      <span>цена: </span>
                      <span class='curent-price-value'><?php echo $product['price']; ?></span>
                    </span>
                    <?php } else { ?>
                    <span class="price-new current-price"><span>цена: </span><span class='curent-price-value'><?php echo $product['special']; ?></span></span> <span class="price-old"><?php echo $product['price']; ?></span>
                    <?php } ?>
                  </p>
                  <?php } ?>
                </div>
                <div class="button-group-category">
                  <div class='cart-add-category' data-toggle="tooltip" title="Добавить в корзину" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="material-icons">add_shopping_cart</i><span class="">Купить</span></div>
                  <div class='wishlist-add-category' data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="material-icons">favorite_border</i></div>
                  <div class='compare-add-category' data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="material-icons">compare_arrows</i></div>
                </div>
                
              </div>
              <div class="description-box">
                  <p><?php echo $product['description']; ?></p>
                </div>
            </div>
          </div>
        <?php } ?>
      </div>
      </div>
     
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      </div>
    <?php echo $column_right; ?></div>
     <div class="row">
      </div><?php echo $content_bottom; ?>
    </div>
</div>
<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';

	var search = $('#content input[name=\'search\']').prop('value');

	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');

	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}

	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');

	if (sub_category) {
		url += '&sub_category=true';
	}

	var filter_description = $('#content input[name=\'description\']:checked').prop('value');

	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script>
<script>
  Application.more = '<?php echo $more; ?>';
</script>
<?php echo $footer; ?>