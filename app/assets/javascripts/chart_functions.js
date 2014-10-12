function two_arrays_chart(data_string, div_id, array1, array2){
	var dataPoints2 = [];
	var dataPoints3 = [];
	for(var i = 1;  i<= array1.length; i++){
		dataPoints2.push({label: i, y: array1[i-1]});
		dataPoints3.push({label: i, y: array2[i-1]});
	}
	var chart = new CanvasJS.Chart(div_id,
	{
		backgroundColor: "#252525",
		title:{
			text: data_string,
			fontColor: "#FFFFFF"
		},
		axisX:{
			title: "Days passed",
			labelFontColor: "#FFFFFF",
			titleFontColor: "#FFFFFF"
		},
		axisY:{
			labelFontColor: "#FFFFFF"
		},

		data: [
		{
			type: "line",
			dataPoints: dataPoints2
		},
		{
			type: "line",
			dataPoints: dataPoints3
		}
		]
	});
	if(array1.length > 30){
		dataPoints2.shift();
		dataPoints3.shift();
	}
	chart.render();
}

function one_array_chart(data_string, div_id, array1){
	var dataPoints_ = [];
	for(var i = 1;  i<= array1.length; i++){
		dataPoints_.push({label: i, y: array1[i-1]});
	}
	var chart = new CanvasJS.Chart(div_id,
	{
		backgroundColor: "#252525",
		title:{
			text: data_string,
			fontColor: "#FFFFFF"
		},
		axisX:{
			title: "Days passed",
			labelFontColor: "#FFFFFF",
			titleFontColor: "#FFFFFF"
		},
		axisY:{
			labelFontColor: "#FFFFFF"
		},

		data: [
		{
			type: "line",
			dataPoints: dataPoints_
		}
		]
	});
	if(array1.length > 30){
		dataPoints_.shift();
	}
	chart.render();
}

$(document).ready(function(){
	$('#income').on('click', function(){

		$.get("/days", function(data){
			money_data = data.map(function(value){
				return value["money"];
			});

			one_array_chart("Money", 'main_area', money_data);
		});
	});

	$('#expenses').on('click', function(){

		$.get("/days", function(data){
			money_data = data.map(function(value){
				return value["expenses"];
			});

			one_array_chart("Expenses", 'main_area', money_data);
		});
	});

	$('#income-exp').on('click', function(){

		$.get("/days", function(data){
			money_data = data.map(function(value){
				return value["money"];
			});

			exp_data = data.map(function(value){
				return value["expenses"];
			});

			two_arrays_chart("Money/Expenses", 'main_area', money_data, exp_data);
		});
	});

	$('#avg-happy').on('click', function(){

		$.get("/days", function(data){
			happiness = data.map(function(value){
				return value["average_staff_happiness"];
			});

			one_array_chart("Average Happiness", 'main_area', happiness);
		});
	});

	$('#avg-produc').on('click', function(){

		$.get("/days", function(data){
			productivity = data.map(function(value){
				return value["average_productivity"];
			});

			one_array_chart("Average Productivity", 'main_area', productivity);
		});
	});

	$('#happy-produc').on('click', function(){

		$.get("/days", function(data){
			happiness = data.map(function(value){
				return value["average_staff_happiness"];
			});

			productivity = data.map(function(value){
				return value["average_productivity"];
			});

			two_arrays_chart("Average Happiness/Productivity", 'main_area', happiness, productivity);
		});
	});

});