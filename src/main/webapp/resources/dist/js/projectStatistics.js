/*$(document).ready(function () {
	
	var data1 = new Array();
	var data2 = new Array();
	var data3 = new Array();
	
	var projectId = $("#projectdetailsId").attr("projectId");
	console.log("projectId:"+projectId);
	$.ajax({ 
	    type: 'GET', 
	    url: 'http://localhost:8080/eaimonitor/projectStatistics.json', 
	    data: { "id": projectId }, 
	    dataType: 'json',
	    success: function (data) { 
	    	for (var i = 0; i < data.length; i++) {

                //dataPoints.push({ label: data[i].source, y: data[i].sourcecount });
	    		console.log("data i:"+data[i].totalTimeOrgEstimate);
                data1.push(data[i].totalTimeOrgEstimate);
	    		data2.push(data[i].totalTimeSpent);
	    		data3.push(data[i].month);
            }
	    	
	    }
	});
	
	data1 = ["January", "February", "March", "April", "May", "June", "July"];
	data2 = [65, 59, 80, 81, 56, 55, 40];
	data3 =  [28, 48, 40, 19, 86, 27, 90];
   console.log("data1:"+data1);
   console.log("data2:"+data2);
   console.log("data3:"+data3);
	
	var areaChartData1 = {
			labels: data3,
		      datasets: [
		        {
		          label: "TIMESPENT ",
		          fillColor: "rgba(210, 214, 222, 1)",
		          strokeColor: "rgba(210, 214, 222, 1)",
		          pointColor: "rgba(210, 214, 222, 1)",
		          pointStrokeColor: "#c1c7d1",
		          pointHighlightFill: "#fff",
		          pointHighlightStroke: "rgba(220,220,220,1)",
		          data: data1
		        },
		        {
		          label: "TIME ORIGINAL ESTIMATE",
		          fillColor: "rgba(60,141,188,0.9)",
		          strokeColor: "rgba(60,141,188,0.8)",
		          pointColor: "#3b8bba",
		          pointStrokeColor: "rgba(60,141,188,1)",
		          pointHighlightFill: "#fff",
		          pointHighlightStroke: "rgba(60,141,188,1)",
		          data: data2
		        }
		      ]
		    };
	
	console.log("areaChartData1:"+areaChartData1);
	createAreaChart(areaChartData1);
});	
 //--------------
    //- AREA CHART -
    //--------------
function createAreaChart(areaChartData){
    // Get context with jQuery - using jQuery's .get() method.
    var areaChartCanvas = $("#areaChart").get(0).getContext("2d");
    // This will get the first returned node in the jQuery collection.
    var areaChart = new Chart(areaChartCanvas);


    var areaChartOptions = {
      //Boolean - If we should show the scale at all
      showScale: true,
      //Boolean - Whether grid lines are shown across the chart
      scaleShowGridLines: false,
      //String - Colour of the grid lines
      scaleGridLineColor: "rgba(0,0,0,.05)",
      //Number - Width of the grid lines
      scaleGridLineWidth: 1,
      //Boolean - Whether to show horizontal lines (except X axis)
      scaleShowHorizontalLines: true,
      //Boolean - Whether to show vertical lines (except Y axis)
      scaleShowVerticalLines: true,
      //Boolean - Whether the line is curved between points
      bezierCurve: true,
      //Number - Tension of the bezier curve between points
      bezierCurveTension: 0.3,
      //Boolean - Whether to show a dot for each point
      pointDot: true,
      //Number - Radius of each point dot in pixels
      pointDotRadius: 4,
      //Number - Pixel width of point dot stroke
      pointDotStrokeWidth: 1,
      //Number - amount extra to add to the radius to cater for hit detection outside the drawn point
      pointHitDetectionRadius: 20,
      //Boolean - Whether to show a stroke for datasets
      datasetStroke: true,
      //Number - Pixel width of dataset stroke
      datasetStrokeWidth: 2,
      //Boolean - Whether to fill the dataset with a color
      datasetFill: true,
      //String - A legend template
      legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].lineColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>",
      //Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
      maintainAspectRatio: true,
      //Boolean - whether to make the chart responsive to window resizing
      responsive: true,
      multiTooltipTemplate:"<%= datasetLabel %> - <%= value %>"
    };

    console.log("areaChartData:"+areaChartData);
    //Create the line chart
    areaChart.Line(areaChartData, areaChartOptions);

}

*/
