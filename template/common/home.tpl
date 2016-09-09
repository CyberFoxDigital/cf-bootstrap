<?php echo $header; ?>
<section class="slideshow-area full-width">
  <div class="container">
    <div class="row">
      <div class="slideshow-wrapper col-sm-8"><?php echo $slideshow; ?></div>
      <div class="banners-wrapper col-sm-4"><?php echo $banners; ?></div>
    </div>
  </div>
</section>
<section class="content-top-wrapper full-width">
  <div class="container">
    <div class="row">
      <?php echo preg_replace('/col-(xs|sm|md|lg)-3/', 'col-$1-4', $column_left, 1); ?>
      <?php if ($column_left && $column_right) { ?>
      <?php $class = 'col-sm-4'; ?>
      <?php } elseif ($column_left || $column_right) { ?>
      <?php $class = 'col-sm-8'; ?>
      <?php } else { ?>
      <?php $class = 'col-sm-12'; ?>
      <?php } ?>
      <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?></div>
      <?php echo preg_replace('/col-(xs|sm|md|lg)-3/', 'col-$1-4', $column_right, 1); ?>
    </div>
  </div>
</section>
  
<section class="content-bottom-wrapper full-width">
  <div class="container">
    <div class="row">
    	<div class="col-sm-12"><?php echo $content_bottom; ?></div>
    </div>
  </div>
</section>
<?php echo $footer; ?>