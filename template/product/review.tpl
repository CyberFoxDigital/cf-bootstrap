<?php if ($reviews) { ?>
<ul class="reviews">
<?php foreach ($reviews as $review) { ?>
<li class="review">
	<div class="panel panel-default">
    <div class="panel-body">
      <p class="rating">
        <?php for ($i = 1; $i <= 5; $i++) { ?>
        <?php if ($review['rating'] < $i) { ?>
        <i class="fa fa-star-o"></i>
        <?php } else { ?>
        <i class="fa fa-star"></i>
        <?php } ?>
        <?php } ?>
      </p>
      <p><?php echo $review['text']; ?></p>
    </div>
   	<div class="panel-footer"><ul class="list-inline"><li><i class="fa fa-user"></i> <?php echo $review['author']; ?></li><li><i class="fa fa-calendar"></i> <?php echo $review['date_added']; ?></li></ul></div>
  </div>
</li>
<?php } ?>
</ul>
<div class="text-right"><?php echo $pagination; ?></div>
<?php } else { ?>
<p><?php echo $text_no_reviews; ?></p>
<?php } ?>
