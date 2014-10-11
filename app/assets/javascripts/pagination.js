$(document).ready(function (){
	paginationFunction();
});

function paginationFunction(){
	var page_number = 0;
	$staff_area = $('#staff-member-display');
	var add_elements_to_canvas = "";

	$('#prev').on('click', function(event){
		

		if (page_number == 0) {
			return;
		}

		$staff_area.fadeOut(500, function(){
			page_number -= 1;
			add_elements_to_canvas = "";

			$.get('/staff/' + page_number, function(data, status){
				for (i = 0; i < data.length; i++) {
					add_elements_to_canvas += parse_helper(data[i].name, data[i].happiness, data[i].salary, data[i].performance);
				} 

				$staff_area.html(add_elements_to_canvas);
				$staff_area.fadeIn(500);
			});
		});

	});

	$('#next').on('click', function(data,status){

		if (page_number == data.length) {
			return;
		}

		$staff_area.fadeOut(500, function(){
			page_number += 1;
			add_elements_to_canvas = "";

			$.get('/staff/' + page_number, function(data, status){

				for (i = 0; i < data.length; i++) {
					add_elements_to_canvas += parse_helper(data[i].name, data[i].happiness, data[i].salary, data[i].performance);
				} 

				$staff_area.html(add_elements_to_canvas);
				$staff_area.fadeIn(500);
			});
		});
	});
}


function parse_helper(name, happiness, salary, performance){
	var output = '';
	output +=  '<div class="col-md-2 staff-styling"> \
					<div class="well"> \
						Name:'       + name        + '<br> \
						Happiness:'  + happiness   + '<br> \
						Salary: '    + salary      + '<br> \
						Performance:'+ performance + '<br> \
					</div> \
				</div>'
	return output;
}