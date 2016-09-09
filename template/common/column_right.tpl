<?php 
ob_start(); 
include(modification('catalog/view/theme/default/template/common/' . basename(__FILE__)));
$column = ob_get_contents(); 
ob_end_clean();

$column = str_replace('class="col-sm-3','class="col-sm-3 sticky', $column);

echo $column;
?>