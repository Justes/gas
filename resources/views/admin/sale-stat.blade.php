<style>
.tt th {
	text-align:center;
}
</style>

<table class="table tt" style="text-align:center">
<thead>
<tr>
	<th>销量</th>
	<th>销售量(瓶)</th>
	<th>钢瓶容积(升)</th>
	<th>销售总量(升)</th>
</tr>
</thead>

@foreach($quarters as $key => $q)
<tr>
	<td>第{{$key}}季度</td>
@foreach($q as $item)
	<td>{{ $item }}</td>
@endforeach
</tr>
@endforeach

</table>

<div style="width:1200px;height:400px;margin:50px auto;">
<canvas id="barChart" width="1200" height="400"></canvas>
</div>
<script src="/vendor/laravel-admin-ext/chartjs/Chart.bundle.min.js"></script>
<script>
var barlabels = new Array()
var bottle = new Array()
var volume = new Array()
var sale = new Array()

@foreach($quarters as $key => $item)
barlabels.push('第{{ $key }}季度')
bottle.push('{{ $item['bottle_num'] }}')
volume.push('{{ $item['volume'] }}')
sale.push('{{ $item['sale_num'] }}')
@endforeach

/*
@foreach($bottles as $item)
@endforeach

@foreach($volumes as $item)
@endforeach

@foreach($sales as $item)
@endforeach
 */

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
