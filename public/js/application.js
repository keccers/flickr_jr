$(document).ready(function() {
  $('#login-show').on('click', function(){
    $('#login').fadeIn('fast', function(){
      $(this).show();
    });
  });
});
