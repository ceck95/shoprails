/***
 * Excerpted from "Agile Web Development with Rails",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
***/
// This is a manifest file that'll be compiled into application.js, which will
// include all the files listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts,
// vendor/assets/javascripts, or vendor/assets/javascripts of plugins, if any,
// can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at
// the bottom of the compiled file.
//
// Read Sprockets README
// (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require pace.min
//= require jquery
//= require best_in_place
//= require jquery-ui
//= require best_in_place.jquery-ui
//= require jquery_ujs
//= require jquery.purr
//= require bootstrap
//= require bootstrap-editable
//= require bootstrap-editable-rails
//= require turbolinks
//= require jquery.cycle2.min
//= require jquery.easing.1.3
//= require jquery.parallax-1.1
//= require jquery.mousewheel.min
//= require jquery.mCustomScrollbar
//= require icheck.min
//= require grids
//= require owl.carousel.min
//= require select2.min
//= require bootstrap.touchspin
//= require home
//= require script
//= require test
//= require rails.validations
//= require_tree .

$(document).ready(function(){
	$('.delay').fadeOut(8000);
});
$(document).ready(function() {
  /* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();
});
$(document).ready(function(){
	$('.editable').editable();
});
