//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require materialize-sprockets
//= require turbolinks
//= require_tree .

  $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15 // Creates a dropdown of 15 years to control year
  });
