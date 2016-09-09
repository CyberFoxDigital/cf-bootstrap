<?php if (count($languages) > 1) { ?>
<li>
<form action="<?php echo $action; ?>" class="dropdown" method="post" enctype="multipart/form-data" id="form-language">
  <button class="btn btn-sm btn-default dropdown-toggle" data-toggle="dropdown">
    <?php foreach ($languages as $language) { ?>
    <?php if ($language['code'] == $code) { ?>
    <img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>">
    <span class="hidden-xs hidden-sm hidden-md"><?php echo $language['name']; ?></span>
    <?php } ?>
    <?php } ?>
    <i class="fa fa-caret-down"></i>
  </button>
  <ul class="dropdown-menu">
    <?php foreach ($languages as $language) { ?>
    <li><a href="#" onclick="$('#form-language .code').val('<?php echo $language['code']; ?>');$('#form-language').submit();"><img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
    <?php } ?>
  </ul>
  <input class="code" type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
</li>
<?php } ?>