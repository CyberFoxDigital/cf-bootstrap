<div id="banner<?php echo $module; ?>" class="module banner owl-carousel owl-carousel-init" data-items="1">
  <?php foreach ($banners as $banner) { ?>
  <div class="item">
    <?php if ($banner['link']) { ?>
    <a class="banner-image" href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php if(!empty($banner['title'])){ ?>
    <h3 class="banner-caption"><a href="<?php echo $banner['link']; ?>"><?php echo $banner['title']; ?></a></h3>
    <?php } ?>
    <?php } else { ?>
    <div class="banner-image">
    	<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    </div>
    <?php if(!empty($banner['title'])){ ?>
    <h3 class="banner-caption"><?php echo $banner['title']; ?></h3>
    <?php } ?>
    <?php } ?>
  </div>
  <?php } ?>
</div>
