(function() {
  $(function() {
    return $('.mark-as-read').click(function() {
      var elem;
      elem = this;
      return $.ajax({
        url: $(this).data('url'),
        method: 'put'
      }).done(function() {
        return $(elem).removeClass('unread');
      });
    });
  });

}).call(this);
