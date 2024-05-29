$(function () {
  // 메인 슬라이더
  let mainSlider = new Swiper('.main_slider .swiper', {
    loop: true,
    speed: 500,
    autoplay: {
      delay: 2000,
      disableOnInteraction: false,
    },
    pagination: {
      el: '.swiper-pagination',
      clickable: true,
    },
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
    mousewheel: {
      invert: true,
    },
  });

  // 메뉴버튼
  const menuBtn = $('#header .menu_btn');

  menuBtn.on('click', function () {
    $('body').toggleClass('on');
    $(this).toggleClass('on');
  });
  
  // Q&A, Review 목차 번호 active클래스
  const boardList = $('.board_list .board>li>a');

  boardList.on('click', function () {
    if ($('.board>li>a').hasClass('active')) {
      $('.board>li>a').removeClass('active');
    } else {
      $('.board>li>a').addClass('active');
    }
  });


  // 제품 슬라이더
  let productSlide = new Swiper('.product .swiper', {
    loop: false,
    slidesPerView: 'auto',
    breakpoints: {
      320: {
        slidesPerView: 2,
      },
      480: {
        slidesPerView: 4,
      },
      640: {
        slidesPerView: 5,
      },
    },
    pagination: {
      el: '.swiper-pagination',
      clickable: true,
    },
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
  });
});