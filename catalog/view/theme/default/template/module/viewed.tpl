<?php if ($products) { ?>
<h3 class='related-title'><?php echo $heading_title; ?></h3>
<div class="row owl-carousel" id='viewed-products'>
  <?php foreach ($products as $product) { ?>
    <div class="product-layout item">
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
<?php } ?>
<script type="text/javascript"><!--
$('#viewed-products').owlCarousel({
	items: 4,
	autoPlay: 3000,
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: false
});
--></script>
