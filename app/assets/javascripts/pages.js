$(document).ready(function() {

  $('#dashboard_products a').click(function (e) {
    e.preventDefault()
    $(this).tab('show')
  })
});