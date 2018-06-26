"use strict";

//= ../../../../node_modules/jquery/dist/jquery.min.js
//= ../../../../node_modules/materialize-css/dist/js/materialize.js
//= ../../../../node_modules/swiper/dist/js/swiper.min.js
//= ../../../../node_modules/jquery-validation/dist/jquery.validate.min.js
//= ../../../../node_modules/inputmask/dist/jquery.inputmask.bundle.js

var App = {

  init: function() {

    M.AutoInit();
    this.swiper();
    this.dropdown();
    this.map();
    this.form();

    $(".link--scroller").on('click', function(e) {
      e.preventDefault();

      var $this = $(this),
        href = $(this).attr('href');

      $('html, body').animate({
        scrollTop: $(href).offset().top
      }, 2000);
    });

    $.ajaxSetup({
      url: 'assets/components/modxsite/connectors/connector.php',
      method: 'post',
      error: function(XMLHttpRequest, textStatus, errorThrown){
        M.toast({
          html: 'Ошибка отправки запроса.'
        });
      },
    });

    var $telFields = $('input[type="tel"]');

    if ($telFields.length > 0) {
      $telFields.inputmask({
        mask: "+7 (999) 999-99-99",
        showMaskOnHover: false,
      });
    }

  },

  swiper: function() {

    var config = {

      testimonials: {
        loop: true,
        autoplay: {
          delay: 10000,
        },
        slidesPerView: 3,
        spaceBetween: 15,
        breakpoints: {
          480: {
            slidesPerView: 1,
            spaceBetween: 0,
          },
          992: {
            slidesPerView: 2,
            spaceBetween: 15,
          },
        },
        navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev',
        },
      },

    };

    Array.from(document.querySelectorAll('.swiper-container')).map(function(elem) {

      var params = config[elem.dataset.config];
      var swiper = new Swiper(elem, params);

      $(window).resize(function(e) {
        swiper.updateSize();
      });

    });

  },

  dropdown: function() {

    var config = {

      panel: {
        varrainWidth: false,
        coverTrigger: false,
        hover: (window.innerWidth > 1200),
        onOpenStart: function() {
          this.el.classList.add('open');
        },
        onCloseStart: function() {
          this.el.classList.remove('open');
        }
      },

    };

    Array.from(document.querySelectorAll('.dropdown-trigger.no-autoinit')).map( function(elem) {

      var options = config[elem.dataset.config];

      M.Dropdown.init(elem, options);

    });

  },

  map: function() {
    var maps = document.querySelectorAll('.map-container');

    if (maps.length > 0) {
      var script = document.createElement('script');

      script.src = "https://api-maps.yandex.ru/2.1/?lang=ru_RU";
      script.async = true;

      script.onload = function() {

        ymaps.ready(function(){

          var master = new ymaps.Map("map", {
              center: [55.769978, 37.667357],
              zoom: 15,
              controls: ['zoomControl'],
            }),

            placemarkMaster = new ymaps.Placemark(master.getCenter());

          master.behaviors.disable('scrollZoom');
          master.behaviors.disable('multiTouch');

          master.geoObjects
            .add(placemarkMaster);
        });
      }

      document.body.appendChild(script);
    }
  },

  form: function() {

    var config = {

      default: {
        ignore: [],
        focusCleanup: true,
        errorClass: 'error',
        validClass: '',
        errorElement: 'span',
        focusInvalid: false,
        errorPlacement: function(error, element) {
          element.parent().append(error);
          return true;
        },
        messages: {
          email: {
            required: 'Укажите вашу электронную почту.',
            email: 'Адрес эл. почты содержит ошибки.'
          },

          phone: {
            required: 'Укажите ваш номер телефона.',
          },
        },
      },

      preorder: {
        submitHandler: function(form) {

          var $form = $(form),
            data = $form.serialize() + '&template=' + $form.attr('name');

            $.ajax({
              data: data,
              beforeSend: function() {
                $form.find('[type="submit"]').prop('disabled', true);
              },

              success: function(response) {

                if (response.success) {
                  $('#order-tabs').tabs('select', 'tab2');

                  var params = [
                    {
                      name: 'username',
                      value: $form.find('[name="username"]').val(),
                    },
                    {
                      name: 'phone',
                      value: $form.find('[name="phone"]').val(),
                    },
                    {
                      name: 'email',
                      value: $form.find('[name="email"]').val(),
                    },
                  ];

                  orderController.setData(params);

                  $form.trigger('reset');

                } else {
                  M.toast({
                    html: 'При отправке сообщения произошла ошибка.'
                  });
                }
              },

              complete: function() {
                $form.find('[type="submit"]').prop('disabled', false);
              }
            });

          return false;
        },
        rules: {
          email: {
            required: true,
            email: true,
          },
        },
      },

      callback: {
        submitHandler: function(form) {

          var $form = $(form),
            data = $form.serialize() + '&template=' + $form.attr('name');

          $.ajax({
            data: data,
            beforeSend: function() {
              $form.find('[type="submit"]').prop('disabled', true);
            },

            success: function(response) {

              if (response.success) {
                M.toast({
                  html: 'Заяка успешно отправлена.'
                });

                var modal = form.closest('.modal'),
                  instance = M.Modal.getInstance(modal);

                instance.close();

                $form.trigger('reset');
              }

            },

            complete: function() {
              $form.find('[type="submit"]').prop('disabled', false);
            }
          });

          return false;
        },
        rules: {
          phone: {
            required: true,
          },
        },
      },

      order: {
        submitHandler: function(form) {

          var $form = $(form),
            data = $form.serialize() + '&template=' + $form.attr('name');

          $.ajax({
            data: data,
            beforeSend: function() {
              $form.find('[type="submit"]').prop('disabled', true);
            },

            success: function(response) {

              if (response.success) {
                $('#order-tabs').tabs('select', 'tab3');

                $form.trigger('reset');

              } else {
                M.toast({
                  html: 'При отправке сообщения произошла ошибка.'
                });
              }
            },

            complete: function() {
              $form.find('[type="submit"]').prop('disabled', false);
            }
          });

          return false;
        },

        errorPlacement: function(error, element) {
          M.toast({
            html: error,
          });
          return true;
        },

        rules: {
          'type[]': {
            required: true,
          }
        },
        messages: {
          'type[]': {
            required: 'Пожалуйста выберите услугу.'
          },
        },
      },

    };

    Array.from(document.querySelectorAll('.form')).map(function(elem) {

      var validator = elem.dataset.validate;

      if (elem.id === 'order-calc') {
        orderController.init(elem);
      }

      var options = Object.assign({}, config.default, config[validator])

      $(elem).validate(options);

    });

  },

};

