<div class="clearfix">
  <div class='home-products-name category-title'>
    <h2>
      <a class='more-link' href='<?php echo $more; ?>'><span class='popular-from'>Популярные товары из категории:</span> <?php echo $name; ?> </a>
    </h2>
    <div class='more'>
      <a class='more-link watches-more' href='<?php echo $more; ?>'>Смотреть все <i class="material-icons">arrow_forward</i></a>
    </div>
  </div>
  <div class="row">
  <?php foreach ($products as $product) { ?>
  <div class="product-layout product-grid col-xs-12 col-sm-6 col-md-3">
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
<!--<div class='home-products-name category-title'>
  <h2>
    <a class='more-link' href='<?php echo $more; ?>'><span class='popular-from'>Категория:</span> <?php echo $name; ?> </a>
  </h2>
  <div class='more'>
    <a class='more-link watches-more' href='<?php echo $more; ?>'>Перейти в категорию <i class="material-icons">arrow_forward</i></a>
  </div>
</div>-->