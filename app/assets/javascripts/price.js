$(function(){
  $('#sell-price').on('keyup', function(){
    var price = $(this).val();
    let tax = $('#sell-price').val();
    if (price >= 300 && price <= 9999999) {
      $('#comercial_cost').text(Math.ceil(tax * 0.1) + "円");
      $('#profit').text(Math.ceil(tax - (tax * 0.1)) + "円");
    } else {
      $('#fomercial_cost').text('--')
      $('#profit').text('--')
    }
  });
});

