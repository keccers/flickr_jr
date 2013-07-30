$(document).ready(function() {
  $('#login-show').on('click', function(event){
    event.preventDefault();
    if ($('#signup').is(":visible")) {
      $('#signup').hide();
    }
    $('#login').slideToggle('fast')
  });

  $('#sign-up-show').on('click', function(event){
    event.preventDefault();
    if ($('#login').is(":visible")) {
      $('#login').hide();
    }
    $('#signup').slideToggle('fast')
  });
});
