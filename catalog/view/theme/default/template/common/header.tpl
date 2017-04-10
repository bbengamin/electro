<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/jquery.maskedinput.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="/catalog/view/theme/default/stylesheet/jquery.fancybox.min.css" rel="stylesheet">

<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>

<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<link href="catalog/view/theme/default/stylesheet/media.css" rel="stylesheet">
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<script src="/catalog/view/javascript/jquery.fancybox.min.js" type="text/javascript"></script>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<body>
  <!--preloader start-->
  <div id="page-preloader" class="block" style="background: #fff;">
   <div class="gear"></div> 
  </div>
  <!--preloader end-->
  <header class='fixed-head'>
      <div class='left-row-head'>
        <div class="header-black-background"></div>
        <div class="header-orange-background"></div>
      </div>
      <div class='content-row container'>
        <div class='main-row'>
          <div class='pre-logo'>
            <div class="header-black-background"></div>
          </div>
          <div class='logo'>
            <div id="logo">
              <?php if ($logo) { ?>
              <a href="/" class='logo-no-scroll'><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
              <a href="/" class='logo-on-scroll'><img src="/catalog/view/theme/default/image/logo_png_white.png" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
              <?php } else { ?>
              <h1><a href="/"><?php echo $name; ?></a></h1>
              <?php } ?>
            </div>
          </div>
          <div class='after-logo'>
            <div class="header-black-background">
              <div id="top-links" class="nav">
                <ul class="list-unstyled head-left-menu">
                  <li><a href='/'>Главная</a></li>
                  <li><a href='/about'>О магазине</a></li>
                  <li><a href='/delivery_payment'>Доставка и оплата</a></li>
                  <li><a href="/contact">Контакты</a></li>
                  <li><a href='/special'>Акции</a></li>
                  <!-- <li><a href=''><i class="material-icons">access_time</i> <span>Пн-Сб с 9:00 до 20:00</span></a></li> -->
                </ul>
                <ul class="list-unstyled head-right-menu">
                  <?php if ($logged) { ?>
                    <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_logged; ?>"><i class="material-icons">perm_identity</i> <span class="">Здравствуйте, <?php echo $text_logged; ?></span></a>
                  <?php } else { ?>
                    <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>"><i class="material-icons">perm_identity</i> <span class=""><?php echo $text_account; ?></span></a>
                  <?php } ?>
                  </li>
                </ul>
              </div>
            </div>
            <div class="header-orange-background">
              <div class="phones-holder">
                <a class='heade-phones' href='tel:<?php echo $telephone; ?>'><i class="material-icons">phone</i><span><?php echo $telephone; ?></span></a>
                <a class='heade-phones' href='tel:<?php echo $telephone_2; ?>'><i class="material-icons">phone</i><span><?php echo $telephone_2; ?></span></a>
                <!--<a class='heade-phones' href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>">
                    <i class="material-icons">favorite_border</i><span class=""><?php echo $text_wishlist; ?></span>
                  </a>-->
              </div>
            </div>
            <div class="search-box">
              <?php echo $search; ?>
            </div>
          </div>
          <div class='row-cart'>
            <div class="call-back-wrap">
              <a href='#' class='call-back-header' data-toggle="modal" data-target="#modal-call-back-header"><i class="material-icons">phone_in_talk</i> <span>Перезвоните мне</span></a>
            </div>
            <div class="cart-wl-head-wrap">
              <!--<div class="wl-head-wrap">
                <a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>">
                  <i class="material-icons">favorite_border</i><span class=""><?php echo $text_wishlist; ?></span>
                </a>
              </div>-->
              <div class="cart-head-wrap">
                <?php echo $cart; ?>
              </div>  
            </div>
          </div>
        </div>
      </div>
      <div class='right-row-head'>
        <div class="header-black-background"></div>
        <div class="header-orange-background"></div>
      </div>
  </header>  

<body class="<?php echo $class; ?>">
<header>
  <div class="container">
    <div class="row">
      <div class="col-sm-4">
      </div>
      <div class="col-sm-5"><?php echo $search; ?>
      </div>
      <div class="col-sm-3"><?php echo $cart; ?></div>
    </div>
  </div>
</header>
<?php if ($categories) { ?>
<div class="container">
  <nav id="menu" class="navbar">
    <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
    </div>
    <div class="collapse navbar-collapse navbar-ex1-collapse">
      <ul class="nav navbar-nav">
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
        <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
          <div class="dropdown-menu">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
              <ul class="list-unstyled">
                <?php foreach ($children as $child) { ?>
                <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                <?php } ?>
              </ul>
              <?php } ?>
              <div class="category-menu-img-box" style='background: url("<?php echo $category['image']; ?>") no-repeat center;'>
                
              </div>
            </div>
            
        </li>
        <?php } else { ?>
        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <?php } ?>
      </ul>
    </div>
  </nav>
</div>
<?php } ?>
<script>
$(document).ready(function() {
  Application.route = '<?php echo $route; ?>';
  Application.path = '<?php echo $path; ?>';
  Application.mode = '<?php echo $mode; ?>';
  Application.page = '<?php echo $page; ?>';
  Application.msort = '<?php echo $sort; ?>';
  Application.order = '<?php echo $morder; ?>';
  Application.search = '<?php echo $msearch; ?>';
  Application.manufacturer = '<?php echo $manufacturer_id; ?>';
  
  Application.init();
});
</script>
