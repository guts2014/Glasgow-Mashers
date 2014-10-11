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