<?php echo $header; ?>
<div class="container">
	<div class="postcode-lookup">
		<div class="row">
			<div class="col-sm-8 text-center results">
				<div class="success" style="display:none;"><b>Yes!</b> We can provide <strong>free delivery</strong> to your postcode!</div>
				<div class="error" style="display:none;">Unfortunately we only provide free delivery to your area on orders over £75.00</div>
				<form class="form form-inline">
					<i class="fa fa-truck"></i> 
					<b>Free local delivery</b>* 
					<div class="form-group form-group-sm">
						<label for="postcode" class="sr-only">Postcode</label>
						<input name="postcode" type="text" class="form-control" id="postcode" placeholder="Enter your postcode">
					</div>
					to see if we delivery in your area
					<button type="button" class="btn btn-link" onclick="checkPostcode();">Go</button>
				</form>
			</div>
			<div class="col-sm-4 text-center">
				<b>Free delivery</b> on orders over <strong>&pound;75.00</strong>
			</div>
		</div>
		<script>
			function checkPostcode(){
				if($('[name="postcode"]').val().length >= 6){
					$('.postcode-lookup').find('.form').hide();
					if(/ta1|ta2|ta3|ta4|ta5/.test($('[name="postcode"]').val())){ /*Replace regex */
						$('.postcode-lookup').find('.results').find('.success').show();
					} else {
						$('.postcode-lookup').find('.results').find('.error').show();
					}
				} else {
					alert('Please enter a valid postcode');
				}
			}
		</script>
	</div>
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