var orderController = {

  init: function( elem ) {
    var $form = $(elem),
      $checkboxs = $form.find('input[type="checkbox"]'),
      count = 0;

    $checkboxs.on('change', function(){
      var $this = $(this);

      if ($this.prop('checked')) {

        if (count >= 3) {
          $this.prop('checked', false);

          M.toast({
            html: 'Одновременно можно заказать не более 3х услуг.'
          });

          return false;
        }

        ++count;

      } else {
        --count;
      }

      var fullSum = 0,
        maxCost = 0,
        isDiscounted = true,
        isCalc = true;

      var $checked = $form.find('[name="type[]"]:checked');

      if ($checked.length > 0) {

        $checked.each(function() {

          var $this = $(this),
            price = parseInt($this.data('price'));

          if (price) {

            fullSum += price;
            maxCost = (price > maxCost) ? price : maxCost;

            if (parseInt($this.data('id')) === 6) {
              isDiscounted = false;
            }

          } else {

            isCalc = false;

          }

          _setOrderSummary({
            full: fullSum,
            discounted: (isDiscounted) ? maxCost : fullSum,
            alert: !isCalc,
          })

        });

      }

    });
  },

  setData: function(params) {

    $.each(params, function(index, data) {

      $('#order-calc').append('<input type="hidden" name="' + data.name + '" value="' + data.value +'">');
    });
  },
};

function _setOrderSummary(params) {
  var $form = $('#order-calc'),
    $summary = $form.find('.order-summary');

  if ($summary.length > 0) {

    if (params.alert) {

      $summary.find('.order-summary__price').hide();
      $summary.find('.order-summary__discount').hide();
      $summary.find('.order-summary__alert').slideDown();

    } else {

      $summary.find('.order-summary__price > span').text(_numberFormat(params.full));
      $summary.find('.order-summary__discount > span').text(_numberFormat(params.discounted));

      $summary.find('.order-summary__alert').hide();
      $summary.find('.order-summary__price').show();
      $summary.find('.order-summary__discount').show();
    }
  }

  if (params.alert) {

    var alertField = $form.find('input[name="wait"]');

    if (alertField.length > 0) {

      alertField.val('1');
    } else {
      $form.append('<input type="hidden" name="wait" value="1">');
    }

  } else {

    var alertField = $form.find('input[name="wait"]');

    if (alertField.length > 0) {

      alertField.val('0');
    }

    var inputPrice = $form.find('input[name="full"]');

    if (inputPrice.length > 0) {

      inputPrice.val(params.full);
    } else {
      $form.append('<input type="hidden" name="full" value="'+ params.full +'">');
    }

    var inputPriceDiscount = $form.find('input[name="discount"]');

    if (inputPriceDiscount.length > 0) {

      inputPriceDiscount.val(params.discounted);
    } else {
      $form.append('<input type="hidden" name="discount" value="'+ params.discounted +'">');
    }
  }
}

function _numberFormat(number) {
  var num = number.toFixed(0),
    str = num.toString();
  var rgx = /(\d+)(\d{3})/;

  while (rgx.test(str)) {
    str = str.replace(rgx, '$1' + ' ' + '$2');
  }

  return str;
}

$(document).ready(function() {
  App.init();
});