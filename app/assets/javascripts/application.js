// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require_tree .
//= require jquery
//= require jquery_ujs
/*global $*/


$(function() {
  $(".top-img")
    .find("li")
    .hide();
  $(".top-img")
    .find("li:first")
    .stop()
    .fadeIn(1000);

  setInterval(function() {
    $(".top-img")
      .find("li:first-child")
      .fadeOut(1000)
      .next("li")
      .fadeIn(1000)
      .end()
      .appendTo(".top-img");
  }, 5000);
});

$(function() {
  var tabs = $(".tab"); // tabのクラスを全て取得し、変数tabsに配列で定義
  $(".tab").on("click", function() { // tabをクリックしたらイベント発火
    $(".active").removeClass("active"); // activeクラスを消す
    $(this).addClass("active"); // クリックした箇所にactiveクラスを追加
    var index = tabs.index(this); // クリックした箇所がタブの何番目か判定し、定数indexとして定義
    $(".area").removeClass("show").eq(index).addClass("show"); // showクラスを消して、contentクラスのindex番目にshowクラスを追加
  });
});

$(document).ready(function() {
  $('.slider').slick({
    centerMode: true,
    arrows: true,
    autoplay: true,
    dots: true,
    centerPadding: 0,
    slidesToShow: 3,
    responsive: [{
        breakpoint: 768,
        settings: {
          centerMode: true,
          slidesToShow: 3,
        }
      },
      {
        breakpoint: 550,
        settings: {
          centerMode: true,
          slidesToShow: 1,
        }
      }
    ]
  });
});

$(document).ready(function() {
  $('.lank-slider').slick({
    autoplay: true,
    slidesToShow: 3,
    responsive: [{
        breakpoint: 1024,
        settings: {
          slidesToShow: 2,
        }
      },
      {
        breakpoint: 600,
        settings: {
          slidesToShow: 1,
        }
      }
    ]
  });
});


function PageTopAnime() {
  var scroll = $(window).scrollTop();
  if (scroll >= 200) {
    $('.page-top').removeClass('moveright');
    $('.page-top').addClass('moveleft');
  }
  else {
    if ($('.page-top').hasClass('moveleft')) {
      $('.page-top').removeClass('moveleft');
      $('.page-top').addClass('moveright');
    };
  };
};

$(window).scroll(function() {
  PageTopAnime();
});

$(window).on('load', function() {
  PageTopAnime();
});

$('.page-top').click(function() {
  $('body,html').animate({
    scrollTop: 0
  }, 500);
  return false;
});


