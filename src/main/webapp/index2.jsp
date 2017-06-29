<%--
  Created by IntelliJ IDEA.
  User: dengziming
  Date: 24/06/2017
  Time: 2:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta charset="utf-8">
    <title>ECharts</title>
    <script src="js/echarts.js"></script>
</head>
<body>
<div id="main" style="width:100%;height:400px;"></div>
<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('main'));

    // 模拟数据
    function getVirtulData(year) {
        year = year || '2017';
        var date = +echarts.number.parseDate(year + '-01-01');
        var end = +echarts.number.parseDate(year + '-12-31');
        var dayTime = 3600 * 24 * 1000;
        var data = [];
        for (var time = date; time <= end; time += dayTime) {
            data.push([
                echarts.format.formatTime('yyyy-MM-dd', time),
                Math.floor(Math.random() * 10000)
            ]);
        }
        return data;
    }
    var option = {
        visualMap: {
            show: false,
            min: 0,
            max: 10000
        },calendar: {
            range: '2017'
        },
        series: {
            type: 'heatmap',
            coordinateSystem: 'calendar',
            data: getVirtulData(2017)
        }
    };
    myChart.setOption(option);
</script>
</body>
</html>