<div class="module panel panel-default <?php echo basename(__FILE__, '.tpl') ?>">
<?php 
ob_start(); 
include(modification('catalog/view/theme/default/template/module/' . basename(__FILE__)));
$module = ob_get_contents(); 
ob_end_clean();

//Product Grid
$module = str_replace('class="row','class="row products-grid', $module);
$module = str_replace('class="product-layout','class="product-layout product-grid', $module);

//Modify bottom
$module = preg_replace('/<div class="button-group.*?<\/div>/s','<button onclick="window.location = $(this).parents(\'.product-thumb\').find(\'.image > a\').attr(\'href\');" class="btn btn-primary view-product">View Product</button>', $module);
$module = preg_replace('/<p>.*?<\/p>/s','', $module);

//Wrap Header
if(preg_match('/<h3(.*?)<\/h3>/', $module) !== false){
	echo preg_replace('/<h3(.*?)<\/h3>/', '<div class="panel-heading"><h4 class="panel-title"$1</h4></div><div class="panel-body">', $module) . "</div>";
} else {
	echo $module;
}
?>
</div>