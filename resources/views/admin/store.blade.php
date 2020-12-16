<div style="width:500px;height:500px;margin:0 auto;">
<canvas id="myChart" width="400" height="400"></canvas>
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
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(117, 114, 114, 1)'
                ],
                borderColor: [
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
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
