<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.bundle.js" integrity="sha512-FoyrIocrD2VGbh1HeDL8s/e+kNw0bl1WQHYlomgPuGe0N8y70F92YFUXW4Bompp9TrScjOiIPDSCM+ID0YXeqg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
#box{
	width: 300px;
	height: 300px;
	background-color: black;
}
</style>
<script>
 $(document).ready(function(){

		$.ajax({
			type : 'get',
			url : '${pageContext.request.contextPath}/chartshow',
			dataType : 'json',
			success : function(data, xhr) {
				console.log(data);

				var labels = [];
				var myData = [];
				var label = [];
				//맵안에서 list였으니 for문으로 돌린다.
				$.each(data.list, function(k, v) {
					labels.push(v.bregdate);
					myData.push(v.count);
					label.push(v.count);
					
				});
				var newLabels = labels;
				var newMyData = myData;
				var ctx = $('#doughnut-chart');

				makeChart(ctx, 'doughnut', newLabels, newMyData);

			},
			error : function(status, request, error) {

				alert("에러");
			}

		});
	});
 
 var num = Math.random(); 
 function makeChart(ctx,type,labels,data){
	 var dateChart = new Chart(ctx, {
		type: type,
		data: {
			labels: labels,
			datasets:[{
				label: data,
				data: data,
				borderColor:'white',
				borderWidth: 1,
				backgroundColor:['red','yellow','purple'],
				datalabel:{
					color: 'white',
					font:{size:13}
				}
				
			}]
		},
		  options:{
			  responsive: true, 
			  legend: { 
				  display: false 
				  }, 
				  elements: { 
					  center: { 
						  text: 'dktq', 
						  fontStyle: 'Helvetica', 
						  //Default Arial 
						  sidePadding: 15 
						  //Default 20 (as a percentage) 
				  } 
				  },
				  maintainAspectRatio : false, 
				  cutoutPercentage:70, 
				  animation:false, 
				  rotation: 1 * Math.PI, 
				  circumference: 1 * Math.PI

				 
			  }
		
 	});
}
 

</script>
</head>
<body>
<h1>차트 연습 페이지</h1>
   <div id="box">
<!--    	<div id="doughnut-chart"></div> -->
	<canvas id = "doughnut-chart"></canvas>
	<ul id="list"></ul>
    </div>
</body>
</html>