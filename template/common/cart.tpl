<div id="cart" class="dropdown">
  <button type="button" data-toggle="dropdown" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-link dropdown-toggle"><i class="fa fa-shopping-basket"></i> <span <?php if(preg_match('/\(0\)/', $text_items) !== false) echo 'class="empty-cart"'; ?>><?php echo preg_replace('/(\d+)\s.*?\-\s(.*)/', '<span class="badge cart-total-items">$1</span>', $text_items) ; ?></span></button>
  <ul class="dropdown-menu pull-right">
    <?php if ($products || $vouchers) { ?>
    <li>
    	<div>
      	<table class="table">
        <thead>
          <th colspan="3">Product</th>
          <th colspan="2">Price</th>
        </thead>
        <tbody>
        <?php foreach ($products as $product) { ?>
        <tr>
        	<td><?php echo $product['quantity']; ?>x</td>
          <td class="text-center"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
            <?php } ?></td>
          <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <?php if ($product['option']) { ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
            <?php } ?>
            <?php } ?>
            <?php if ($product['recurring']) { ?>
            <br />
            - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
            <?php } ?></td>
          <td class="text-right"><?php echo $product['total']; ?></td>
          <td class="text-center"><button type="button" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <?php /*
          <td class="text-center"></td>
          */ ?>
          <td></td>
          <td class="text-left"><?php echo $voucher['description']; ?></td>
          <td class="text-right">x&nbsp;1</td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
          <td class="text-center text-danger"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
        </tr>
        <?php } ?>
        </body>
      </table>
      </div>
    </li>
    <li>
      <div>
        <table class="table small table-bordered">
          <?php foreach ($totals as $total) { ?>
          <tr>
            <td class="text-right"><strong><?php echo $total['title']; ?></strong></td>
            <td class="text-right"><?php echo $total['text']; ?></td>
          </tr>
          <?php } ?>
        </table>
        <div class="row">
        	<div class="col-xs-6">
          	<a href="<?php echo $cart; ?>" class="btn btn-default"><i class="fa fa-shopping-cart"></i> <?php echo $text_cart; ?></a>
          </div>
        	<div class="col-xs-6 text-right">
          	<a href="<?php echo $checkout; ?>" class="btn btn-primary"><i class="fa fa-share"></i> <?php echo $text_checkout; ?></a>
          </div>
        </div>
      </div>
    </li>
    <?php } else { ?>
    <li>
      <p class="text-center"><?php echo $text_empty; ?></p>
    </li>
    <?php } ?>
  </ul>
</div>
