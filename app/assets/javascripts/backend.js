// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//

// Core javascripts do not remove
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap

// Init plugins
//= require app
//= require app.plugin

// Important plugins put in all pages
//= require slimscroll/jquery.slimscroll.min
//= require fuelux/fuelux.js
//= require datepicker/bootstrap-datepicker
//= require slider/bootstrap-slider.js
//= require file-input/bootstrap-filestyle.min
//= require libs/moment.min
//= require combodate/combodate
//= require select2/select2.min
//= require markdown/epiceditor.min
//= require jquery-fileupload/jquery.html5-fileupload

// Dynamic nested form plugins
//= require cocoon

// require_tree .

//= require backend/images
//= require backend/orders
//= require backend/products
//= require backend/prototypes

//= require turbolinks

$(document).on('page:fetch', function() {
  $(".loading-indicator").show();
});
$(document).on('page:change', function() {
  $(".loading-indicator").hide();
});
$(document).ajaxStart(function() {
  $(".loading-indicator").show();
});
$(document).ajaxComplete(function() {
  $(".loading-indicator").hide();
});
