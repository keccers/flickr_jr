$(document).ready(function() {
 $('#login').on('click', function(event){
  event.preventDefault;
  $.post('/login', function(response){
      console.log(response)
  });
 }); 
});
