$(document).ready(function() {
  
  var $number = $("#number");
  
  $number.focus();

  var phono = $.phono({
    apiKey: "9d690e266ec3db26934eaff4d261cd76",
  });
  
  $('.button').click(function (e) {
    $number.focus();
    var value = $number.val();
    value += $(this).find('.value').text();
    $number.val(value);
  });
  
  $('#dial').click(function (e) {
    var number = $number.val();
    call = phono.phone.dial(number);
  });

});