var userData;
var totalActiveUsers;
var totalOutliers;
var totalUsefulUsers;
var totalCorrectAnswers;
var totalIncorrectAnswers;

var percentageTrainingCompleted;


var enjoyed1;
var enjoyed2;
var enjoyed3;
var enjoyed4;
var enjoyed5;

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

function populateUserTypeTable()
{
    console.log("We're populating user types...")
    ;
    var percentageUseful = Math.round((totalUsefulUsers/totalActiveUsers)*100);
    var percentageOutliers = Math.round((totalOutliers/totalActiveUsers)*100);
    var cellTotalUsers = document.getElementById('totalUsers');
    var cellUsefulUsers = document.getElementById('totalUsefulUsers');
    var cellOutliers = document.getElementById('totalOutliers');

    var totalUsers = document.createTextNode(totalActiveUsers);
    var numOfUsefulUsers = document.createTextNode(percentageUseful + "%");
    var numOfOutliers = document.createTextNode(percentageOutliers+ "%");


    cellTotalUsers.append(totalUsers);
    cellUsefulUsers.append(numOfUsefulUsers);
    cellOutliers.append(numOfOutliers);


}

function setAnswersRatio()
{
    var cellTotalCorrectAnswers = document.getElementById('totalNumberOfCorrectAnswers');
    var cellTotalIncorrectAnswers = document.getElementById('totalNumberOfIncorrectAnswers');

    var TotalCorrectAnswers = document.createTextNode(totalCorrectAnswers+ "%");
    var TotalIncorrectAnswers = document.createTextNode(totalIncorrectAnswers+ "%");

    cellTotalCorrectAnswers.append(TotalCorrectAnswers);
    cellTotalIncorrectAnswers.append(TotalIncorrectAnswers);
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
                populateUserTypeTable();
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

function getAnswerRatios()
{

    var xhttp = new XMLHttpRequest();
    xhttp.open("GET", "/api/usageData/answersRatio", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState === 4) {
            if (xhttp.status === 200) {
                var data = xhttp.responseText;
                // Set the next batch and display next image upon success
                var answerReturn = JSON.parse(data);
                totalCorrectAnswers = answerReturn['percentageOfCorrectAnswers'];
                totalIncorrectAnswers = answerReturn['percentageOfIncorrectAnswers'];
                setAnswersRatio();
                console.log("answer data" + answerReturn);
                console.log("total of correct answers: "+totalCorrectAnswers);
                console.log("total of incorrect answers: " +totalIncorrectAnswers);
                console.log("TYPE of incorrect answers: " + typeof totalIncorrectAnswers);
            } else {
                console.error(JSON.parse(xhttp.statusText));
            }
        }
    }
    xhttp.send();
}


function getFeedback()
{
    var xhttp = new XMLHttpRequest();
    xhttp.open("GET", "/api/feedbackdata/report", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState === 4) {
            if (xhttp.status === 200) {
                var data = xhttp.responseText;
                // Set the next batch and display next image upon success
                var report = JSON.parse(data);
                console.log("REPORT DATA: " + data);
                enjoyed1 = report['Enjoyed (1)'];
                enjoyed2 = report['Enjoyed (2)'];
                enjoyed3 = report['Enjoyed (3)'];
                enjoyed4 = report['Enjoyed (4)'];
                enjoyed5 = report['Enjoyed (5)'];

                populateFeedbackReport();

            } else {
                console.error(JSON.parse(xhttp.statusText));
            }
        }
    };
    xhttp.send();
}

function populateFeedbackReport()
{
    console.log("Enjoyed vars...");
    console.log(enjoyed1);
    console.log(enjoyed2);
    console.log(enjoyed3);
    console.log(enjoyed4);
    console.log(enjoyed5);

    var enjoyedDiv1 = document.getElementById("enjoyed1").style.width=enjoyed1+'%';
    var enjoyedDiv2 = document.getElementById("enjoyed2").style.width=enjoyed2+'%';
    var enjoyedDiv3 = document.getElementById("enjoyed3").style.width=enjoyed3+'%';
    var enjoyedDiv4 = document.getElementById("enjoyed4").style.width=enjoyed4+'%';
    var enjoyedDiv5 = document.getElementById("enjoyed5").style.width=enjoyed5+'%';

    // var enjoyed5percent = document.getElementById("enjoyed5percent").innerHTML=
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
                init_gauge();
            } else {
                console.error(JSON.parse(xhttp.statusText));
            }
        }
    };
    xhttp.send();
}


function init_gauge() {
    // console.log("HAVE COMPLETED TRAINING: " + haveCompletedTraining);
    // console.log(isNaN(haveCompletedTraining));
    // console.log(typeof haveCompletedTraining);

    <!--var textHolder = document.getElementById("usersCompletedTraining");-->
    <!--textHolder.style.fontSize = "xx-large";-->
    <!--var text = document.createTextNode(haveCompletedTraining + "%");-->
    <!--textHolder.appendChild(text);-->

    if (typeof (Gauge) === 'undefined') {
        return;trainingStats.put("completedTraining", rs.getInt("completedTraining"));
        trainingStats.put("notCompletedTraining", rs.getInt("notCompletedTraining"));

        System.out.println(trainingStats.get("completedTraining") + " have completed training");
    }

    console.log('init_gauge [' + $('.gauge-chart').length + ']');

    console.log('init_gauge');


    var chart_gauge_settings = {
        lines: 12,
        angle: 0,
        lineWidth: 0.4,
        pointer: {
            length: 0.75,
            strokeWidth: 0.042,
            color: '#1D212A'
        },
        limitMax: 'false',
        colorStart: '#1ABC9C',
        colorStop: '#1ABC9C',
        strokeColor: '#F0F3F3',
        generateGradient: true
    };


    if ($('#chart_gauge_01').length) {

        var chart_gauge_01_elem = document.getElementById('chart_gauge_01');
        var chart_gauge_01 = new Gauge(chart_gauge_01_elem).setOptions(chart_gauge_settings);

    }


    if ($('#gauge-text').length) {

        chart_gauge_01.maxValue = 100;
        chart_gauge_01.animationSpeed = 50;
        chart_gauge_01.set(percentageTrainingCompleted);
        chart_gauge_01.setTextField(document.getElementById("gauge-text"));

    }


}


window.onload = function (e) {
    getOutliers();
    getAnswerRatios();
    getUsersCompletedTraining();
    getFeedback();
}


