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

<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>

<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<body>
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
              <a href="<?php echo $home; ?>" class='logo-no-scroll'><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
              <a href="<?php echo $home; ?>" class='logo-on-scroll'><img src="/catalog/view/theme/default/image/logo_png_white.png" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
              <?php } else { ?>
              <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
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
                  <li><a href="<?php echo $contact; ?>">Контакты</a></li>
                  <li><a href='/special'>Акции</a></li>
                  <li><a href=''><i class="material-icons">access_time</i> <span>Пн-Сб с 9:00 до 20:00</span></a></li>
                </ul>
                <ul class="list-unstyled head-right-menu">
                  <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>"><i class="material-icons">perm_identity</i> <span class=""><?php echo $text_account; ?></span></a>
                    <!--<ul class="dropdown-menu dropdown-menu-right">
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
                    </ul>-->
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
<!--<nav id="top">
  <div class="container">
    <?php echo $currency; ?>
    <?php echo $language; ?>
    <div id="top-links" class="nav pull-right">
      <ul class="list-inline">
        <li><a href="<?php echo $contact; ?>"><i class="fa fa-phone"></i></a> <span class="hidden-xs hidden-sm hidden-md"><?php echo $telephone; ?></span></li>
        <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span> <span class="caret"></span></a>
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
        <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_wishlist; ?></span></a></li>
        <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span></a></li>
        <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></li>
      </ul>
    </div>
  </div>
</nav>-->
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
