<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
    
    <div class='home-categories'>
      <div class='category-title title-category-upper'>
        <h2>Популярные категории</h2>
      </div>
      <div class="home-category-select clearfix">
        <?php foreach($categories as $category){ ?>
        <div class="category-item-home-p-wrap col-sm-3">
          <div class='category-item' data-id="<?php echo $category['category_id']; ?>">
            <div class='img'>
              <img src="<?php echo $category['image']; ?>" class='img-responsive' alt="<?php echo $category['name']; ?>">
            </div>
            <div class="cat-name">
              <span><?php echo $category['name']; ?></span>
            </div>
          </div>
          </div>
        <?php } ?>
      </div>
    </div>
    
    <div id='main-products-block' class='main-products'>
    </div>
    
    <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>