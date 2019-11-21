
function setSlideEvents()
{
    var enjoyedSlider = document.getElementById("enjoyed");
    var enjoyedValue = document.getElementById("enjoyedSliderValue");
    enjoyedValue.innerHTML = enjoyedSlider.value; // Display the default slider value

// Update the current slider value (each time you drag the slider handle)
    enjoyedSlider.oninput = function() {
        enjoyedValue.innerHTML = this.value;
    }

    var taskLevelSlider = document.getElementById("task_right_level");
    var taskLevelValue = document.getElementById("taskLevelSliderValue");
    taskLevelValue.innerHTML = taskLevelSlider.value; // Display the default slider value

// Update the current slider value (each time you drag the slider handle)
    taskLevelSlider.oninput = function() {
        console.log("Slide event 2!")
        taskLevelValue.innerHTML = this.value;
    }


    var recommendSlider = document.getElementById("recommend");
    var recommendLevelValue = document.getElementById("recommendSliderValue");
    recommendLevelValue.innerHTML = taskLevelSlider.value; // Display the default slider value

// Update the current slider value (each time you drag the slider handle)
    recommendSlider.oninput = function() {
        recommendLevelValue.innerHTML = this.value;
    }
}