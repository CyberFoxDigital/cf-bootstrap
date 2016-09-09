<div class="module panel panel-default <?php echo basename(__FILE__, '.tpl') ?>">
<?php 
ob_start(); 
include(modification('catalog/view/theme/default/template/module/' . basename(__FILE__)));
$module = ob_get_contents(); 
ob_end_clean();

$module = preg_replace('/<script.*?<\/script>/sm', '', $module);
$module = str_replace('class="owl-carousel"', 'class="owl-carousel owl-carousel-init" data-items="1" data-nav="1"', $module);
echo $module;
?>
</div>