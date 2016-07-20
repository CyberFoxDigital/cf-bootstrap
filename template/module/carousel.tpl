<div class="module panel <?php echo basename(__FILE__, '.tpl') ?>">
<?php 
ob_start(); 
include(modification('catalog/view/theme/default/template/module/' . basename(__FILE__)));
$module = ob_get_contents(); 
ob_end_clean();
//Heading edit - sorry!
$module = '<h3>Shop by Brand</h3>' . $module;
//Wrap Header
if(preg_match('/<h3(.*?)<\/h3>/', $module) !== false){
	echo preg_replace('/<h3(.*?)<\/h3>/', '<div class="panel-heading"><h4 class="panel-title"$1</h4></div><div class="panel-body">', $module) . "</div>";
} else {
	echo $module;
}
?>
</div>