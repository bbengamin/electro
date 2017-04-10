<?php echo $header; ?>
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
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal row">
        <div class="col-sm-8">
            <div class="chekout-box-item">
                <div class="row">
                   <h3 class='checkout-title-text'><?php echo $text_password; ?></h3>
                </div>
        <fieldset>
          
          <div class="form-group required">
            <label class="col-sm-12 control-label" for="input-password"><?php echo $entry_password; ?></label>
            <div class="col-sm-12">
              <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
              <?php if ($error_password) { ?>
              <div class="text-danger"><?php echo $error_password; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-12 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
            <div class="col-sm-12">
              <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
              <?php if ($error_confirm) { ?>
              <div class="text-danger"><?php echo $error_confirm; ?></div>
              <?php } ?>
            </div>
          </div>
        </fieldset>
        <div class="buttons clearfix">
          <div class="pull-left">
            <a href="<?php echo $back; ?>" class="login-page-btns">
              <?php echo $button_back; ?>
            </a>
          </div>
          <div class="pull-right">
            <label for='reg-input' class="login-page-btns register-page-btns">
              <input type="submit" id='reg-input' value="<?php echo $button_continue; ?>" class="hidden" />
              <span>Сохранить <i class="material-icons">save</i></span>
            </label>
           
          </div>
        </div>
         </div>
          </div>
      </form>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>