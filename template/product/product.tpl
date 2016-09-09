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
      <div class="row">
      
        <?php if ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-4'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-4'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?> sticky sm-pull-right">
           <div id="product" data-product-id="<?php echo $product_id; ?>">
              <h1 class="h2 product-title"><?php echo $heading_title; ?></h1>
              <ul class="list-unstyled">
                <?php if ($manufacturer) { ?>
                <li><strong><?php echo $text_manufacturer; ?></strong> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
                <?php } ?>
                <li><strong><?php echo $text_model; ?></strong> <?php echo $model; ?></li>
                <?php if ($reward) { ?>
                <li><strong><?php echo $text_reward; ?></strong> <?php echo $reward; ?></li>
                <?php } ?>
                <li><strong><?php echo $text_stock; ?></strong> <?php echo $stock; ?></li>
                <?php if ($review_status) { ?>
                <li class="rating">
                    <?php if($rating > 0) { ?>
                      <?php for ($i = 1; $i <= 5; $i++) { ?>
                        <?php if ($rating < $i) { ?>
                          <i class="fa fa-star-o"></i>
                        <?php } else { ?>
                          <i class="fa fa-star"></i>
                        <?php } ?>
                        <?php } ?>
                    <?php } ?>
                    <strong><?php echo trim(preg_replace('/\(\d+\)/s','', $tab_review)); ?>:</strong> <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a> <a class="btn btn-xs btn-primary pull-right" href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a>
                </li>
                <?php } ?>
              </ul>
              <?php if ($price) { ?>
              <ul class="list-unstyled">
                <?php if (!$special) { ?>
                <li>
                  <div class="price h2 text-danger"><?php echo $price; ?></div>
                </li>
                <?php } else { ?>
                <li><span style="text-decoration: line-through;"><?php echo $price; ?></span></li>
                <li>
                  <div class="price-special h2 text-danger"><?php echo $special; ?></div>
                </li>
                <?php } ?>
                <?php if ($tax) { ?>
                <li class="text-muted tax"><?php echo $text_tax; ?> <span class="price-tax"><?php echo $tax; ?></span></li>
                <?php } ?>
                <?php if ($points) { ?>
                <li><?php echo $text_points; ?> <?php echo $points; ?></li>
                <?php } ?>
                <?php if ($discounts) { ?>
                <li>
                  <hr>
                </li>
                <?php foreach ($discounts as $discount) { ?>
                <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
                <?php } ?>
                <?php } ?>
              </ul>
              <?php } ?>
              <?php if ($options) { ?>
              <hr>
              <h4><?php echo $text_option; ?></h4>
              <?php foreach ($options as $option) { ?>
              <?php if ($option['type'] == 'select') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                  <option value=""><?php echo $text_select; ?></option>
                  <?php foreach ($option['product_option_value'] as $option_value) { ?>
                  <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                  <?php if ($option_value['price']) { ?>
                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                  <?php } ?>
                  </option>
                  <?php } ?>
                </select>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'radio') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label"><?php echo $option['name']; ?></label>
                <div id="input-option<?php echo $option['product_option_id']; ?>">
                  <?php foreach ($option['product_option_value'] as $option_value) { ?>
                  <div class="radio">
                    <label>
                      <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                      <?php echo $option_value['name']; ?>
                      <?php if ($option_value['price']) { ?>
                      (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                      <?php } ?>
                    </label>
                  </div>
                  <?php } ?>
                </div>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'checkbox') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label"><?php echo $option['name']; ?></label>
                <div id="input-option<?php echo $option['product_option_id']; ?>">
                  <?php foreach ($option['product_option_value'] as $option_value) { ?>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                      <?php if ($option_value['image']) { ?>
                      <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
                      <?php } ?>
                      <?php echo $option_value['name']; ?>
                      <?php if ($option_value['price']) { ?>
                      (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                      <?php } ?>
                    </label>
                  </div>
                  <?php } ?>
                </div>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'image') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label"><?php echo $option['name']; ?></label>
                <div id="input-option<?php echo $option['product_option_id']; ?>">
                  <?php foreach ($option['product_option_value'] as $option_value) { ?>
                  <div class="radio">
                    <label>
                      <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                      <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
                      <?php if ($option_value['price']) { ?>
                      (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                      <?php } ?>
                    </label>
                  </div>
                  <?php } ?>
                </div>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'text') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'textarea') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'file') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label"><?php echo $option['name']; ?></label>
                <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'date') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                <div class="input-group date">
                  <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                  <span class="input-group-btn">
                  <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'datetime') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                <div class="input-group datetime">
                  <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'time') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                <div class="input-group time">
                  <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
              <?php } ?>
              <?php } ?>
              <?php } ?>
              <?php if ($recurrings) { ?>
              <hr>
              <h3><?php echo $text_payment_recurring ?></h3>
              <div class="form-group required">
                <select name="recurring_id" class="form-control">
                  <option value=""><?php echo $text_select; ?></option>
                  <?php foreach ($recurrings as $recurring) { ?>
                  <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                  <?php } ?>
                </select>
                <div class="help-block" id="recurring-description"></div>
              </div>
              <?php } ?>
              <hr />
              <div class="add-to-cart">
                <div class="form-group">
                  <div class="input-group plus-minus">
                    <span class="input-group-btn"><button class="btn btn-default minus" type="button"><i class="fa fa-minus"></i></button></span>
                    <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
                    <span class="input-group-btn"><button class="btn btn-default plus" type="button"><i class="fa fa-plus"></i></button></span>
                  </div>
                </div>
                <div class="form-group">
                  <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-block btn-primary btn-lg"><?php echo $button_cart; ?></button>
                  <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                </div>
                <div class="form-group">
                  <button type="button" data-toggle="tooltip" class="btn btn-block btn-sm btn-link" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart"></i> <?php echo $button_wishlist; ?></button>
                </div>
                <?php if ($minimum > 1) { ?>
                <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
                <?php } ?>
              </div>
            </div>
        </div>
        
        
        <?php if ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-8'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-8'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
          <?php if ($thumb || $images) { ?>
          <ul class="thumbnails">
            <?php if ($thumb) { ?>
            <li><a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
            <?php } ?>
            <?php if ($images) { ?>
            <?php foreach ($images as $image) { ?>
            <li class="image-additional"><a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
            <?php } ?>
            <?php } ?>
          </ul>
          <?php } ?>
          
          <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
          	<?php if(!empty(trim($description))) { ?>
            <div class="panel panel-primary">
              <div class="panel-heading" role="tab" id="heading-description">
                <h4 class="panel-title">
                  <a role="button" data-toggle="collapse" href="#tab-description" aria-expanded="true" aria-controls="tab-description">
                    <?php echo $tab_description; ?>
                  </a>
                </h4>
              </div>
              <div id="tab-description" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading-description">
                <div class="panel-body">
                  <?php echo $description; ?>
                </div>
              </div>
            </div>
            <?php } ?>
            <?php if ($attribute_groups) { ?>
            <div class="panel panel-default">
              <div class="panel-heading" role="tab" id="heading-description">
                <h4 class="panel-title">
                  <a role="button" data-toggle="collapse" href="#tab-specification" aria-expanded="true" aria-controls="tab-specification">
                    <?php echo $tab_attribute; ?>
                  </a>
                </h4>
              </div>
              <div id="tab-specification" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading-specification">
                <div class="panel-body">
                  <table class="table table-hover table-striped table-bordered">
                    <?php foreach ($attribute_groups as $attribute_group) { ?>
                    <thead>
                      <tr>
                        <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                      </tr>
                    </thead>
                    <tbody>
                      <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                      <tr>
                        <td><?php echo $attribute['name']; ?></td>
                        <td><?php echo $attribute['text']; ?></td>
                      </tr>
                      <?php } ?>
                    </tbody>
                    <?php } ?>
                  </table>
                </div>
              </div>
            </div>
  					<?php } ?>
            <?php if ($review_status) { ?>
            <div class="panel panel-default">
              <div class="panel-heading" role="tab" id="heading-review">
                <h4 class="panel-title">
                  <a role="button" data-toggle="collapse" href="#tab-review" aria-expanded="true" aria-controls="tab-review">
                    <?php echo $tab_review; ?>
                  </a>
                </h4>
              </div>
              <div id="tab-review" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading-review">
                <div class="panel-body">
                  <form class="form form-horizontal" id="form-review">
                    <div id="review"></div>
                    <hr />
                    <h3><?php echo $text_write; ?></h3>
                    <?php if ($review_guest) { ?>
                    <div class="form-group required">
                      <label class="control-label col-sm-4" for="input-name"><?php echo $entry_name; ?></label>
                      <div class="col-sm-8">
                        <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
                      </div>
                    </div>
                    <div class="form-group required">
                      <label class="control-label col-sm-4" for="input-review"><?php echo $entry_review; ?></label>
                      <div class="col-sm-8">
                        <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                        <div class="help-block"><?php echo $text_note; ?></div>
                      </div>
                    </div>
                    <div class="form-group required">
                      <label class="control-label col-sm-4"><?php echo $entry_rating; ?></label>
                      <div class="col-sm-8">
                        <div class="star-rating-input">
                        	<i class="fa fa-star text-muted" data-value="1"></i>
                        	<i class="fa fa-star text-muted" data-value="2"></i>
                        	<i class="fa fa-star text-muted" data-value="3"></i>
                        	<i class="fa fa-star text-muted" data-value="4"></i>
                        	<i class="fa fa-star text-muted" data-value="5"></i>
                          <input type="hidden" name="rating" value="0" />
                        </div>
                      </div>
                    </div>
                    <?php echo $captcha; ?>
                    <div class="buttons clearfix">
                      <div class="pull-right">
                        <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                      </div>
                    </div>
                    <?php } else { ?>
                    <?php echo $text_login; ?>
                    <?php } ?>
                  </form>
                </div>
              </div>
            </div>
          	<?php } ?>
          </div>
        </div>
      </div>
      <?php if ($products) { ?>
      <h3><?php echo $text_related; ?></h3>
      <div class="row <?php if ($column_left && $column_right) { ?>both-sidebars<?php } elseif ($column_left || $column_right) { ?>one-sidebar<?php } else { ?>no-sidebar<?php } ?>">
        <?php foreach ($products as $product) { ?>
        	<?php include(modification('catalog/view/theme/cf-opencart/template/product/_product.tpl')); ?>
        <?php } ?>
      </div>
      <?php } ?>
      <?php if ($tags) { ?>
      <p><?php echo $text_tags; ?>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        <?php } else { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>
      </p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
