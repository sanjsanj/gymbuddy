$(document).ready(function() {
  var constant = 0;
  $( "#gender" ).click(function() {
    if(constant === 0) {
      $('.0').toggle();
      constant = 1;
      $("#post_gender").text('Female')
    } else if(constant === 1) {
      $('.1').toggle();
      constant = 2;
      $("#post_gender").text('Male')
      $('.0').toggle();
    } else if(constant === 2) {
      $('.0').toggle();
      constant = 1;
      $("#post_gender").text('Female')
      $('.1').toggle();
    };
  });
});