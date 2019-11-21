var goodImage = 1; // variable holds the users feedback for each image
var listOfFolderPrefixes; // An array of folder paths for front view, side view and back view of scans
var listOfScanNames; // an array of scan names
var currentScan; // scan file name

window.onload = function () {
    setUp();
}
// Show the next image
function renderImage(imageSrc) {
    console.log("In render image");
    var v1 = document.getElementById("current-image-v1");
    var v2 = document.getElementById("current-image-v2");
    var v3 = document.getElementById("current-image-v3");

    v1.src = "/images/Swipe_R_jpgs/Jpgs_V1/"+ imageSrc;
    v2.src = "/images/Swipe_R_jpgs/Jpgs_V2/"+ imageSrc;
    v3.src = "/images/Swipe_R_jpgs/Jpgs_V3/"+ imageSrc;

    $("#image-holder").fadeIn();

}
// Get next batch of images from ImageApi
    function getNewImageBatch() {
        console.log("In get new batch");
        var xhttp = new XMLHttpRequest();
        xhttp.open("GET", "/api/images/newBatch", true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.onreadystatechange = function () {
          // console.log("Ready state is: " + xhttp.readyState);
          // console.log("Status is: " + xhttp.status);
            if (xhttp.readyState === 4) {
                if (xhttp.status === 200) {
                    var data = xhttp.responseText;
                    // console.log(typeof data);
                    // console.log(data);
                    // Set the next batch and display next image upon success
                    var scanData = JSON.parse(data);
                    listOfFolderPrefixes = scanData["folders"];
                    listOfScanNames = scanData["images"];
                    // console.log(listOfScanNames);
                    // console.log("Number of scans: " + listOfScanNames.length);
                    // console.log(listOfScanNames[0]);
                    if (listOfScanNames[0] === null) {
                        alertOutOfImages();
                    } else {
                        nextImage();
                    }

                } else {
                    // console.log(JSON.parse(xhttp.statusText));
                }
            }
        };
        xhttp.send();
    }

// Keeps track of a users progress through the current batch.
    function nextImage() {
        console.log("In next image");
        // console.log("Images left: " + listOfScanNames.length)
        // If they have swiped through all the images ib the batch,
        // then a new batch is called from ImageApi
        if (listOfScanNames.length <= 1) {
            listOfScanNames = listOfScanNames + getNewImageBatch();
        }
        // Display the next image in the batch
        currentScan = listOfScanNames[0];
        console.log("The next image is: " + currentScan);
        renderImage(currentScan);
    }

// Sets whether or not to send
    function setGoodImage(trueOrFalse) {
        console.log("In set good image");
        goodImage = trueOrFalse;
        submitFeedback();
    }

    function submitFeedback() {
        console.log("In submit feedback");
        // Tells the server if a batch has been completed or not. Then knows not to show the user that batch again
        var params = 'imageUri=' + currentScan + '&answer=' + goodImage;
        var xhttp = new XMLHttpRequest();
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        xhttp.open("POST", "/api/images/answer", true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.setRequestHeader(header, token);
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState === 4 && xhttp.status === 200) {
                // If feedback has been submitted successfully, delete the last image to be swiped from the browsers
                // copy of the batch
                listOfScanNames.shift();
                // Display next image
                nextImage();
            } else {
                console.log(xhttp.status);
                console.log(xhttp.statusText);
            }
        };
        xhttp.send(params);

        return false;
    }

// Called in body tag: onload
    function setUp() {
        redirectIfNotCompletedTraining();
        // Display first batch of images
        getNewImageBatch();
        // Allow a user to click yes or no via left and right arrow keys
        addKeyboardOptions();
        // Allow user to click yes or no via icons on screen
        addIconClickOptions();
    }

// Allow a user to click yes or no via left and right arrow keys
    function addKeyboardOptions() {
        window.onkeyup = function (e) {
            var key = e.code;

            if (key === 'ArrowLeft') {
                setGoodImage(0);
                $("#image-holder").hide("slide", {direction: "left"}, 300);
            } else if (key === 'ArrowRight') {
                setGoodImage(1);
                $("#image-holder").hide("slide", {direction: "right"}, 300);
            }
        }
    }

// Allow user to click yes or no via icons on screen
    function addIconClickOptions() {
        $("#good-brain-icon").click(function () {
            setGoodImage(1);
            $("#image-holder").hide("slide", {direction: "right"}, 300);
        });

        $("#bad-brain-icon").click(function () {
            setGoodImage(0);
            $("#image-holder").hide("slide", {direction: "left"}, 300);
        });
    }

    function alertOutOfImages() {
        var xhttp = new XMLHttpRequest();
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        xhttp.open("POST", "/api/images/finished", true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.setRequestHeader(header, token);
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState === 4 && xhttp.status === 200) {
                var data = xhttp.responseText;
                if (data === "feedbackGiven") {
                    window.location = '/home';
                } else {
                    window.location = '/feedback';
                    window.alert("Thank you for participating!\ You're now out of images to swipe... But we'd love some feedback!");
                }
            } else {
                // console.log(xhttp.responseText);
                // console.error(xhttp.statusText);
            }
        };
        xhttp.send();
    }

    function redirectIfNotCompletedTraining() {
        var xhttp = new XMLHttpRequest();
        xhttp.open("GET", "/api/usageData/user/trainingStatus", true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.onreadystatechange = function () {
          console.log(xhttp.readyState);
            if (xhttp.readyState === 4) {
                if (xhttp.status === 200) {
                    var data = xhttp.responseText;
                    var trainingData = JSON.parse(data);
                    if (trainingData['hasCompletedTraining'] !== true) {
                        document.getElementById("bad-brain-icon").style.display = 'none';
                        document.getElementById("good-brain-icon").style.display = 'none';
                        window.location = "/tutorial/start";
                        alert("You need to complete training before swiping!");
                    }
                } else {
                    console.log(JSON.parse(xhttp.statusText));
                }
            }
        };
        xhttp.send();
}




