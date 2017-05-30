<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class='category-title'>
    <h2><?php echo $heading_title; ?></h2>
  </div>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    

    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
    
    <div class="categories clearfix">
      <div class="row">
        <?php foreach ($categories as $category) { ?>
          <div class="col-md-4 col-sm-6">
            <a href="<?php echo $category['href']; ?>" class='category-lists-item'>
              <div>
                <img src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>">
              </div>
              <span><?php echo $category['name']; ?></span>
            </a>
          </div>
        <?php } ?>
      </div>
    </div>
      <?php if ($products) { ?>
      <div class="row">
        <div class="sort-items-box">
          <?php foreach ($sorts as $key => $sort) { ?>
              <a href="<?php echo $sort['href']; ?>" class="<?php echo $key; ?> <?php echo $sort['direction']; ?>"><?php echo $sort['text']; ?></a>
          <?php } ?>
          <a class="mobile-filter-button visible-xs">Фильтр</a>
        </div>
      </div>
      <div id='ajaxProductContainer'>
        <div class="gear"></div>
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
                  <a href="<?php echo $product['href']; ?>">
                    <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
                  </a>
                </div>
                
                <div class="category-additional-images">
                <ul class="additional-categoey-img-box list-unstyled">
                 <?php foreach ($product['images'] as $image) { ?>
                  <li>
                    <a href="<?php echo $image['popup']; ?>" data-fancybox="<?php echo $product['product_id']; ?>" data-caption="<?php echo $product['name']; ?>">
                      <img src="<?php echo $image['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
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
      <?php if($more == 'true') { ?>
        <div class="load-more-products-box">
          <span class="load-more-products-btn"><span>Загрузить еще</span><i class="material-icons">keyboard_arrow_down</i></span>
        </div>
      <?php } ?>
      <div class="row desc-cat">
        <?php echo $description; ?>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="main-btn"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?></div>
    <?php echo $column_right; ?></div>
    <div class="row">
      <?php echo $content_bottom; ?>
    </div>
</div>
<script>
  Application.more = '<?php echo $more; ?>';
</script>
<?php echo $footer; ?>
