window.onload = function()
{
    getOutliers();
    getUsersCompletedTraining();
    getCrowdConfidence();
}

var userData;
var totalActiveUsers;
var totalOutliers;
var totalUsefulUsers;
var percentageTrainingCompleted;

function populateUserTypeChart() {
    var ctx = document.getElementById("usersChart").getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ["Useful", "Discounted"],
            datasets: [{
                label: 'User Types',
                data: [totalUsefulUsers, totalOutliers],
                backgroundColor: [
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(255, 99, 132, 0.2)'
                ],
                borderColor: [
                    'rgba(75, 192, 192, 1)',
                    'rgba(255,99,132,1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
}

function loadTrainingCompletionChart()
{
    var ctxP = document.getElementById("trainingCompletionChart").getContext('2d');
    var myPieChart = new Chart(ctxP, {
        type: 'pie',
        data: {
            labels: ["Completed", "Uncompleted"],
            datasets: [{
                data: [percentageTrainingCompleted, (100-percentageTrainingCompleted)],
                backgroundColor: ["#46BFBD", "#F7464A"],
                hoverBackgroundColor: ["#5AD3D1", "#FF5A5E"]
            }]
        },
        options: {
            responsive: true
        }
    });
}

function downloadExcelSpreadsheet() {
    console.log("In downloadExcelSpreadsheet()");
    var xhttp = new XMLHttpRequest();
    xhttp.open("GET", "/admin/api/swipes/excel", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState === 4) {
            if (xhttp.status === 200) {
                var filePath = xhttp.getResponseHeader("excelFilePath");
                // Set the next batch and display next image upon success
                // var fileData = JSON.parse(data);
                console.log(filePath);
                var link = document.createElement("a");
                // link.download = 'Swipe Data';
                link.href = filePath;
                link.click();
            } else {
                console.error(JSON.parse(xhttp.statusText));
            }
        }
    }
    xhttp.send();
}


function getOutliers()
{
    var xhttp = new XMLHttpRequest();
    xhttp.open("GET", "/api/usageData/outliers", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState === 4) {
            if (xhttp.status === 200) {
                var data = xhttp.responseText;
                // Set the next batch and display next image upon success
                var results = JSON.parse(data);
                totalActiveUsers = results['totalActiveUsers'];
                totalOutliers = results['totalOutliers'];
                totalUsefulUsers = totalActiveUsers - totalOutliers;
                userData = results;
                populateUserTypeChart();
                console.log(results);
                console.log(totalActiveUsers);
                console.log(typeof totalOutliers);
            } else {
                console.error(JSON.parse(xhttp.statusText));
            }
        }
    }
    xhttp.send();
}


function getUsersCompletedTraining()
{
    var xhttp = new XMLHttpRequest();
    xhttp.open("GET", "/api/usageData/trainingStats", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState === 4) {
            if (xhttp.status === 200) {
                var data = xhttp.responseText;
                console.log(typeof data);
                console.log(data);
                var trainingData = JSON.parse(data);
                var haveDoneTraining = trainingData['completedTraining'];
                var notDoneTraining = trainingData['notCompletedTraining'];
                percentageTrainingCompleted = Math.round((haveDoneTraining / (haveDoneTraining + notDoneTraining)) * 100);
                loadTrainingCompletionChart();
            } else {
                console.error(JSON.parse(xhttp.statusText));
            }
        }
    };
    xhttp.send();
}





var userConfidenceInScans;
var scanIndices = [];
// Get next batch of images from ImageApi
function getCrowdConfidence() {
    var xhttp = new XMLHttpRequest();
    xhttp.open("GET", "/api/usageData/crowdConfidence", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.onreadystatechange = function () {

        if (xhttp.readyState === 4) {
            if (xhttp.status === 200) {
                var data = xhttp.responseText;
                userConfidenceInScans = JSON.parse(data);
                console.log("crowdConfidence");
                console.log(typeof userConfidenceInScans);
                console.log(userConfidenceInScans);
                populateTable();
            } else {
                console.log(JSON.parse(xhttp.statusText));
            }
        }
    };
    xhttp.send();
}

function populateTable()
{
    // Find a <table> element with id="myTable":
    var table = document.getElementById("swipeTable");

    for(i = 0; i < userConfidenceInScans.length; i++)
    {
        scanIndices.push([userConfidenceInScans[i]["scanFilePath"]]);
        // Create an empty <tr> element and add it to the 1st position of the table:
        var row = table.insertRow(table.rows.length);

        // Insert new cells (<td> elements) at the 1st and 2nd position of the "new" <tr> element:
        var scanId = row.insertCell(0);
        var totalSwipes = row.insertCell(1);
        var goodSwipes = row.insertCell(2);
        var badSwipes = row.insertCell(3);

        // Add some text to the new cells:
        scanId.innerHTML = userConfidenceInScans[i]["scanFilePath"];
        totalSwipes.innerHTML = userConfidenceInScans[i]["numOfSwipes"];
        goodSwipes.innerHTML = userConfidenceInScans[i]["numGood"];
        badSwipes.innerHTML = userConfidenceInScans[i]["numBad"];
    }
}


function getIndex(array, value)
{
    for(i=0;i<array.length;i++)
    {
        console.log(array[i] + " vs " + value + ": " + array[i] === value);
        if(array[i] == value)
        {
            return array.indexOf(i);
        }
    }
    return -1;
}
