
var max = 0;
var steps = 10;
var chartData = {};

function respondCanvas(areaChartId) {
  
	// Get context with jQuery - using jQuery's .get() method.
    var areaChartCanvas = $(areaChartId).get(0).getContext("2d");
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
      responsive: true
    };

    //Create the line chart
    areaChart.Line(chartData, areaChartOptions);
}
var GetChartData = function (areaChartId,url,myData) {
	
	var monthsData = [];
	var totalTimeOrgEstimateData = [];
	var totalTimeSpentData = [];
    $.ajax({
        method: 'GET',
        url: url, 
        //data: { "id": projectId }, 
        data: myData,
        dataType: 'json',
        success: function (d) {
        	if(d!=null){
        	for (var i = 0; i < d.length; i++) {
        		monthsData.push(d[i].label);
        		totalTimeSpentData.push(d[i].totalTimeSpent);
        		totalTimeOrgEstimateData[i]= d[i].totalTimeOrgEstimate;
            }
        }
           chartData = {
                labels: monthsData,
                datasets: [
                    {
                    	label: "Electronics",
                        fillColor: "rgba(210, 214, 222, 1)",
                        strokeColor: "rgba(210, 214, 222, 1)",
                        pointColor: "rgba(210, 214, 222, 1)",
                        pointStrokeColor: "#c1c7d1",
                        pointHighlightFill: "#fff",
                        pointHighlightStroke: "rgba(220,220,220,1)",
                        data: totalTimeSpentData
                    },
                    {
                    	label: "Digital Goods",
                        fillColor: "rgba(60,141,188,0.9)",
                        strokeColor: "rgba(60,141,188,0.8)",
                        pointColor: "#3b8bba",
                        pointStrokeColor: "rgba(60,141,188,1)",
                        pointHighlightFill: "#fff",
                        pointHighlightStroke: "rgba(60,141,188,1)",
                        data: totalTimeOrgEstimateData
                    }
                ]
            };

           max = Math.max.apply(Math, totalTimeSpentData)+10000;
            steps = 10;

            respondCanvas(areaChartId);
        }
    });
};

function getChartDataLastYear(){
	var last_yearAreaChartId = "#last_year_areaChart";
	   // var last_monthAreaChartId = "#last_month_areaChart";
	    var url = $("#last_year").attr("target_url");
	    var projectId = $("#projectdetailsId").attr("projectId");
	    var lastYearData ="projectId="+projectId;
	    //var lastMonthData ="periode="+30+"&projectId="+ projectId;
	    GetChartData(last_yearAreaChartId,url,lastYearData);
	   // GetChartData(last_monthAreaChartId,url,lastMonthData);
}
$(document).ready(function() {
	
    $(window).resize(respondCanvas);
    getChartDataLastYear();
    
    $('#daterange-btn').daterangepicker(
            {
              ranges: {
                'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                'Last 30 Days': [moment().subtract(30, 'days'), moment()]
              },
              startDate: moment(),
              endDate: moment()
            },
            function (start, end , label) {
              $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));

              var periode = moment().diff(start, 'days');
              var chosenId = label.replace(/ /g,"_").trim();
              //
              
              $("#timeorg_timespent li").removeClass("active");
              $(".tab-content .tab-pane.active").removeClass("active");

              var element = ""+chosenId+""; 
              if(!$("#"+element).length){
            	   
            	  $("#timeorg_timespent").append('\
                		  <li id="'+chosenId+'" class="active">\
                		  		<a href="'+chosenId+'" data-toggle="tab" aria-expanded="true">\
                		  			'+label+'<span class="glyphicon glyphicon-remove pull-right"></span>\
                		  		 </a>\
                		  	</li>');

                  $(".tab-content").append('\
                		  <div class="tab-pane active" id="'+chosenId+'">\
                		  <canvas id="chosen_areaChart" class="chart" style="height:250px"></canvas>\
                  		 </div>');
               // get json
                  
                  var CustomAreaChartId = "#chosen_areaChart";
                  var url = $("#tabs").attr("target_url");
                  var projectId = $("#projectdetailsId").attr("projectId");
                  var myData ="periode="+periode+"&projectId="+ projectId;
                  console.log("myData:"+myData);
                  GetChartData(CustomAreaChartId,url,myData);
            	    
            	} else {
            	   alert("Tab already exists...");
            	}

            }
        );
    //function remove tab
    var tabs =  $( "#tabs" ).tabs();
    tabs.on( "click", "span.glyphicon-remove", function(){
    	var labelText = $(this).parent().text().trim();
    	var chosenId = labelText.replace(/ /g,"_").trim();
    	var element = ".tab-content #"+chosenId+""; 
    	$(""+element).remove();
    	$(this).parent().parent().remove();
    	$("#selectedTab").addClass( "active" );
    	getChartDataLastYear();
    	$(".tab-content .tab-pane.active").removeClass("active");
    	$(".tab-content #last_year").addClass( "active" );
    	//$('#daterange-btn').daterangepicker("refresh");
    	$('#daterange-btn').val('');
    	
    });
    
    tabs.on( "click", "li a#last_year", function(){
    	
    	getChartDataLastYear();
    	$(".tab-content .tab-pane.active").removeClass("active");
    	$(".tab-content #last_year").addClass( "active" );
    });
//    
   
    
});