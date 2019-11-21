function redirectIfDetailsAlreadyGiven() {
    console.log("Checking if already competed form...");
    var xhttp = new XMLHttpRequest();
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    xhttp.open("GET", "/api/usageData/user/equalityDataStatus", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.setRequestHeader(header, token);
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState === 4) {
            if (xhttp.status === 200) {
                var data = xhttp.responseText;
                var equalityData = JSON.parse(data);
                if(equalityData['hasCompletedEqualityForm'] === true)
                {
                    console.log("Yup, it's completed");
                    window.location = "/home";
                } else {
                    console.log("Nah, we need to do the form");
                }
            } else {
                console.error(JSON.parse(xhttp.statusText));
            }
        }
    };
    xhttp.send();
}

function submitEqualityDetailsForm()
{
    var age = document.getElementById("age").value;
    var disability = document.getElementById("disability").value;
    var religion = document.getElementById("religion").value;
    var nationality = document.getElementById("nationality").value;
    var postCode = document.getElementById("postCode").value;
    var gender = document.getElementById("gender").value;


    var xhttp = new XMLHttpRequest();
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    xhttp.open("POST", "/api/equalityData", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.setRequestHeader(header, token);

    xhttp.onreadystatechange = function() {
        if (xhttp.readyState === 4 && xhttp.status === 201) {
            var data = xhttp.responseText;
            console.log(data);
            window.location = "/tutorial/start";
        }  else {
            console.log(xhttp.responseText);
            console.error(xhttp.status);
        }
    };

    var params = 'gender='+gender+'&disability='+disability +
        '&nationality='+nationality+'&postCode='+postCode+'&age='+age+'&religion='+religion;

    xhttp.send(params);

    return false;
}


function isValidFirstHalfOfPostCode(postCode)
{
    return /^[A-Za-z]{2}[0-9]{2}$/.test(postCode);
}

function goToTraining()
{
    submitUserChoosesNotToDiscloseData();
}

function submitUserChoosesNotToDiscloseData()
{
    var xhttp = new XMLHttpRequest();
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    xhttp.open("POST", "/api/equalityData", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.setRequestHeader(header, token);

    xhttp.onreadystatechange = function() {
        if (xhttp.readyState === 4 && xhttp.status === 201) {
            var data = xhttp.responseText;
            console.log(data);
            window.location = "/tutorial/start";
        }  else {
            console.log(xhttp.responseText);
            console.error(xhttp.status);
        }
    };

    var params = 'gender='+3+'&disability=0'+
        '&nationality=null'+'&postCode=null'+'&age='+0+'&religion=null';

    xhttp.send(params);

    return false;
}
