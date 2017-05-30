<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
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
    <div id="content" class="<?php echo $class; ?> wish-list-page"><?php echo $content_top; ?>
      <div class='category-title'>
        <h2><?php echo $heading_title; ?></h2>
      </div>
      <?php if ($products) { ?>
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
                
                <div class='compare-add-category' data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="material-icons">compare_arrows</i></div>
                <a class='compare-add-category' href="<?php echo $product['remove']; ?>" data-toggle="tooltip" title="Удалить из закладок"><i class="material-icons">delete_forever</i></a>
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
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="login-page-btns"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>