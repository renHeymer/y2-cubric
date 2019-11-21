function submitRegistrationForm()
{
    var username = document.getElementById("username").value;
    var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;
    var passwordConfirm = document.getElementById("passwordConfirm").value;

    if (!formIsValid(username, email, password, passwordConfirm))
    {
        return;
    }
    var xhttp = new XMLHttpRequest();
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    console.log("We're in reg post lads");
    xhttp.open("POST", "/api/registration", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.setRequestHeader(header, token);

    xhttp.onreadystatechange = function() {
        if (xhttp.readyState === 4 && xhttp.status === 201) {
            var data = xhttp.responseText;
            console.log(data);
            window.location = "/equalityData";
        }  else if (xhttp.readyState === 4 && xhttp.status === 409) {
            var error = xhttp.getResponseHeader("error");
            console.log("We've caught an error lads!");
            if (error === 'Username already exists') {
                alert(error);
                return;
            } else if (error === 'Account already registered with that email')
            {
                alert(error);
                return;
            }
        } else {
            console.trace();
            console.log("We didn't prepare for this one lads");
            console.log(xhttp.responseText);
            console.error(xhttp.status);
        }
    };

    var params ='username='+username+'&email='+email+'&password='+
        password+'&passwordConfirm='+ passwordConfirm;
    xhttp.send(params);

    return false;
}

function hasWhiteSpace(s) {
    return /\s/g.test(s);
}

function isValidEmail(s)
{
    return /^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})/.test(s);
}

function isValidPassword(p)
{
    return /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/.test(p);
}

function passwordsMatch(p, pc)
{
    return p === pc;
}


function formIsValid(username, email, password, passwordConfirm)
{

    if(hasWhiteSpace(username)){
        alert("Username cannot contain white space");
        return false;
    }

    if(!isValidEmail(email))
    {
        alert("Please provide a valid email address");
        return false;
    }

    if(!isValidPassword(password))
    {
        alert("Password must be a minimum of 8 characters including at least one letter and one number");
        return false;
    }

    if(!passwordsMatch(password, passwordConfirm))
    {
        alert("Passwords must match");
        return false;
    }

    return true;
}
