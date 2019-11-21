var usersAnswer = 1; // variable holds the users feedback for each image
var isGoodScan;
var numberOfCorrectSwipes = 0;
var numberOfIncorrectSwipes = 0;
var numberOfDiscrepancies = 0;
var numberOfDiscrepanciesCaught = 0;
// An array of folder paths for front view, side view and back view of scans
var listOfScans; // an array of scan names
var currentScan; // scan file name




// Show the next image
function renderImage(scan)
{
    var v1 = document.getElementById("current-image-v1");
    var v2 = document.getElementById("current-image-v2");
    var v3 = document.getElementById("current-image-v3");

    v1.src = scan['folders'][0] + scan['scan_id'];
    v2.src = scan['folders'][1] + scan['scan_id'];
    v3.src = scan['folders'][2] + scan['scan_id'];

    $("#image-holder").fadeIn();

}

// Get next batch of images from ImageApi
function getNewImageBatch()
{
    numberOfCorrectSwipes = 0;
    numberOfIncorrectSwipes = 0;
    numberOfDiscrepancies = 0;
    numberOfDiscrepanciesCaught = 0;
    var xhttp = new XMLHttpRequest();
    xhttp.open("GET", "/api/images/newBatch/training", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState === 4) {
            if (xhttp.status === 200) {
                var data = xhttp.responseText;
                console.log(typeof data);
                console.log(data);
                // Set the next batch and display next image upon success
                listOfScans = JSON.parse(data);
                console.log(listOfScans);

                if(listOfScans[0] === null)
                {
                    alertFinishedTraining();
                } else {
                    nextImage();
                }

            } else {
                console.error(JSON.parse(xhttp.statusText));
            }
        }
    };
    xhttp.send();
}

// Keeps track of a users progress through the current batch.
function nextImage(){
    // If they have swiped through all the images ib the batch,
    // then a new batch is called from ImageApi
    if(listOfScans.length === 10){
        document.getElementById("bad-brain-icon").style.display = 'none';
        document.getElementById("good-brain-icon").style.display = 'none';
        document.getElementById("tryAnotherBatch").style.display = 'block';
        document.getElementById("startForReal").style.display = 'block';
        showScore();
    }

    if(listOfScans.length <= 1){

        alertFinishedTraining();
    }
    // Display the next image in the batch
    currentScan = listOfScans[0];
    renderImage(currentScan);
}

function tryAnotherBatch()
{
    numberOfCorrectSwipes = 0;
    numberOfIncorrectSwipes = 0;
    numberOfDiscrepancies = 0;
    numberOfDiscrepanciesCaught = 0;

    document.getElementById("tryAnotherBatch").style.display = 'none';
    document.getElementById("startForReal").style.display = 'none';
    document.getElementById("message").style.display = 'none';
    document.getElementById("bad-brain-icon").style.display = 'block';
    document.getElementById("good-brain-icon").style.display = 'block';
    if(listOfScans.length <= 1){
        getNewImageBatch();
    } else {
        currentScan = listOfScans[0];
        renderImage(currentScan);
    }
}

// Sets whether or not to send
function setGoodImage(trueOrFalse)
{
    usersAnswer = trueOrFalse;
    updateScore();
    submitFeedback();
}

function submitFeedback() {
    // Tells the server if a batch has been completed or not. Then knows not to show the user that batch again

    var params = 'imageUri='+currentScan['scan_id']+'&answer='+usersAnswer;
    var xhttp = new XMLHttpRequest();
    xhttp.open("POST", "/api/images/trainingAnswer", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState === 4 && xhttp.status === 200) {
            // If feedback has been submitted successfully, delete the last image to be swiped from the browsers
            // copy of the batch
            listOfScans.shift();
            // Display next image
            nextImage();
        } else {
            console.error(xhttp.status);
            console.error(xhttp.readyState);
        }
    };
    xhttp.send(params);

    return false;
}

// Called in body tag: onload
function setUp()
{
    // Display first batch of images
    getNewImageBatch();
    // Allow a user to click yes or no via left and right arrow keys
    addKeyboardOptions();
    // Allow user to click yes or no via icons on screen
    addIconClickOptions();
}

// Allow a user to click yes or no via left and right arrow keys
function addKeyboardOptions()
{
    window.onkeyup = function(e) {
        var key = e.code;

        if (key ==='ArrowLeft') {
            setGoodImage(0);
            $("#current-image").hide("slide", { direction: "left" }, 300);
        }else if (key === 'ArrowRight') {
            setGoodImage(1);
            $("#current-image").hide("slide", { direction: "right" }, 300);
        }
    }
}

// Allow user to click yes or no via icons on screen
function addIconClickOptions()
{
    $("#good-brain-icon").click(function(){
        setGoodImage(1);
        $("#current-image").hide("slide", { direction: "right" }, 300);
    });

    $("#bad-brain-icon").click(function(){
        setGoodImage(0);
        $("#current-image").hide("slide", { direction: "left" }, 300);
    });
}

function alertFinishedTraining()
{
    var xhttp = new XMLHttpRequest();
    xhttp.open("POST", "/api/user/trainingCompleted", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp. onreadystatechange = function() {
        if (xhttp.readyState === 4 && xhttp.status === 200) {
            var totalSwipes = numberOfCorrectSwipes + numberOfIncorrectSwipes;
            alert("Let's get stuck in for real...");
            window.location = "/swipe";
        } else {
            console.log(xhttp.responseText);
            console.error(xhttp.statusText);
        }
    };
    xhttp.send();
}

function updateScore()
{
    if(usersAnswer === currentScan['isGoodScan'])
    {
        numberOfCorrectSwipes = numberOfCorrectSwipes + 1;
    } else {
        numberOfIncorrectSwipes = numberOfIncorrectSwipes + 1;
    }

    if(currentScan['isGoodScan'] === 0)
    {
        numberOfDiscrepancies = numberOfDiscrepancies + 1;
        if(usersAnswer === 0)
        {
            numberOfDiscrepanciesCaught = numberOfDiscrepanciesCaught + 1;
        }
    }
}

function showScore()
{
    var totalSwipes = numberOfCorrectSwipes + numberOfIncorrectSwipes;
    alert("You have gotten " + numberOfCorrectSwipes + " out of " + totalSwipes + " swipes correct!\n" +
        "And have recognised " + numberOfDiscrepanciesCaught + " out of " + numberOfDiscrepancies + " bad brains!");
}

function askUserToRetakePractice()
{
    var percentageOfCorrectAnswers = numberOfCorrectSwipes / (numberOfCorrectSwipes + numberOfIncorrectSwipes) * 100;
    console.log(percentageOfCorrectAnswers + "% of answers correct");
    if(percentageOfCorrectAnswers < 70)
    {
        document.getElementById("tryAnotherBatch").style.display = 'block';
        document.getElementById("startForReal").style.display = 'block';
        document.getElementById("message").style.display = 'block';
        document.getElementById("bad-brain-icon").style.display = 'none';
        document.getElementById("good-brain-icon").style.display = 'none';
        document.getElementById("current-image-v1").style.display = 'none';
        document.getElementById("current-image-v2").style.display = 'none';
        document.getElementById("current-image-v3").style.display = 'none';
    } else {
        alertFinishedTraining();
    }
}

window.onload = function()
{
    setUp();
}
