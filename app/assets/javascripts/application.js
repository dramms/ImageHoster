// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .



jQuery(document).ready(function(){



	jQuery('.Picture').mouseover(function(){
		jQuery(this).children('.PictureToolbar').show();
	});
	jQuery('.Picture').mouseout(function(){
		jQuery(this).children('.PictureToolbar').hide();
	});

	jQuery('tbody tr').mouseover(function(){
		jQuery(this).css('background-color', 'white');
	});
	jQuery('tbody tr').mouseout(function(){
		jQuery(this).css('background-color', '#E9E9E9');
	});

/*****************************ProjectSearch***********************************************************/


	jQuery('#searchButton').click(function(){
		jQuery('#searchTableRows').toggle();
		jQuery('#searchContentForm').toggle();
	});


	jQuery('#searchTableRows').focusin(function(){
		jQuery(this).keyup(function(){
			jQuery("#searchTable .SearchRow").hide();
			var $searchItem = jQuery(this).val();

			if($searchItem == ""){
				jQuery('#searchTable .SearchRow').show();
			}else{
				jQuery.expr[':'].contains = function(a, i, m) {
					  return jQuery(a).text().toUpperCase()
					      .indexOf(m[3].toUpperCase()) >= 0;
				};

				console.log($searchItem);
				$test = jQuery("td:contains('"+$searchItem+"')");
				jQuery("td:contains('"+$searchItem+"')").each(function(){
					jQuery(this).parent().show();
				});
			}
		});
	});





});