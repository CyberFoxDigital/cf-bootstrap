<?php echo $header; ?>
<div class="container">
  <div class="row">
		<?php echo preg_replace('/col-(xs|sm|md|lg)-3/', 'col-$1-4', $column_left); ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-4'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-8'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
		<div class="<?php echo $class; ?>"><?php echo $content_top; ?></div>
		<?php echo preg_replace('/col-(xs|sm|md|lg)-3/', 'col-$1-4', $column_right); ?>
	</div>
	<div class="row">
    <div id="content" class="col-sm-12"><?php echo $content_bottom; ?></div>
  </div>
</div>
<?php echo $footer; ?>