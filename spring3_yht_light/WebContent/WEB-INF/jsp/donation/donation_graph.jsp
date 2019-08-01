<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

<div id="container" style="min-width: 310px; max-width: 800px; height: 400px; margin: 0 auto"></div>


<script type="text/javascript">
Highcharts.chart('container', {
	  chart: {
	    type: 'bar'
	  },
	  title: {
	    text: '총 후원금'
	  },
	  xAxis: {
	    categories: ['후원금']
	  },
	  yAxis: {
	    min: 0,
	    title: {
	      text: '현재날짜'
	    }
	  },
	  legend: {
	    reversed: true
	  },
	  plotOptions: {
	    series: {
	      stacking: 'normal'
	    }
	  },
	  
	  series: [{
	    name: '도네이션',
	    data: [30000]
	  }]
	  
	});

</script>

</body>
</html>