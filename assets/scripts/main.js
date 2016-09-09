/* ========================================================================
 * DOM-based Routing
 * Based on http://goo.gl/EUTi53 by Paul Irish
 *
 * Only fires on body classes that match. If a body class contains a dash,
 * replace the dash with an underscore when adding it to the object below.
 *
 * .noConflict()
 * The routing is enclosed within an anonymous function so that you can
 * always reference jQuery with $, even when in .noConflict() mode.
 * ======================================================================== */
(function($) {

	//Plugin Functions
	$.fn.fullWidth = function(method) {
		var viewportWidth = $(window).width();
		var obj = $(this);
		if(method === 'resize'){
			return obj.each(function() {
				$(this).css('marginLeft', '0').css('marginRight', '0');
				var width = $(this).width();
				var margin =  0 - ((viewportWidth - width) / 2);
				$(this).css('marginLeft', margin).css('marginRight', margin);
			});
		}
		$(window).on("resize", function(){
			obj.fullWidth('resize');
		});
		return obj.fullWidth('resize');
	};
	
	jQuery.easing.default = function (x,t,b,c,d) {
		return -c * ((t=t/d-1)*t*t*t - 1) + b;
	};

	$.fn.scrollSpeed = function(step, speed, easing) {
					
		var $document = $(document),
				$window = $(window),
				$body = $('html, body'),
				option = easing || 'default',
				root = 0,
				scroll = false,
				scrollY,
				view;
			
		$window.on("load", function(e){
			root = $window.scrollTop();
		});

		$window.on('mousewheel DOMMouseScroll', function(e) {

			var deltaY = e.originalEvent.wheelDelta,
				detail = e.originalEvent.detail;
				scrollY = document.body.clientHeight > $window.height();
				scroll = true;
			
			if (scrollY) {
				
				view = $window.height();
					
				if (deltaY < 0 || detail > 0) {
					root = (root + view) >= $document.height() ? root : root += step;
				}
				
				if (deltaY > 0 || detail < 0) {
					root = root <= 0 ? 0 : root -= step;
				}
				
				$body.stop().animate({
					scrollTop: root
				}, speed, option, function() {
					scroll = false;
				});
			}
			
			return false;
			
		}).on('scroll', function() {
			
			if (scrollY && !scroll) {
				root = $window.scrollTop();
			}
			
		}).on('resize', function() {
			
			if (scrollY && !scroll) {
				view = $window.height();
			}
		});       
	};
	
  // Use this variable to set up the common and page specific functions. If you 
  // rename this variable, you will also need to rename the namespace below.
  var CyberFoxTheme = {
    // All pages
    'common': {
      init: function() {
				
				$('.full-width').fullWidth();
				$('.tooltip-init').tooltip();
				
				if (!Modernizr.touchevents) { 
					$(document).scrollSpeed(100, 800);
				}
				
				$(function() {
					$('a[href*="#"]:not([href="#"]):not([data-toggle])').click(function() {
						if (location.pathname.replace(/^\//,'') === this.pathname.replace(/^\//,'') && location.hostname === this.hostname) {
							var target = $(this.hash);
							target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
							if (target.length) {
								$('html, body').animate({
									scrollTop: target.offset().top
								}, 1000);
								return false;
							}
						}
					});
				});
				
				//Adam Placeholder Polyfill
				if (!Modernizr.placeholder){
					$('input[placeholder]').each(function(){
						if($(this).val() === ''){
							$(this).val($(this).attr('placeholder'));
						}
						$(this).on('focus', function() {
							if($(this).val() === $(this).attr('placeholder')){
								$(this).val('');
							}
						});
						$(this).on('focusout', function() {
							if($(this).val() === ''){
								$(this).val($(this).attr('placeholder'));
							}
						});
						$(this).parents('form').on('submit', function(){
							if($(this).val() === $(this).attr('placeholder')){
								$(this).val('');
							}
						});
					});
				}

				if (!Modernizr.csspositionsticky){				
					$.get( asset_path + 'assets.json', function( assets ){
						$.getScript( asset_path + 'scripts/' + assets['polyfill-sticky.js'], function(){
							$('.sticky').Stickyfill();
						});
					});
				}				
				
				//Initialise Carousel Instances
				if($('.owl-carousel-init').length){
					$.ajaxSetup({
						cache: true
					});
					$.get( asset_path + 'assets.json', function( assets ){
						$.getScript( asset_path + 'scripts/' + assets['owl.carousel.js'], function(){
							$('.owl-carousel-init').each(function(){
								var carouselOptions = {
									'items' 		: $(this).attr('data-items') 				? $(this).data('items') 		: 1,
									'loop' 			: $(this).attr('data-loop') 				? $(this).data('loop') 			: true,
									'center' 		: $(this).attr('data-center') 			? $(this).data('center') 		: true,
									'nav' 			: $(this).attr('data-nav')	=== "0"	? false											: true,
    							'autoWidth'	: $(this).attr('data-autoWidth')		? true : false,
								};
								
								
								carouselOptions.sm = {
									'items'		: $(this).attr('data-sm-items') 			? $(this).data('sm-items') 	: carouselOptions.items,
									'loop' 		: $(this).attr('data-sm-loop') 				? $(this).data('sm-loop') 	: carouselOptions.loop,
									'center' 	: $(this).attr('data-sm-center') 			? $(this).data('sm-center') : carouselOptions.center,
									'nav' 		: $(this).attr('data-sm-nav')	=== "0"	? false											: carouselOptions.nav
								};
								
							 carouselOptions.md = {
									'items'		: $(this).attr('data-md-items') 			? $(this).data('md-items') 	: carouselOptions.sm.items,
									'loop' 		: $(this).attr('data-md-loop') 				? $(this).data('md-loop') 	: carouselOptions.sm.loop,
									'center' 	: $(this).attr('data-md-center')			? $(this).data('md-center') : carouselOptions.sm.center,
									'nav' 		: $(this).attr('data-md-nav')	=== "0"	? false											: carouselOptions.sm.nav
								};
								
								carouselOptions.lg	= {
									'items'		: $(this).attr('data-lg-items') 			? $(this).data('lg-items') 	: carouselOptions.md.items,
									'loop' 		: $(this).attr('data-lg-loop') 				? $(this).data('lg-loop') 	: carouselOptions.md.loop,
									'center' 	: $(this).attr('data-lg-center') 			? $(this).data('lg-center') : carouselOptions.md.center,
									'nav' 		: $(this).attr('data-lg-nav')	=== "0"	? false											: carouselOptions.md.nav
								};
								$(this).owlCarousel({
									lazyLoad: false,
									loop: carouselOptions.loop,
									center: carouselOptions.center,
									nav: 		carouselOptions.nav,
									items: 	carouselOptions.items,
									autoWidth: carouselOptions.autoWidth,
									navText: ['<div class="btn btn-default"><i class="fa fa-chevron-left"></i></div>','<div class="btn btn-default"><i class="fa fa-chevron-right"></i></div>'],
									responsive : {
										// breakpoint from 768 up
										768 : {
											center: carouselOptions.sm.center,
											nav: 		carouselOptions.sm.nav,
											items: 	carouselOptions.sm.items
										},
										// breakpoint from 980 up
										980 : {
											center: carouselOptions.md.center,
											nav: 		carouselOptions.md.nav,
											items: 	carouselOptions.md.items
										},
										// breakpoint from 980 up
										1200 : {
											center: carouselOptions.lg.center,
											nav: 		carouselOptions.lg.nav,
											items: 	carouselOptions.lg.items
										}
									}
								});
							});
						});
					});
				}
				/*
				if($('.swipebox').length){
					$.ajaxSetup({
						cache: true
					});
					$.get(asset_path + 'assets.json', function( assets ){
						$.getScript( asset_path + 'scripts/' + assets['swipebox.js'], function(){
							$('<link/>', {
								 rel: 'stylesheet',
								 type: 'text/css',
								 href: asset_path + 'styles/' + assets['swipebox.css']
							}).appendTo('head');
							
						});
					});
				}*/
				
      }, 
      finalize: function() {
        // JavaScript to be fired on all pages, after page specific JS is fired
      }
    },
		'product': {
      init: function() {
				jQuery(document).ready(function(){
					$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
						$.ajax({
							url: 'index.php?route=product/product/getRecurringDescription',
							type: 'post',
							data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
							dataType: 'json',
							beforeSend: function() {
								$('#recurring-description').html('');
							},
							success: function(json) {
								$('.alert, .text-danger').remove();
					
								if (json.success) {
									$('#recurring-description').html(json.success);
								}
							}
						});
					});
					
					$('#button-cart').on('click', function() {
						$.ajax({
							url: 'index.php?route=checkout/cart/add',
							type: 'post',
							data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
							dataType: 'json',
							beforeSend: function() {
								$('#button-cart').button('loading');
							},
							complete: function() {
								$('#button-cart').button('reset');
							},
							success: function(json) {
								$('.alert, .text-danger').remove();
								$('.form-group').removeClass('has-error');
					
								if (json.error) {
									if (json.error.option) {
										for (var i in json.error.option) {
											var element = $('#input-option' + i.replace('_', '-'));
					
											if (element.parent().hasClass('input-group')) {
												element.parent().after('<div class="text-danger">' + json.error.option[i] + '</div>');
											} else {
												element.after('<div class="text-danger">' + json.error.option[i] + '</div>');
											}
										}
									}
					
									if (json.error.recurring) {
										$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json.error.recurring + '</div>');
									}
					
									// Highlight any found errors
									$('.text-danger').parent().addClass('has-error');
								}
					
								if (json.success) {
									$('.breadcrumb').after('<div class="alert alert-success">' + json.success + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
					
									$('#cart > button').html('<i class="fa fa-shopping-cart"></i> ' + json.total);
					
									$('html, body').animate({ scrollTop: 0 }, 'slow');
					
									$('#cart > ul').load('index.php?route=common/cart/info ul li');
								}
							},
									error: function(xhr, ajaxOptions, thrownError) {
											alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
									}
						});
					});

				
					$('button[id^=\'button-upload\']').on('click', function() {
						var node = this;
					
						$('#form-upload').remove();
					
						$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
					
						$('#form-upload input[name=\'file\']').trigger('click');
					
						if (typeof timer !== 'undefined') {
								clearInterval(timer);
						}
					
						timer = setInterval(function() {
							if ($('#form-upload input[name=\'file\']').val() !== '') {
								clearInterval(timer);
					
								$.ajax({
									url: 'index.php?route=tool/upload',
									type: 'post',
									dataType: 'json',
									data: new FormData($('#form-upload')[0]),
									cache: false,
									contentType: false,
									processData: false,
									beforeSend: function() {
										$(node).button('loading');
									},
									complete: function() {
										$(node).button('reset');
									},
									success: function(json) {
										$('.text-danger').remove();
					
										if (json.error) {
											$(node).parent().find('input').after('<div class="text-danger">' + json.error + '</div>');
										}
					
										if (json.success) {
											alert(json.success);
					
											$(node).parent().find('input').attr('value', json.code);
										}
									},
									error: function(xhr, ajaxOptions, thrownError) {
										alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
									}
								});
							}
						}, 500);
					});
					
					$('#button-review').on('click', function() {
						$.ajax({
							url: 'index.php?route=product/product/write&product_id=' + $('#product').data('product-id'),
							type: 'post',
							dataType: 'json',
							data: $("#form-review").serialize(),
							beforeSend: function() {
								$('#button-review').button('loading');
							},
							complete: function() {
								$('#button-review').button('reset');
							},
							success: function(json) {
								$('.alert-success, .alert-danger').remove();
					
								if (json.error) {
									$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json.error + '</div>');
								}
					
								if (json.success) {
									$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json.success + '</div>');
					
									$('input[name=\'name\']').val('');
									$('textarea[name=\'text\']').val('');
									$('input[name=\'rating\']:checked').prop('checked', false);
								}
							}
						});
					});
					
					if($('.star-rating-input').length){
						$('.star-rating-input > .fa').on('mouseover', function(){
							var rating = $(this).data('value');
							$('.star-rating-input > .fa').each(function(){
								if($(this).data('value') <= rating) {
									$(this).removeClass('text-muted');
									$(this).addClass('text-primary');
								} else {
									$(this).removeClass('text-primary');
									$(this).addClass('text-muted');
								}
							});
						});
						
						$('.star-rating-input').on('mouseout', function(){
							var rating = $('#form-review').find('input[name="rating"]').val();
							$('.star-rating-input > .fa').each(function(){
								if($(this).data('value') <= rating) {
									$(this).removeClass('text-muted');
									$(this).addClass('text-primary');
								} else {
									$(this).removeClass('text-primary');
									$(this).addClass('text-muted');
								}
							});
						});
						
						$('.star-rating-input > .fa').on('click', function(){
							var rating = $(this).data('value');
							$('#form-review').find('input[name="rating"]').val(rating);
							$('.star-rating-input > .fa').each(function(){
								if($(this).data('value') <= rating) {
									$(this).removeClass('text-muted');
									$(this).addClass('text-primary');
								} else {
									$(this).removeClass('text-primary');
									$(this).addClass('text-muted');
								}
							});
						});
					}
					
					
				});
				
				$(window).on('load', function(){
					
					$('.thumbnails').magnificPopup({
						type:'image',
						delegate: 'a',
						gallery: {
							enabled:true
						}
					});
					
					$('#review').delegate('.pagination a', 'click', function(e) {
							e.preventDefault();
					
							$('#review').fadeOut('slow');
					
							$('#review').load(this.href);
					
							$('#review').fadeIn('slow');
					});
					
					$('#review').load('index.php?route=product/product/review&product_id=' + $('#product').data('product-id'));
					
					$('.date').datetimepicker({
						pickTime: false
					});
					
					$('.datetime').datetimepicker({
						pickDate: true,
						pickTime: true
					});
					
					$('.time').datetimepicker({
						pickDate: false
					});
					
				});
			}
		},
		'checkout_cart': {
      init: function(){
				$(document).ready(function(){
					$('.plus-minus').each(function(){
						var $inputGroup = $(this);
						var $input = $inputGroup.find('input');
						$inputGroup.find('.plus').on('click', function(){
							var currentVal = parseInt($input.val());
							$input.val(currentVal + 1);
							$input.parents('form').submit();
						});
						$inputGroup.find('.minus').on('click', function(){
							var currentVal = parseInt($input.val());
							if(currentVal > 0){
								$input.val(currentVal - 1);
							}	
							$input.parents('form').submit();
						});
					});
				});
			}
		}
  };

  // The routing fires all common scripts, followed by the page specific scripts.
  // Add additional events for more control over timing e.g. a finalize event
  var UTIL = {
    fire: function(func, funcname, args) {
      var fire;
      var namespace = CyberFoxTheme;
      funcname = (funcname === undefined) ? 'init' : funcname;
      fire = func !== '';
      fire = fire && namespace[func];
      fire = fire && typeof namespace[func][funcname] === 'function';

      if (fire) {
        namespace[func][funcname](args);
      }
    },
    loadEvents: function() {
      // Fire common init JS
      UTIL.fire('common');

      // Fire page-specific init JS, and then finalize JS
      $.each(document.body.className.replace(/-/g, '_').split(/\s+/), function(i, classnm) {
				
        UTIL.fire(classnm);
        UTIL.fire(classnm, 'finalize');
      });

      // Fire common finalize JS
      UTIL.fire('common', 'finalize');
    }
  };

  // Load Events
  $(document).ready(UTIL.loadEvents);

})(jQuery); // Fully reference jQuery after this point.
