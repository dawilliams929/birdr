$(document).on('ready', function() {
	$(document).on('nested:fieldAdded', function (event) {
	  $("input[id$='species_name']").autocomplete({
	    source: $("input[id$='species_name']").data('autocomplete-source')
	  });
	});
});