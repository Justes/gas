<style>
.tt th {
	text-align:center;
}
</style>

<table class="table tt" style="font-size:22px;text-align:center">
<thead>
<tr>
	<th>{{ $comName }}</th>
	<th>用气量(L)</th>
</tr>
</thead>
<tr>
	<td>本月</td><td>{{ $cur }}</td>
</tr>
<tr>
	<td>上月</td><td>{{ $last}}</td>
</tr>
<tr>
	<td>月环比</td><td style="color:red">{{ $rate }}</td>
</tr>
</table>

<div style="width:500px;height:500px;margin:50px auto;">
<canvas id="barChart" width="400" height="400"></canvas>
</div>
<script>
var barlabels = new Array()
var bardata = new Array()
@foreach($bar as $key => $item)
barlabels.push('{{ $key }}')
bardata.push('{{ $item }}')
@endforeach

console.log(bardata)
$(function () {
    var ctx = document.getElementById("barChart").getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: barlabels,
            datasets: [{
                label: '用气量(L)',
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
