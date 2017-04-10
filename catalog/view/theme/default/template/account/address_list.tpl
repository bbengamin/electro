<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h2><?php echo $text_address_book; ?></h2>
      <?php if ($addresses) { ?>
      <table class="table table-bordered table-hover">
        <?php foreach ($addresses as $result) { ?>
        <tr>
          <td class="text-left"><?php echo $result['address']; ?></td>
          <td class="text-right">
            <div class="buttons-holder">
              <a href="<?php echo $result['update']; ?>" class="new-butons-item edit-info-btn">
                <?php echo $button_edit; ?> <i class="material-icons">mode_edit</i>
              </a> 
              <a href="<?php echo $result['delete']; ?>" class="new-butons-item delete-info-btn">
                <?php echo $button_delete; ?> <i class="material-icons">delete_forever</i>
              </a>
            </div>
          </td>
        </tr>
        <?php } ?>
      </table>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-left">
            <a href="<?php echo $back; ?>" class="login-page-btns">
              <?php echo $button_back; ?>
            </a>
          </div>
          <div class="pull-right">
            <a href="<?php echo $add; ?>" class="login-page-btns"><?php echo $button_new_address; ?> <i class="material-icons">add_location</i></a>
          </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>