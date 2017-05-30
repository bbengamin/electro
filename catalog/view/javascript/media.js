$(document).ready(function () {
    if (window.matchMedia("(max-width: 992px)").matches) {
     //   $('#menu .navbar-nav').clone().appendTo('#category-mob-list');
        $('.search-box').clone().appendTo('#search-mob-box');
        $('#top-links').clone().appendTo('#top-links-mob-box');
       
        $(document).on('click', '.mob-cart-trigger',function(e) {
		    window.location.href = '/cart';
		});
		//scroll-up
		$("#scrollup").mouseover(function () {
            $(this).animate({opacity: 0.65}, 300)
        }).mouseout(function () {
            $(this).animate({opacity: 1}, 300)
        }).click(function () {
            return $("body,html").animate({scrollTop: 0}, 800), !1
        }), $(window).scroll(function () {
            $(document).scrollTop() > 300 ? jQuery("#scrollup").fadeIn("fast") : jQuery("#scrollup").fadeOut("fast")
        });
    }
});
//$(window).on('load', function () {
  //   $('.mfilter-free-button').clone().appendTo('.mobile-filter-button');
//});
//category-list
function openNavcategory() {
    document.getElementById("category-mob-list").style.left = "0";
    document.getElementById("mobile-overlay").style.left = "0";
}
function closeNavcategory() {
    document.getElementById("category-mob-list").style.left = "-9999px";
    document.getElementById("mobile-overlay").style.left = "-9999px";
}

//search-mob
function openNavsearch() {
    document.getElementById("search-mob-box").style.top = "50px";
    document.getElementById("mobile-overlay").style.left = "0";
}
function closeNavsearch() {
    document.getElementById("search-mob-box").style.top = "-9999px";
    document.getElementById("mobile-overlay").style.left = "-9999px";
}

//settings-mob

function openNavsettings() {
    document.getElementById("top-links-mob-box").style.right = "0";
    document.getElementById("mobile-overlay").style.left = "0";
}
function closeNavsettings() {
    document.getElementById("top-links-mob-box").style.right = "-9999px";
    document.getElementById("mobile-overlay").style.left = "-9999px";
}

