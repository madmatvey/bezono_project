(function() {
  $(document).ready(function() {
    $('.btn-select').each(function(e) {
      var value;
      value = $(this).find('ul li.selected').html();
      if (value !== void 0) {
        $(this).find('.btn-select-input').val(value);
        $(this).find('.btn-select-value').html(value);
      }
    });
  });

  $(document).on('click', '.btn-select', function(e) {
    var target, ul, value;
    e.preventDefault();
    ul = $(this).find('ul');
    if ($(this).hasClass('active')) {
      if (ul.find('li').is(e.target)) {
        target = $(e.target);
        target.addClass('selected').siblings().removeClass('selected');
        value = target.html();
        $(this).find('.btn-select-input').val(value);
        $(this).find('.btn-select-value').html(value);
      }
      ul.hide();
      $(this).removeClass('active');
    } else {
      $('.btn-select').not(this).each(function() {
        $(this).removeClass('active').find('ul').hide();
      });
      ul.slideDown(300);
      $(this).addClass('active');
    }
  });

  $(document).on('click', function(e) {
    var target;
    target = $(e.target).closest('.btn-select');
    if (!target.length) {
      $('.btn-select').removeClass('active').find('ul').hide();
    }
  });

}).call(this);
