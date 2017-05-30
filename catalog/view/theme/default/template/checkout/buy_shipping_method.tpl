<?php if ($error_warning) { ?>
<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($shipping_methods) { ?>
<p><strong><?php echo $text_shipping_method; ?></strong></p>
<?php foreach ($shipping_methods as $shipping_method) { ?>
<?php if (!$shipping_method['error']) { ?>
<?php foreach ($shipping_method['quote'] as $quote) { ?>
<div class="radio new-input-box">
  <?php if ($quote['code'] == $code || !$code) { ?>
    <?php $code = $quote['code']; ?>
    <input type="radio" name="shipping_method" id='<?php echo $quote['code']; ?>' value="<?php echo $quote['code']; ?>" checked="checked" data-cost="<?php echo $quote['cost']; ?>" />
    <?php } else { ?>
    <input type="radio" name="shipping_method" id='<?php echo $quote['code']; ?>' value="<?php echo $quote['code']; ?>" data-cost="<?php echo $quote['cost']; ?>" />
    <?php } ?>
    
  <label for='<?php echo $quote['code']; ?>'>
    <?php echo $quote['title']; ?> - <?php echo $quote['text']; ?>
  </label>
</div>
<?php if($quote['code'] == 'novaposhta.novaposhta'){ ?>
    <select name='novaposhta-select' class='sh-additional selectpicker' id='novaposhta'>
      <option value="" disabled selected>Выберите отделение</option>
      <?php foreach($quote['point'] as $point) { ?>
        <option><?php echo $point['name']; ?></option>
      <?php } ?>
    </select>
<?php } ?>

<?php } ?>
<?php } else { ?>
<div class="alert alert-danger"><?php echo $shipping_method['error']; ?></div>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript">
    $('.selectpicker').selectpicker();
    $('input[name=\'shipping_method\'').change(function(){
        selectShipping();
    });
</script>