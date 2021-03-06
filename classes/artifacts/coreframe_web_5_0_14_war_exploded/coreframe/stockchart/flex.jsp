<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
<script src="./common/js/coreframe_data.js" language="javascript"></script>
<script src="./common/js/prototype-1.6.0.3.js" language="javascript"></script>	
<script src="./common/js/AC_OETags.js" language="javascript"></script>
<script src="./common/js/webponent_stockchart.js" language="javascript"></script>
<script language="javascript">

contextPath = '<%=request.getContextPath()%>';

function init() {
	/*
	webponent.stockchart() 메소드 매개변수 값 설명

	var option = {'플래시차트 스타일 설정 파일 경로 및 파일명',
				  '종목코드',
				  'bld1경로(데이터 리스트)',
				  'bld2경로(데이터명 ex : 대한항공)',
				  'bld3경로(차트에서 움직일때 데이터 리스트)',
				  'bld4경로(차트에서 움직일때 데이터명 ex : 대한항공)',
				  'bld5경로(검색될 데이터)'}
	
	webponent.stockchart(
		'차트가 출력될 DIV ID명',
		'출력될차트구분 s or f (s : 실버라이트 , f : 플랙스)',
		'플래시차트 width 사이즈',
		'플래시차트 height 사이즈',
		option
	)
	*/	
		
	var option = {chartStyle:'',
			  	  code:'003490',
			  	  bld1:'samples/stockchart/derby_outputList',
			  	  bld2:'samples/stockchart/derby_outputMap',
			  	  bld3:'samples/stockchart/derby_outputList_comparison',
			  	  bld4:'samples/stockchart/derby_outputMap_comparison',
			  	  bld5:'samples/stockchart/derby_suggest'};
	  
	var stockchart = new webponent.stockchart('chart','f','712','550',option);
	stockchart.show();
}

</script>
</head>
<body onload='init()'>

	<div id="chart"></div>

</body>
</html>