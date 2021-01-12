<style>
.tt th {
	text-align:center;
}
</style>

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
        type: 'bar',
        data: {
            labels: barlabels,
            datasets: [{
                label: '综合得分',
                data: bardata,
				backgroundColor: "rgba(55, 134, 253, 1)",
				borderColor: "rgba(54, 162, 235, 0.5)",
				borderWidth:1
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
