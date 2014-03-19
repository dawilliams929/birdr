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
//= require jquery.ui.all
//= require jquery_ujs
//= require bootstrap.min
//= require turbolinks
//= require jquery_nested_form
//= require_tree .

$(document).on('ready', function() {
	$(document).on('nested:fieldAdded', function (event) {
	  $("input[id$='species_name']").autocomplete({
	    source: $("input[id$='species_name']").data('autocomplete-source')
	  });
	});
});

