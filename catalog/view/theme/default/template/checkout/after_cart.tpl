<div class="modal-with-this-box">
    <h2 class="modal-main-messege-text hidden-sm hidden-md hidden-lg visible-xs"><i class="material-icons">check</i> Товар добавлен в корзину</h2>
    <div class="abou-your-product-box">
        <div class="img-products-box">
            <div class="marks-box">
                <?php if($bestseller) { ?>
                  <span class='marks hit-mark'>Хит продаж</span>
                <?php } ?>
                <?php if($sale) { ?>
                  <span class='marks special-mark'>Акция</span>
                <?php } ?>
                <?php if($latest) { ?>
                  <span class='marks latest-mark'>Новинка</span>
                <?php } ?>
            </div>
            <a href="<?php echo $href; ?>">
                <img src="<?php echo $thumb; ?>" alt="<?php echo $name; ?>" class='img-responsive'>
            </a>
        </div>
        <div class="text-products-box">
            <h2 class="modal-main-messege-text hidden-xs"><i class="material-icons">check</i> Товар добавлен в корзину</h2>
            <div class="product-name-with-box">
                <a href="<?php echo $href; ?>"><?php echo $name; ?></a>
            </div>
            <div class="with-this-modal-price-box">
                <?php if (!$special) { ?>
                  <?php echo $price; ?>
                <?php } else { ?>
                    <span class="price-new"><?php echo $special; ?></span>
                    <span class="price-old"><?php echo $price; ?></span>
                <?php } ?>
            </div>
            <div class="with-this-modal-btns-box hidden-xs">
                <a href="<?php echo $checkout; ?>" class="make-it-order">Оформить заказ</a>
                <a href="" data-dismiss="modal" class="make-it-shopping">Продолжить покупки</a>
            </div>
        </div>
        </div>
        <?php if($products) { ?>
        <div class="modal-related-products">
            <h4>С этим товаром часто покупают</h4>
            <div id="slideshow-mod-after" class="owl-carousel" style="opacity: 1;">
                <?php foreach ($products as $product) { ?>
                    <div class="item">
                        <div class="abou-your-product-box">
                            <div class="img-products-box">
                                <a href="<?php echo $product['href']; ?>">
                                    <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" class='img-responsive'>
                                </a>
                            </div>
                            <div class="text-products-box">
                                <div class="product-name-with-box">
                                    <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                </div>
                                <div class="with-this-modal-price-box">
                                    <?php if (!$product['special']) { ?>
                                      <?php echo $product['price']; ?>
                                    <?php } else { ?>
                                        <span class="price-new"><?php echo $product['special']; ?></span>
                                        <span class="price-old"><?php echo $product['price']; ?></span>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>
        <?php } ?>
    </div>
    <div class="with-this-modal-btns-box visible-xs hidden-sm hidden-md hidden-lg">
        <a href="<?php echo $checkout; ?>" class="make-it-order">Оформить заказ</a>
        <a href="" class="make-it-shopping">Продолжить покупки</a>
    </div>
</div>
<script type="text/javascript">
    $('#slideshow-mod-after').owlCarousel({
        items: 3,
        autoPlay: 5000,
        singleItem: false,
        navigation: true,
        navigationText: ['<i class="material-icons">navigate_before</i>', '<i class="material-icons">navigate_next</i>'],
        pagination: false
    });
</script>