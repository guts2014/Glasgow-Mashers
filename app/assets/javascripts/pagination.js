$(document).ready(function (){
	paginationFunction();
	paginationFunctionCustomers()
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
				for (i = 0; i < data.length - 1; i++) {
					add_elements_to_canvas += parse_helper(data[i].name, data[i].happiness, data[i].salary, data[i].performance);
				} 

				$staff_area.html(add_elements_to_canvas);
				$staff_area.fadeIn(500);
			});
		});

	});

	$('#next').on('click', function(event){
		page_number += 1;
		
		$.get('/staff/' + page_number, function(data, status){
			if(page_number >= data[data.length-1]){
				page_number -= 1;
				return;
			}

			$staff_area.fadeOut(500, function(){

				add_elements_to_canvas = "";



				for (i = 0; i < data.length - 1; i++) {
					add_elements_to_canvas += parse_helper(data[i].name, data[i].happiness, data[i].salary, data[i].performance);
				} 

				$staff_area.html(add_elements_to_canvas);
				$staff_area.fadeIn(500);
			});
		});
	});
}

function paginationFunctionCustomers(){
	var page_number = 0;
	$cust_area = $('#customer-member-display');
	var add_elements_to_canvas = "";

	$('#prev-cust').on('click', function(event){
		

		if (page_number == 0) {
			return;
		}

		$cust_area.fadeOut(500, function(){
			page_number -= 1;
			add_elements_to_canvas = "";

			$.get('/customers/' + page_number, function(data, status){
				for (i = 0; i < data["customers"].length -1; i++) {
					add_elements_to_canvas += parse_helper_customer(data["customers"][i].name, 
						data["customers"][i].affluence, data["customer_names"][i]);
				} 

				$cust_area.html(add_elements_to_canvas);
				$cust_area.fadeIn(500);
			});
		});

	});

	$('#next-cust').on('click', function(event){
		page_number += 1;
		
		$.get('/customers/' + page_number, function(data, status){
			//console.log(data)
			if(page_number >= data["page_count"]){
				return;
			}

			$cust_area.fadeOut(500, function(){

				add_elements_to_canvas = "";



				for (i = 0; i < data["customers"].length -1; i++) {
					console.log(data["customers"][i])
					add_elements_to_canvas += parse_helper_customer(data["customers"][i].name, 
						data["customers"][i].affluence, data["customer_names"][i]);

				} 

				$cust_area.html(add_elements_to_canvas);
				$cust_area.fadeIn(500);
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

function parse_helper_customer(name, affluence, staff_member_name){
	var output = '';
	output +=  '<div class="col-md-2 staff-styling"> \
	<div class="well"> \
	Name:'       + name        + '<br> \
	Happiness:'  + affluence   + '<br> \
	Handled by: '    + staff_member_name      + '<br> \
	</div> \
	</div>'
	return output;
}

