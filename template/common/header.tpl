<?php
class JsonManifest {
  private $manifest;

  public function __construct($manifest_path) {
    if (file_exists($manifest_path)) {
      $this->manifest = json_decode(file_get_contents($manifest_path), true);
    } else {
      $this->manifest = [];
    }
  }

  public function get() {
    return $this->manifest;
  }

  public function getPath($key = '', $default = null) {
    $collection = $this->manifest;
    if (is_null($key)) {
      return $collection;
    }
    if (isset($collection[$key])) {
      return $collection[$key];
    }
    foreach (explode('.', $key) as $segment) {
      if (!isset($collection[$segment])) {
        return $default;
      } else {
        $collection = $collection[$segment];
      }
    }
    return $collection;
  }
}

function asset_path($filename) {
  $dist_path = 'catalog/view/theme/cf-opencart/dist/';
  $directory = dirname($filename) . '/';
  $file = basename($filename);
  static $manifest;

  if (empty($manifest)) {
    $manifest_path = 'catalog/view/theme/cf-opencart/dist/assets.json';
    $manifest = new JsonManifest($manifest_path);
  }

  if (array_key_exists($file, $manifest->get())) {
    return $dist_path . $directory . $manifest->get()[$file];
  } else {
    return $dist_path . $directory . $file;
  }
}

if(!empty(explode("-", $class)[1]) && explode("-", $class)[1] != 'product') {
 $class .= " " . explode("-", $class)[1];
} elseif(!empty(explode("-", $class)[0])){
 $class .= " " . explode("-", $class)[0];
} 

?><!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="MobileOptimized" content="320">
  <meta name="HandheldFriendly" content="True">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><?php echo $title; ?></title>
  <base href="<?php echo $base; ?>" />
  <?php if ($description) { ?>
  <meta name="description" content="<?php echo $description; ?>" />
  <?php } ?>
  <?php if ($keywords) { ?>
  <meta name="keywords" content= "<?php echo $keywords; ?>" />
  <?php } ?>
  <script src="<?php echo asset_path('scripts/modernizr.js');?>" type="text/javascript"></script>
  <script src="<?php echo asset_path('scripts/jquery.js')?>" type="text/javascript"></script>
  <script>var asset_path = 'catalog/view/theme/cf-opencart/dist/';</script>
  <script src="<?php echo asset_path('scripts/main.js')?>" type="text/javascript"></script>
  <link href="<?php echo asset_path('styles/main.css')?>" rel="stylesheet" type="text/css" media="screen, projection" />
  <link href="<?php echo asset_path('styles/font-awesome.css')?>" rel="stylesheet" type="text/css" />
  <?php foreach ($styles as $style) { ?>
  <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
  <?php } ?>
  <?php foreach ($links as $link) { ?>
  <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
  <?php } ?>
  <?php foreach ($scripts as $script) { ?>
  <script defer src="<?php echo $script; ?>" type="text/javascript"></script>
  <?php } ?>
  <?php foreach ($analytics as $analytic) { ?>
  <?php echo $analytic; ?>
  <?php } ?>
  <script src="https://use.typekit.net/cgx3pfl.js"></script>
	<script>try{Typekit.load({ async: true });}catch(e){}</script>
</head>
<body class="<?php echo $class; ?>">
<header>
  <nav id="top" class="navbar-default">
    <div class="container">
    	<div id="currency-language" class="nav pull-left">
        <ul class="list-inline">
        <?php echo $currency; ?>
        <?php echo $language; ?>
        </ul>
      </div>
      <div id="top-links" class="nav pull-right">
        <ul class="list-inline">
          <li><a class="btn btn-sm btn-link" href="<?php echo $contact; ?>"><i class="fa fa-phone"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $telephone; ?></span></a></li>
          <li class="dropdown"><a class="btn btn-sm btn-link" href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span> <span class="caret"></span></a>
            <ul class="dropdown-menu dropdown-menu-right">
              <?php if ($logged) { ?>
              <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
              <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
              <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
              <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
              <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
              <?php } else { ?>
              <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
              <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
              <?php } ?>
            </ul>
          </li>
          <li class="hidden-xs"><a class="btn btn-sm btn-link" href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo preg_replace('/(.*?)\((.*)\)/', '$1 <span class="badge">$2</span>', $text_wishlist) ; ?></span></a></li>
          <li><a class="btn btn-sm btn-link" href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span> <span class="badge cart-total-items"><?php echo $cart_items; ?></span></a></li>
          <li><a class="btn btn-sm btn-link" href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></li>
        </ul>
      </div>
    </div>
  </nav>
  <div class="middle-wrapper">
    <div class="container">
      <div class="row">
        <div class="logo-wrapper col-xs-8 col-xs-offset-2 col-sm-offset-0 col-sm-4 col-md-4">
          <div id="logo">
            <?php if ($logo) { ?>
            <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
            <?php } else { ?>
            <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
            <?php } ?>
          </div>
        </div>
        <div class="search-wrapper col-xs-8 col-xs-offset-2 col-sm-offset-0 col-sm-5 col-md-4 text-center">
          <?php echo $search; ?>
        </div>
        <div class="cart-wrapper hidden-xs col-sm-3 col-md-4 text-center sm-text-right">
        	<ul class="list-unstyled">
        	<li><?php echo $cart; ?></li>
        	</ul>
          
        </div>
      </div>
    </div>
  </div>
	<?php if ($categories) { ?>
	<div class="nav-wrapper">
    <nav id="menu" class="navbar navbar-default navbar-full">
      <div class="container">
        <div class="navbar-header">
          <div class="navbar-brand visible-xs visible-sm">
            <?php echo $text_category; ?>
          </div>
          <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
        </div>
        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav">
            <?php foreach ($categories as $category) { ?>
            <?php if ($category['children']) { ?>
            <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo str_replace('and', '&amp;', $category['name']); ?> <span class="caret"></span></a>
              <div class="dropdown-menu">
                <div class="dropdown-inner<?php echo $category['column'] > 1 ? ' has-columns' : ' no-columns'?>">
                  <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                  <ul class="nav">
                    <?php foreach ($children as $child) { ?>
                    <?php $child['name'] = preg_replace('/\((.*?)\)/s', '<span class="badge">$1</span>', $child['name']); ?>
                    <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                    <?php } ?>
                  </ul>
                  <?php } ?> 
                </div>
                <a href="<?php echo $category['href']; ?>" class="see-all btn btn-sm btn-primary btn-block"><?php echo $text_all; ?> <?php echo $category['name']; ?></a>
              </div>
            </li>
            <?php } else { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
            <?php } ?>
          </ul>
        </div>
      </div>
    </nav>
	</div>
	<?php } ?>
</header>
