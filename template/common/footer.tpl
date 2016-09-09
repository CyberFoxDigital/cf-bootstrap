<footer class="content-info">
  <div class="container">
    <div class="row">
      <?php if ($informations) { ?>
      <div class="col-sm-4 col-md-3">
        <h5><?php echo $text_information; ?></h5>
        <ul class="nav">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
        </ul>
      </div>
      <?php } ?>
      <div class="col-sm-4 col-md-3">
        <h5><?php echo $text_service; ?></h5>
        <ul class="nav">
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
      </div>
      <?php /* 
      <div class="col-sm-4 col-md-3">
        <h5><?php echo $text_extra; ?></h5>
        <ul class="nav">
          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
        </ul>
      </div>
      */ ?>
      <div class="col-sm-4 col-md-3">
        <h5><?php echo $text_account; ?></h5>
        <ul class="nav">
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-12 col-md-3">
        <h5><?php echo $text_contact; ?></h5>
        <dl class="dl-horizontal dl-icon" itemscope="" itemtype="http://schema.org/LocalBusiness">
          <dt><i class="fa fa-map-marker"></i></dt>
          <dd>
          	<strong>Address:</strong><br />
          	<meta itemprop="logo" content="https://dev.cyberfoxdigital.co.uk/media/logo.jpg">
            <meta itemprop="url" content="https://dev.cyberfoxdigital.co.uk">
            <strong class="companyName" itemprop="name">Model Supplies</strong><br />
            <span itemprop="address" itemscope="" itemtype="http://schema.org/PostalAddress">
            	<span itemprop="streetAddress" class="streetAddress">Unit 8, Fairwood Trading Estate</span><br />
              <span itemprop="addressLocality">Dilton Marsh, Westbury</span><br />
              <span itemprop="addressRegion">Wiltshire</span>, <span itemprop="postalCode">BA13 3SW</span>
            </span>
          </dd>
          <dt><i class="fa fa-phone"></i></dt>
          <dd>
          	<strong>Phone Number:</strong><br />
          	<a href="tel:01373859678" itemprop="telephone" content="01373859678">01373 85 9678</a>
          </dd>
          <dt><i class="fa fa-envelope"></i></dt>
          <dd>
          	<strong>Email Address:</strong><br />
            <a href="mailto:info@modelsupplies.net">info@modelsupplies.net</a>
          </dd>
        </dl>
      </div>
    </div>
  </div>
  <div class="bottom">
    <div class="container">
      <div class="row">
        <div class="col-xs-6">
        	<?php echo preg_replace("/.*?<br \/>/is", '', $powered); ?>
        </div>
        <div class="col-xs-6 text-right">
          <a href="https://cyberfoxdigital.co.uk/services/responsive-web-design/" title="eCommerce Web design by Cyber Fox"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAKcAAAAUCAMAAADflt0FAAAAYFBMVEUAAAD////0NTX////0NTX////0NTX////0NTX////0NTX////0NTX////0NTX////0NTX////0NTX////0NTX////0NTX////0NTX////////////0NTX////0NTX///+dLjLhAAAAHnRSTlMAABAQICAwMEBAUFBgYHBwgICQkKCgsLDAwNDg8PCQO78sAAAC4ElEQVRIx+3W3W7jNhCG4dfLMsxUyzAsyyojhv7u/y57IP/F6wBbIEBbYOdEsCRYj2bIGXH4fwS/nF/rjDUAEGrkQ7jxMELej1ZvTj69vD4BT68vT/sJ8UVxdpoKAEX2c864Qrtz/nk8Ho9//fZ2PB6Pf3zmrENar8lwf/z/zd39evHinAOAMX/SCTA+Or8fb+P5sdMlSfMC1Scp3+/TD07fDDB3I/ahHiFtms0NzGeLAObAWKBUc4Yks7ZOebyk8xKvACpjjAVPwLICJtVgUy1aJJghkUsEUq0LJEvVducpAbHUJWAWD9EM89yBnt1gCdQGo8bYZdQthbanW4GkDutivmfLVELoHeDtgXNNpBlLB9YMVK3AUnNVxSSkIc1IlaSGSzvw7FympBGbZpyqmIcZCPNc5ziwDWAaIwNKAOtCqxNmuDgdWBzg5YPzO4Ai0EuYEOaHNF2dfdnUo1SzFF3qdq17Zarbph6GhrYD5vRCabhBXt3F0k7rU+7u+7otjRE3S87F2c5Yvr3fMN+/XdZnrayZ0j9xBhb5olnr0OJq5/U53D2bBpjGwSSlA+akwYi4kTcL4dZpZmZhT3PaKK3Wq7NenPx+v40uzmVlSwBNHSjerk7I8qLp7p793G9OL2TaIEqHODXCAXPYqoMbY4Gsm7qnmy3eC3G4PXRed/z782k373WHsWwAZKmGNFWqZqoSUmbValKg1njvjFKiyA8uqe3OrAxu9EreBKOQVhl15HBu600RtrHTPN85z9D3U5tnbktsM0Cb5bbfjGCnviNpSsbQHNq4d7JKm7RkKUtGahAcaInUhyeHtGq2kqBu2vpp/HQgN0gNbBspZfYfezy/3zJp2bUmICmc5libkkco7l3CPY8t7w/riebp3Ofz6f5NvrB6OTTvfFk8vd8wr5HvH1HUyfJ/Oje/EPr2gBnG/VgL0pDqv+d8OKzHjxUrU7Py33KG+FXfS7++k780/ga3oFMrR2KqdgAAAABJRU5ErkJggg==" alt="Made with love by Cyber Fox" /></a>
        </div>
      </div>
    </div>
  </div>
</footer>

<div class="modal fade" id="genericModal" tabindex="-1" role="dialog" aria-labelledby="genericModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="genericModalLabel"></h4>
      </div>
      <div class="modal-body"></div>
    </div>
  </div>
</div>

</body></html>