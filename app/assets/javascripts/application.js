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
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require donors
//= require bootstrap-datepicker
//= require bootstrap-filestyle
//= require organization
//= require jquery.blockUI
//= require_directory ./new_design
//= require tinymce
//= require profile






// For block/unblock UI Functionality.
var App = function(){
  return {
    blockUI: function(el){
      el.block({
        message: '',
        css: {backgroundColor: 'none'},
        overlayCSS: {
          backgroundColor:'#FFFFFF',
          backgroundImage: "url('/assets/loader.gif')",
          backgroundRepeat: 'no-repeat',
          backgroundPosition: 'center',
          opacity: 0.67
        }
      });
    },
    unBlockUI: function(el){
      el.unblock();
    }
  }
}();

