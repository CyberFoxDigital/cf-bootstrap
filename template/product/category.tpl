<?php echo $header; $scales = false ;?>
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
      <div class="page-header">
        <h1><?php echo $heading_title; ?></h1>
      </div>
      <?php if ($description) { ?>
      <div class="description"><?php echo $description; ?></div>
      <hr>
      <?php } ?>
      <?php if ($categories) { ?>
        <?php $scales = true; foreach($categories as $category){ if(strpos(strtolower($category['name']), 'scale') === false) $scales = false; } ?>
        <?php if(!$scales){ ?>
            <h3><?php echo $text_refine; ?></h3>
            <div class="category-list row">
            <?php foreach ($categories as $category) {  ?>
              <div class="category col-lg-2 col-md-3 col-sm-4 col-xs-4">
                <div class="panel panel-default">
                  <div class="panel-body">
                    <?php if(!empty($category['image'])) { ?>
                    <a href="<?php echo $category['href']; ?>" class="image"><img src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>" /></a>
                    <?php } ?>
                  </div>
                  <div class="panel-footer"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></div>
                </div>
              </div>
            <?php } ?>
          </div>
        <?php } ?>
      <?php } ?>
      <?php /* <p><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></p> */ ?>
      <div class="well refine-products">
        <div class="row">
        	<?php if($scales){ ?>
          <div class="col-md-2 md-text-right">
            <label class="control-label" for="input-scale">Scale</label>
          </div>
          <div class="col-md-2">
            <select id="input-scale" type="email" onchange="window.location = $(this).val();" class="form-control">
              <?php foreach ($categories as $category) {  ?>
              <option value="<?php echo $category['href']; ?>"><?php echo preg_replace('/scale\s+/i', '', $category['name']); ?></option>
              <?php } ?>
            </select>
          </div>
          <?php } ?>
          <div class="col-md-4 <?php if($scales) echo 'hidden'; ?>">
            <div class="btn-group hidden-xs">
              <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
              <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
            </div>
          </div>
          <div class="col-md-2 md-text-right">
            <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
          </div>
          <div class="col-md-3">
            <select id="input-sort" class="form-control" onchange="location = this.value;">
              <?php foreach ($sorts as $sorts) { ?>
              <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
              <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
          <div class="col-md-1 md-text-right">
            <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
          </div>
          <div class="col-md-2">
            <select id="input-limit" class="form-control" onchange="location = this.value;">
              <?php foreach ($limits as $limits) { ?>
              <?php if ($limits['value'] == $limit) { ?>
              <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
      </div>
      <?php if ($products) { ?>
      <div class="row products">
        <?php foreach ($products as $product) { ?>
        	<?php include(modification('catalog/view/theme/cf-opencart/template/product/_product.tpl')); ?>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
