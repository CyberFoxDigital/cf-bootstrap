<?php if (count($currencies) > 1) { ?>
<li>
<form class="dropdown" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-currency">
  <button class="btn btn-sm btn-link dropdown-toggle" data-toggle="dropdown">
    <?php foreach ($currencies as $currency) { ?>
    <?php if ($currency['code'] == $code) { ?>
    <?php echo $currency['code']; ?>    
    <?php } ?>
    <?php } ?>
    <i class="fa fa-caret-down"></i>
  </button>
  <ul class="dropdown-menu">
    <?php foreach ($currencies as $currency) { ?>
     <li><a href="#" onclick="$('#form-currency .code').val('<?php echo $currency['code']; ?>'); $('#form-currency').submit();"><?php echo $currency['code']; ?></a></li>
    <?php } ?>
  </ul>
  <input class="code" type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
</li>
<?php } ?>
