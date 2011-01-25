var Worthy = {};  //set up namespace for this module

Worthy.attachPlaceholder = function(input, default_text, class_name){
	
	if (!class_name){
		class_name = "placeholder";
	}
	
	input.addClass(class_name);
	input.val(default_text);
		
	input.focus(function(){
		input.removeClass(class_name);
		if (input.val() == default_text){
			input.val("");
		}
	});
	
	input.blur(function(){
		if (input.val() == ""){
			input.addClass(class_name);
			input.val(default_text);
		}
	});
};

Worthy.prepareSearchBox = function(){
	var search_input = jQuery("form.search div.search input");
	Worthy.attachPlaceholder(search_input, "Find a charity, cause, project, or loan.", "default");
};

// get all input elements with a placeholder attribute and make them JavaScript-based
// for browsers that don't support HTML5
Worthy.attachPlaceholders = function(){
	if (!Modernizr.input.placeholder) {
		var placeholder_inputs = jQuery(document).find('input[placeholder]').each(function(index){
			var input = jQuery(this);
			Worthy.attachPlaceholder(input, input.attr("placeholder"));
		});
	}
};

Worthy.prepareDocument = function(){
	Worthy.attachPlaceholders();
	//Worthy.prepareSearchBox();
};

jQuery(document).ready(Worthy.prepareDocument);
