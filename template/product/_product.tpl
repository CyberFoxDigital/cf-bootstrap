<div class="product-layout product-grid col-xs-12">
  <div class="product-thumb">
    <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
    <div>
      <div class="caption">
        <h4><a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>"><?php echo $product['name']; ?></a></h4>
        <?php /*
        <p class="description"><?php echo $product['description']; ?></p>
        */ ?>
        <?php if ($product['rating']) { ?>
        <div class="rating text-center">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($i <= $product['rating']) { ?>
          <i class="fa fa-star"></i>
          <?php } else { ?>
          <i class="fa fa-star empty"></i>
          <?php } ?>
          <?php } ?>
        </div>
        <?php } else { ?>
        <div class="rating text-center no-reviews">
          <div class="text-muted small">No Reviews</div>
        </div>
        <?php } ?>
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span>
          <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
          <?php if ($product['tax']) { ?>
          <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
      </div>
      <div class="button-group">
        <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
        <?php /*
        <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button> */ ?>
      </div>
    </div>
  </div>
</div>