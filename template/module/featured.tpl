<div class="module panel panel-default <?php echo str_replace('_','-',$position); ?> <?php echo basename(__FILE__, '.tpl') ?>">
<?php if($position == 'column_right' || $position == 'column_left'): ?>
	<div class="panel-heading">
  	<h4 class="panel-title">
  		<?php echo $heading_title; ?>
    </h4>
  </div>
  <div class="panel-body">
    <div class="product-carousel product-carousel-vertical owl-carousel owl-carousel-init" data-items="1">
      <?php foreach(array_chunk($products , 4) as $products_chunk) : ?>
        <div>
          <ul class="product-mini-list">
          <?php foreach($products_chunk as $product) : ?>
            <li>
              <div class="row">
                <div class="col-xs-3 image">
                  <a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive" /></a>
                </div>
                <div class="col-xs-7 description">
                  <a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>"><?php echo $product['name']; ?></a>
                  <br />
                  <?php if ($product['price']) { ?>
                  <div class="price text-danger">
                    <?php if (!$product['special']) { ?>
                    <?php echo $product['price']; ?>
                    <?php } else { ?>
                    <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                    <?php } ?>
                  </div>
                  <?php } ?>
                </div>
                <div class="col-xs-2 add-to-cart">
                  <button type="button" class="btn" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-basket"></i></button>
                </div>
              </div>
            </li>
          <?php endforeach; ?>
          </ul>
        </div>
      <?php endforeach; ?>
    </div>
  </div>
<?php else: ?>


<div class="panel-heading"><h4 class="panel-title"><?php echo $heading_title; ?></h4></div>
<div class="panel-body">
  <div class="row product-carousel owl-carousel owl-carousel-init" data-items="1" data-sm-items="2" data-md-items="4" data-md-center="false">
    <?php foreach ($products as $product) { ?>
      <?php 
      ob_start();
      include(modification('catalog/view/theme/cf-opencart/template/product/_product.tpl')); 
      $product = ob_get_contents(); 
      ob_end_clean();
      $product = preg_replace('/class="product-layout .*?"/','class="product-layout product-grid"', $product);
      echo $product;
      ?>
    <?php } ?>
  </div>
</div>
<?php /*
  ob_start(); 
  include(modification(DIR_APPLICATION . 'view/theme/default/template/module/' . basename(__FILE__)));
  $module = ob_get_contents(); 
  ob_end_clean();
  
  //Product Grid
  $module = preg_replace('/class="row(.*?)"/','class="$1 product-carousel owl-carousel owl-carousel-init" data-items="1" data-sm-items="2" data-md-items="4" data-md-center="false"', $module);
  $module = preg_replace('/class="product-layout .*?"/','class="product-layout product-grid"', $module);
  
  //Remove Compare
  $module = preg_replace("/<button.*?compare.add.*?<\/button>/", '', $module);
  
  $module = preg_replace('/fa-shopping-cart/','fa-shopping-basket', $module);
  //Add another title
  
  
  //Modify bottom
  //$module = preg_replace('/<div class="button-group.*?<\/div>/s','<button onclick="window.location = $(this).parents(\'.product-thumb\').find(\'.image > a\').attr(\'href\');" class="btn btn-primary view-product">View Product</button>', $module);
  $module = preg_replace('/<p>.*?<\/p>/s','', $module);
  
  $srcset_sizes = '(min-width: 1200px) 260px, (min-width: 980px) 210px, (min-width: 768px) 342px, 100vw';
  $module = preg_replace('/(srcset=".*?")/s','$1 sizes="'.$srcset_sizes.'"', $module);
  
  $module = preg_replace('/(<\/h4>)\s+(<p class="price)/s', '$1<div class="rating no-reviews">No reviews</div>$2', $module);
  
  //Wrap Header
  if(preg_match('/<h3(.*?)<\/h3>/', $module) !== false){
    echo preg_replace('/<h3(.*?)<\/h3>/', '<div class="panel-heading"><h4 class="panel-title"$1</h4></div><div class="panel-body"><div class="row">', $module) . "</div></div>";
  } else {
    echo $module;
  }
  */
  
  
endif;
?>
</div>