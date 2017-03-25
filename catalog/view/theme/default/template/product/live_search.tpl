<div class='transparent-overley'></div>
<div class="ajaxResult">
  <div class="row">
  <?php if ($products) { ?>
    <?php foreach ($products as $product) { ?>
    <div class="product-layout product-list col-xs-12">
      <div class="product-thumb">
        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
        <div class="caption">
          <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
          <p><?php echo $product['description']; ?></p>
          <?php if ($product['price']) { ?>
          <p class="price">
            <?php if (!$product['special']) { ?>
            <?php echo $product['price']; ?>
            <?php } else { ?>
            <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
            <?php } ?>
          </p>
          <?php } ?>
        </div>
      </div>
    </div>
    <?php } ?>
  </div>
  <div class='live-srch-down-buttons'>
    <div class='count__info'><i class="material-icons">info_outline</i> Всего найдено: <?php echo $count; ?></div>
    <div><a href='<?php echo $more; ?>' class='watch__all'>Смотреть все <i class="material-icons">navigate_next</i></a></div>
  </div>
  <?php } else { ?>
    <div class='nothing-to-find'>По вашему запросу ничего не найдено!</div>
  <?php } ?>
</div>
     