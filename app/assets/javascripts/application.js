// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require materialize-sprockets 
//= require_tree .
$( document ).ready(function () {
    $(".dropdown-button").dropdown();
    $('select').material_select();
    $('.datepicker').on('mousedown',function(event){
    event.preventDefault(); //so the picker doesn't disappear 
    });
    $('.datepicker').pickadate({    
        format: 'mmmm dd, yyyy',    
        formatSubmit: 'mmmm dd, yyyy',     
        selectMonths: true, // Creates a dropdown to control month     
        selectYears: 15, // Creates a dropdown of 15 years to control year,     
        today: 'Today',     
        clear: 'Clear',     
        close: 'Ok',     
        closeOnSelect: false // Close upon selecting a date,   
    });
     $('.timepicker').on('mousedown',function(event){
    event.preventDefault(); //so the picker doesn't disappear 
    });
    $('.timepicker').pickatime({
    default: 'now',
    twelvehour: true, // change to 12 hour AM/PM clock from 24 hour
    donetext: 'OK',
    autoclose: false,
    });
});
$( document ).ready(function () {
    $('.parallax').parallax();
});
$(document).ready(function() {
    $('input#input_text, textarea').characterCounter();
  });
