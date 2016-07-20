<div class="module <?php echo basename(__FILE__, '.tpl') ?>">
<?php 
ob_start(); 
include(modification('catalog/view/theme/default/template/module/' . basename(__FILE__)));
$module = ob_get_contents(); 
ob_end_clean();
//Wrap Header
if(preg_match('/<h3(.*?)<\/h3>/', $module) === true){
	echo preg_replace('/<h3(.*?)<\/h3>/', '<div class="header"><h3$1</h3></div><div class="body">', $module) . "</div>";
} else {
	echo $module;
}
?>
</div>