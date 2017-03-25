<div class="clearfix">
  <div class='home-products-name category-title'>
    <h2>
      <a class='more-link' href='<?php echo $more; ?>'><?php echo $name; ?></a>
    </h2>
  </div>
  <?php foreach ($products as $product) { ?>
  <div class="product-layout product-grid col-xs-12 col-sm-6 col-md-3">
    <div class="product-thumb">
      <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
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
<div class='more'>
  <a class='more-link' href='<?php echo $more; ?>'>Смотреть все</a>
</div>