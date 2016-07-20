<footer>
  <div class="container">
    <div class="row">
			<div class="col-sm-4">
				<h5>Contact Us</h5>
				<p>If you have any questions please get in touch:<br /><i class="fa fa-telephone"></i> <b>01305 263444</b><br /><i class="fa fa-envelope"></i> <a href="<?php echo $contact; ?>">Send us an email</a></p>
				<p><b>Qwikfast Trade &amp; DIY Supplies</b><br />
					Unit 1A Poundbury West Industrial Estate<br />
					Poundbury Road<br />
					Dorchester, Dorset. DT1 2PG
				</p>
			</div>
			<div class="col-sm-4">
				<h5>Find Us</h5>
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2526.1596646379235!2d-2.4528366842589446!3d50.716976979513056!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x487259e852557779%3A0xff1466351b6878b8!2sQwikfast+Trade+%26+DIY+Supplies!5e0!3m2!1sen!2suk!4v1450784519309" width="100%" height="280" frameborder="0" style="border:0" allowfullscreen></iframe>
			</div>
      <?php if ($informations) { ?>
      <div class="col-sm-4">
        <h5><?php echo $text_information; ?></h5>
        <ul class="list-styled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
		<?php /*
      <?php if ($informations) { ?>
      <div class="col-sm-3">
        <h5><?php echo $text_information; ?></h5>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
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
        <h5><?php echo $text_extra; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
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
			*/ ?>
    </div>
  </div>
	<div class="bottom">
		<div class="container">
			<div class="row">
				<div class="col-xs-6 col-sm-3">
					2015 Qwikfast 
				</div>
				<div class="col-xs-6 col-sm-3 pull-right text-right">
            <a href="http://mediaorb.co.uk" rel="nofollow" class="website-by">
                <img src="https://my.mediaorb.co.uk/branding/footers/mediaorb-footer-10-light.png" alt="Media Orb Logo" style="margin:5px 0;"/>
            </a>
				</div>
				<div class="col-xs-12 col-sm-6 text-center">
					
          <a href="<?php echo $return; ?>"><?php echo $text_return; ?></a> | 
          <a href="index.php?route=information/information&information_id=6">Shipping &amp; Delivery</a> | 
          <a href="index.php?route=information/information&information_id=5">Terms &amp; Conditions</a>
				</div>
			</div>
		</div>
	</div>
</footer>

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->

</body></html>