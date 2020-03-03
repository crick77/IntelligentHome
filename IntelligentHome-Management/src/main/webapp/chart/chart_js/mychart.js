String.prototype.shuffle = function () {
    var a = this.split(""),
        n = a.length;

    for(var i = n - 1; i > 0; i--) {
        var j = Math.floor(Math.random() * (i + 1));
        var tmp = a[i];
        a[i] = a[j];
        a[j] = tmp;
    }
    return a.join("");
}

var ctx = document.getElementById('myChart').getContext('2d');

var chart = new Chart(ctx, {
		type: 'line',
		fill: true,		
		data: {
			//labels: ["H1", "H2", "H3", "H4", "H5", "H6"],
			datasets: [],
		},
		options: {
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}],
				xAxes: [{
					type: 'time',
						distribution: 'series',
						offset: true,
						ticks: {
							major: {
								enabled: true,
								fontStyle: 'bold'
							},
							source: 'auto',
							autoSkip: true,
							autoSkipPadding: 75,
							maxRotation: 0,
							sampleSize: 100
						},
						time: {
		                    displayFormats: {		                       
		                        day: 'MMM D, hA',
		                        hour: 'MMM D, h:mm a',
		                        minute: 'MMM D, h:mm a'
		                    }
		                }
				}]
			}
		}
	});

$(document).ready(function() {
    $('.js-example-basic-multiple').select2();
    
    loadDevices();
});


function updateCharts() {
	let devlist = $("#deviceList").val();
	if(devlist.length<1) {
		alert("Selezionare almeno un dispositivo!");
		return;
	}
	
	let q = "";
	devlist.forEach(v => {
		q+="devices="+v+"&";
	});
	q += "days="+$("#days").val();
	
	var url = "http://localhost:8080/IntelligentHome-Management/api/rest/services/getHistoryData?"+q;
	$.get(url, function( data ) {
	    chart.data.datasets = [];
		
		devlist.forEach(dev => {
			let sensorData = [];
			data[dev].forEach(v => {
				sensorData.push({
					t: v.datetime,
					y: v.value
				});
			});
			
			let dataset = {
				data: sensorData,
				label: dev,
				backgroundColor: [],
				borderColor: [],
				borderWidth: 1
			};
			
			sensorData.forEach(e => {
				let clr = getRandomColor2(true);
				light = clr+"0.2)";
				dark = clr+"1.0)";
				dataset.backgroundColor.push(light);
				dataset.borderColor.push(dark);
			});
			
			chart.data.datasets.push(dataset);
			chart.update();	
		});
	});		
}

function getRandomColor() {
    let color = 'rgba(';
    for (var i = 0; i < 3; i++ ) {
        color += Math.floor(Math.random() * 256)+", ";
    }	
    console.log(color);
    return color;
}	

function getRandomColor2() {
	  let letters = '0123456789ABCDEF'.shuffle();
	  let color = 'rgba(';
	  for (var i = 0; i < 3; i++) {
		let part = letters[Math.floor(Math.random() * 16)]+''+letters[Math.floor(Math.random() * 16)];
	    color += parseInt('0x'+part)+', ';
	  }
	  return color;
	}

function loadDevices() {
	var url = "http://localhost:8080/IntelligentHome-Management/api/rest/services/getAllDevices";
	var devlist = $("#deviceList");
	$.get(url, function( data ) {
		let json = JSON.parse(data);
		json.forEach(v => {
			var option = "<option value='" + v + "'>" + v + "</option>";
			devlist.append(option);
		});
	});
}

