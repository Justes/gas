<style>
.tt th {
	text-align:center;
}
</style>
<table class="table tt" style="text-align:center">
<thead>
<tr>
	<th>累计事件(件)</th>
	<th>已解决(件)</th>
	<th>未解决(件)</th>
</tr>
</thead>
<tr style="font-size:20px;">
	<td style="color:red"><b>{{ $stat['all'] }}</b></td>
	<td>{{ $stat['solved'] }}</td>
	<td>{{ $stat['unsolved'] }}</td>
</tr>
</table>
<div style="width:500px;height:500px;margin:50px auto;">
<canvas id="myChart" width="400" height="400"></canvas>
</div>

<div style="width:1200px;height:500px;margin:50px auto;">
<canvas id="barChart" width="1200" height="500"></canvas>
</div>
<script>
var labels = new Array()
var data = new Array()
@foreach($data as $key => $item)
labels.push('{{ $key }}')
data.push('{{ $item }}')
@endforeach

$(function () {
    var ctx = document.getElementById("myChart").getContext('2d');
	console.log(ctx)
    var myChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: labels,
            datasets: [{
                label: '# of Votes',
                data: data,
                backgroundColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(117, 114, 114, 1)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(117, 114, 114, 1)'
                ],
                borderWidth: 1
            }],
        },
    });
});

</script>

<script>
var barlabels = new Array()
var bardata = new Array()
@foreach($bar as $key => $item)
barlabels.push('{{ $key }}')
bardata.push('{{ $item }}')
@endforeach

$(function () {
    var ctx = document.getElementById("barChart").getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: barlabels,
            datasets: [{
                label: '处置时长',
                data: bardata,
				backgroundColor: "rgba(200, 201, 247, 0.1)",
				borderColor: "rgba(54, 162, 235, 0.5)",
				pointBorderColor:"rgba(54, 162, 235, 1)",
				pointBackgroundColor: "rgba(54, 162, 235, 0.8)",
            }]
        }
    });
});
</script>
