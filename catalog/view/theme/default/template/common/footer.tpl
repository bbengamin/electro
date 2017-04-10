<footer>
  <div class="container">
    <div class="row">
      <?php if ($informations) { ?>
      <div class="col-sm-3">
        <h5><?php echo $text_information; ?></h5>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
           <li><a href="/special"><?php echo $text_special; ?></a></li>
        </ul>
      </div>
      <?php } ?>
      <div class="col-sm-3">
        <h5><?php echo $text_service; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_account; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5>Контакты</h5>
        <ul class="list-unstyled contact-footer-box">
          <li><a href='mailto:admin@admin.com'><i class="material-icons">contact_mail</i><span>admin@admin.com</span></a></li>
          <li><a href='tel:+38(050)465-65-78'><i class="material-icons">contact_phone</i><span>+38(050)465-65-78</span></a></li>
          <li><a href='tel:+38(067)465-65-78'><i class="material-icons">contact_phone</i><span>+38(067)465-65-78</span></a></li>
          <!--<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>-->
        </ul>
      </div>
      
    </div>
<!--    <hr>
    <p><?php echo $powered; ?></p>-->
  </div>
  
  <div class="bought hidden">
    <?php echo $bought; ?>
  </div>
</footer>

<!-- modal-call-back-header -->
<div id="modal-call-back-header" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><i class="material-icons">close</i></button>
        <h4 class="modal-title">Заполните форму<br> и мы Вам перезвоним!</h4>
      </div>
      <div class="modal-body">
        <div class="form-box">
          <form id="form-call-back-header">
            <div class="input-field">
              <input type='text' placeholder='Ваше имя...' name='name'>
            </div>
            <div class="input-field">
              <input type='text' placeholder='+38(067)465-65-78' name='phone'>
            </div>
            <div class="input-field">
              <button type='submit' id="submit-call-back-header">Отправить</button>
            </div>
          </form>
          <h4 class='modal-thanks'>Спасибо за заявку, мы свяжемся с Вами в ближайшее время</h4>
        </div>
      </div>
    </div>

  </div>
</div>

<!-- Modal after-->
<div class="modal" id="modal-after" tabindex="-1" role="dialog" aria-labelledby="call-back-modal-Label" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<div class="modal-body" id="modal-after-body">

			</div>
		</div>
	</div>
</div>


<div class='left-side'>
  <div class='button-up'><span>Вверх <i class="material-icons">keyboard_arrow_up</i></span></div>
</div>

<script crossorigin="anonymous" async type="text/javascript" src="//api.pozvonim.com/widget/callback/v3/a3fa4103fc741f384a127fa598aa51db/connect" id="check-code-pozvonim" charset="UTF-8"></script> 
</body></html>