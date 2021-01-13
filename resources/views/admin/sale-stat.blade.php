<style>
.tt th {
	text-align:center;
}
</style>

<table class="table tt" style="font-size:22px;text-align:center">
<thead>
<tr>
	<th>销量</th>
	<th>销售量(瓶)</th>
	<th>钢瓶容积(升)</th>
	<th>销售总量(升)</th>
</tr>
</thead>
<tr>
	<td>本月</td>
@foreach($cur as $item)
	<td>{{ $item }}</td>
@endforeach

</tr>
<tr>
	<td>上月</td>
@foreach($last as $item)
	<td>{{ $item }}</td>
@endforeach
</tr>
<tr>
	<td>月环比</td>
@foreach($rate as $item)
	<td style="color:red">{{ $item }}%</td>
@endforeach
</tr>
</table>

<div style="width:500px;height:500px;margin:50px auto;">
<canvas id="barChart" width="400" height="400"></canvas>
</div>
<script>
var barlabels = new Array()
var bottle = new Array()
var volume = new Array()
var sale = new Array()

@foreach($dates as $item)
barlabels.push('{{ $item }}')
@endforeach

@foreach($bottles as $item)
bottle.push('{{ $item }}')
@endforeach

@foreach($volumes as $item)
volume.push('{{ $item }}')
@endforeach

@foreach($sales as $item)
sale.push('{{ $item }}')
@endforeach

$(function () {
    var ctx = document.getElementById("barChart").getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: barlabels,
            datasets: [{
                label: '销售量(瓶)',
                data: bottle,
				backgroundColor: "rgba(54, 162, 235, 0.1)",
				borderColor: "rgba(54, 162, 235, 0.5)",
				pointBorderColor:"rgba(54, 162, 235, 1)",
				pointBackgroundColor: "rgba(54, 162, 235, 0.8)",
			}, {
			   label: '钢瓶容积(升)',
                data: volume,
				backgroundColor: "rgba(151,187,205,0.1)",
				borderColor: "rgba(151,187,205,1)",
				pointBorderColor:"rgba(151,187,205,1)",
				pointBackgroundColor: "rgba(151,187,205,1)",
			}, {
			   label: '销售总量(升)',
                data: sale,
				backgroundColor: "rgba(75, 192, 192, 0.1)",
				borderColor: "rgba(75, 192, 192, 1)",
				pointBorderColor:"rgba(75, 192, 192, 1)",
				pointBackgroundColor: "rgba(75, 192, 192, 1)",
			}]
        },
		options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            }
        }
    });
});
</script>
