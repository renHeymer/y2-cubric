var segmentsComplete = 0;
var topicHeader = document.getElementById("topicHeader");
var subHeader = document.getElementById("subHeader");
// var segOne = document.getElementById("segOne");
// var segTwo = document.getElementById("segTwo");
// var segThree = document.getElementById("segThree");

// Page One
var pageOneTitle = 'Can you help us analyse brain scans and help cure brain diseases?';
var pageOneImage = '/images/brain_scans/siemens_rotating_tracts.jpg';

var introSegOne = "At Cardiff University Brain Research Imaging Centre (CUBRIC) we map " +
    "out the pathways in the brain using state-of-the-art diffusion Magnetic Resonance Imaging (dMRI).";
var introSegTwo = "It's important we map  these pathways correctly." +
    " We need your help to tell us which pathways are wrong!";
var introSegThree = " Anyone can take part and no scientific background is needed. Join us and together we can learn more " +
    " about the brain and help scientists pioneer cures for diseases such as " +
    "dementia and schizophrenia.";


// Page Two

var diffusionMriTitleOne = "What is diffusion MRI?";
var diffusionMriTitleTwo = "Why do we want to look at white matter in the brain?";
var diffusionMriTitleThree = "How does diffusion MRI work?";

var diffusionMriSegOne = "Diffusion MRI is currently the only brain imaging technique that allows us to look at white matter in living people. It produces images like this:";
var diffusionMriSegTwo = "White matter is often referred to as ‘the wiring of the brain’ and is made up of structures called axons.\n" +
    "\n" +
    "Axons are important nerve fibres which carry information about our environment, our vital organs and even our memories. Bundles of axons join together to form pathways called fibre tracts which can transport this information to different parts of the brain.\n" +
    "\n" +
    "In certain brain diseases such as dementia and schizophrenia, some of these white matter pathways are thought" +
    " to become disrupted. Using diffusion MRI, researchers can identify these abnormal pathways and strive to develop better treatments that can target these areas in the brain.";
var diffusionMriSegThreeOne = "Diffusion MRI uses the random motion of water molecules to create a picture of the brain.\n"
var diffusionMriSegThreeTwo = "In the grey matter, water molecules are free to move equally in all directions:\n";
var diffusionMriSegThreeThree  = "However, axons in the white matter are covered in a waterproof coat called the myelin sheath. This means that water can only move in one direction - along the length of the axon\n";
var diffusionMriSegThreeFour =   "Diffusion MRI works by tracing the motion of water molecules along axons. Using this technique, scientists can generate a 3D map of the brain charting the direction of white matter " +
    "fibre tracts. An example is shown below:";

// Page Three
var fornixTitleOne = "We want you to help us model the fornix - but what is " +
    " the fornix and why are we interested in it?";
var fornixTitleTwo = "How do we model the fornix?";
var fornixTitleThree = "What is a good image and what is a bad image of a fornix?";

var fornixSegOne = "The fornix is a white matter bundle in the temporal lobe of the brain. It is shaped a bit like a wishbone in a chicken, with two ‘legs’ going into each hemisphere of the brain. It is a critical structure thought to be involved in memory formation, learning ability and advanced cognitive activities.\n" +
    "\n" +
    "Due to its role in memory systems, the fornix has become a focus of research in dementia. Diffusion MRI scans can reveal disease-related changes in the structure of the fornix before patients get any symptoms. This may help scientists identify individuals at high risk of developing Alzheimer’s.\n";
var fornixSegTwo = "Using information from diffusion MRI we can reconstruct 3D fibre tracts in living brains. We do this using a software called probabilistic tractography.";
var fornixSegTrhree = "Well done - you just unlocked the frontal lobe! The frontal lobe is involved in thinking, decision making and planning. It is also thought to play a key role in determining our personality.";
var fornixTitleFour = "Involuntary contributors to neuroscience:";
var fornixSegFour = "In 1848 Phineas Gage, a railroad worker, was using an iron rod to pack explosives. In an accident that detonated these explosives, the iron rod was driven through Gage’s frontal lobe. Miraculously, he survived the incident, however friends reported that he was ‘no longer Gage.’ He was said " +
    "to have lost all sense of social inhibition, swearing publicly and frequently making inappropriate remarks.";

function setUp()
{
    addKeyboardOptions();
    addIconClickOptions();
    displayTrainingData();
}

function displayTrainingData()
{
    console.log("displayTrainingData() has been called!");
    if(!segmentsComplete > 0)
    {
        displayFirstSegment();
    }
}


function displayFirstSegment()
{
    hideDisplayAllForSegOne();

    console.log("Display first segment has been called!");
    document.getElementById("topicHeader").innerHTML = pageOneTitle;
    document.getElementById("segOne").innerText = introSegOne;
    document.getElementById("segTwo").innerText = introSegTwo;
    document.getElementById("segThree").innerText = introSegThree;

    changeImage("seg_one_img_1", "seg_one_img_txt", "/images/training_images/image002.jpg", "<i>Siemmens rotating tracts in a loop:</i>");
    setSegOneImageDimensions();
}

function displaySecondSegment()
{
    hideDisplayAllForSegTwo();

    console.log("Display second segment has been called!");
    document.getElementById("topicHeader").innerHTML = "Diffusion MRIs";
    document.getElementById("segOne").innerText = diffusionMriSegOne;
    document.getElementById("segOneTitle").innerText = diffusionMriTitleOne;

    changeImage("seg_one_img_1", "training_img_txt","/images/training_images/image013.jpg", "");
    setSegTwoImageDimensions();
}


function displayThirdSegment()
{
    hideDisplayAllForSegThree();

    document.getElementById("segOne").innerText = diffusionMriSegTwo;
    document.getElementById("segOneTitle").innerText = diffusionMriTitleTwo;

    changeImage("seg_one_img_1", "seg_one_img_txt","/images/training_images/image006.png", "");
    // changeDisplay("training_img_1", "none");
    // changeDisplay("training_img_txt", "none");
    setSegThreeImageDimensions();
}

function displayFourthSegment()
{
    setSegFourImageDimensions();
    hideDisplayAllForSegFour();

    document.getElementById("segOne").innerText = diffusionMriSegThreeOne;
    document.getElementById("segTwo").innerText = diffusionMriSegThreeTwo;
    document.getElementById("segThree").innerText = diffusionMriSegThreeThree;
    document.getElementById("segFour").innerText = diffusionMriSegThreeFour;

    document.getElementById("segOneTitle").innerText = diffusionMriTitleThree;

    changeImage("seg_one_img_1", "seg_one_img_txt","/images/training_images/image009.jpg", "");
    changeImage("seg_one_img_2", "seg_one_img_txt","/images/training_images/image010.png", "");
    changeImage("seg_two_img_1", "seg_one_img_txt","/images/training_images/image012.jpg", "");
    changeImage("seg_four_img_1", "seg_one_img_txt","/images/training_images/image013.jpg", "");
    document.getElementById("seg_four_img_1").style.width="134px";
    document.getElementById("seg_four_img_1").style.width="140px";
}

//
function displayFifthSegment()
{
    document.getElementById("topicHeader").innerHTML = "The Fornix";
    document.getElementById("segOne").innerText = fornixSegOne;
    document.getElementById("segOneTitle").innerText = fornixTitleOne;
    document.getElementById("segTwo").innerText = fornixSegTwo;
    document.getElementById("segTwoTitle").innerText = fornixTitleTwo;

    changeImage("seg_one_img_1", "seg_one_img_txt","/images/training_images/image015.jpg", "");
    hideDisplayAllForSegFive();
    setSegFivemageDimensions();
}

function displaySixthSegment()
{
    hideDisplayForAllSegSix();
    document.getElementById("segOne").innerText = fornixSegTrhree;
    changeImage("seg_one_img_1", "seg_one_img_txt","/images/training_images/image017.png", "");
    document.getElementById("segTwo").innerText = fornixSegFour;
    document.getElementById("segTwoTitle").innerText = fornixTitleFour;
    changeImage("seg_one_img_2", "seg_one_img_txt","/images/training_images/image019.jpg", "");
    setSegSixImageDimensions();
}

function displaySeventhSegment()
{
    changeDisplay("segTwo", "none");
    changeDisplay("segOne", "none");
    changeDisplay("seg_one_img_1", "block");
    changeDisplay("seg_one_img_2", "none");
    changeDisplay("seg_two_img_1", "block");
    changeDisplay("seg_three_img_1", "block");

    document.getElementById("topicHeader").innerHTML = "Training - What a Good Fornix Looks Like";

    document.getElementById("segOneTitle").innerHTML = 'From the top';
    document.getElementById("segTwoTitle").innerHTML = 'From the front';
    document.getElementById("segThreeTitle").innerHTML = 'From the side';

    document.getElementById("segOneTitle").style.display = 'block';
    document.getElementById("segTwoTitle").style.display = 'block';
    document.getElementById("segThreeTitle").style.display = 'block';

    changeImage("seg_one_img_1", "seg_one_img_txt","/images/training_images/image021.png", "");
    changeImage("seg_two_img_1", "seg_one_img_txt","/images/training_images/image022.png", "");
    changeImage("seg_three_img_1", "seg_one_img_txt","/images/training_images/image024.png", "");

    setSegSevenImageDimensions();
}

function displayEighthSegment()
{
    document.getElementById("segOneTitle").style.display = 'none';
    document.getElementById("segTwoTitle").style.display = 'none';
    document.getElementById("segThreeTitle").style.display = 'none';

    changeDisplay("segOne", "block");
    changeDisplay("segTwo", "block");
    changeDisplay("segThree", "block");

    document.getElementById("topicHeader").innerHTML = "Training - Not a Perfect Fornix, But OK";

    document.getElementById("segOne").innerHTML = "It shouldn't have too many untidy looking fibres that stick out\n"+
    "across the middle or out of the sides (although a few are OK)";
    document.getElementById("segTwo").innerHTML = "Sometimes the tract images are not symmetrical and have only a few fibres\n"+
    " on one side. Not everyones brains are the same on both sides.";
    document.getElementById("segThree").innerHTML = "It's okay if there is a gap down the middle of the body";

    changeImage("seg_one_img_1", "seg_one_img_txt","/images/training_images/image026.png", "");
    changeImage("seg_two_img_1", "seg_one_img_txt","/images/training_images/image028.png", "");
    changeImage("seg_three_img_1", "seg_one_img_txt","/images/training_images/image030.png", "");
}

function displayNinthSegment()
{
    changeDisplay("segOne", "block");
    changeDisplay("segTwo", "block");
    changeDisplay("segThree", "none");
    document.getElementById("topicHeader").innerHTML = "Training - Bad Ones!";

    document.getElementById("segOne").innerHTML = "If one leg only has 2-3 fibres it is a mistake";
    document.getElementById("segTwo").innerHTML = "There shouldn't be any gaps between the body and the legs.\n"+
    "If the legs look like they have been cut off, it's a mistake.";

    changeImage("seg_one_img_1", "seg_one_img_txt","/images/training_images/image032.png", "");
    changeImage("seg_two_img_1", "seg_one_img_txt","/images/training_images/image034.png", "");
    changeImage("seg_three_img_1", "seg_one_img_txt","/images/training_images/image036.png", "");
}

function goToSegment(){
    switch(segmentsComplete) {
        case 0:
            displayFirstSegment();
            break;
        case 1:
            displaySecondSegment();
            break;
        case 2:
            displayThirdSegment();
            break;
        case 3:
            displayFourthSegment();
            break;
        case 4:
            displayFifthSegment();
            break;
        case 5:
            displaySixthSegment();
            break;
        case 6:
            displaySeventhSegment();
            break;
        case 7:
            displayEighthSegment();
            break;
        case 8:
            displayNinthSegment();
            break;
        default:
            alert("Now time for some practice!");
            window.location = '/practice';
    }
}

function addKeyboardOptions()
{
    window.onkeyup = function(e) {
        var key = e.code;

        if (key ==='ArrowLeft') {
            console.log("We're going back a slide...");
            if(segmentsComplete > 0)
            {
                segmentsComplete = segmentsComplete - 1;
            }
            goToSegment();
        }else if (key === 'ArrowRight') {
            console.log("We're going back a slide...");
            segmentsComplete = segmentsComplete + 1;
            goToSegment();
        }
    }
}
function addIconClickOptions()
{
    $("#tutorialLeft").click(function(){
        if(segmentsComplete > 0)
        {
            segmentsComplete = segmentsComplete - 1;
        }
        goToSegment();
    });

    $("#tutorialRight").click(function(){
        console.log("We're going back a slide...");
        segmentsComplete = segmentsComplete + 1;
        goToSegment();
    });

}

function changeImage(imgId, textId, imagePath, description)
{
    document.getElementById(imgId).style.display = 'block';
    document.getElementById(textId).style.display = 'block';
    document.getElementById(imgId).src = imagePath;
    document.getElementById(textId).innerHTML = description;
}

function changeDisplay(id, displayType)
{
    document.getElementById(id).style.display = displayType;
}

// Functions that alter image dimensions for each segment/slide
function setSegOneImageDimensions()
{
    document.getElementById("seg_one_img_1").style.width = "189px";
    document.getElementById("seg_one_img_1").style.width = "188px";
}

function setSegTwoImageDimensions()
{
    document.getElementById("seg_one_img_1").style.width="134px";
    document.getElementById("seg_one_img_1").style.height="140px";
}

function setSegThreeImageDimensions()
{
    document.getElementById("seg_one_img_1").style.width="148px";
    document.getElementById("seg_one_img_1").style.height="68px";
}

function setSegFourImageDimensions()
{
    changeImage("seg_one_img_1", "seg_one_img_txt","/images/training_images/image009.jpg", "");
    changeImage("seg_one_img_2", "seg_one_img_txt","/images/training_images/image010.png", "");
    changeImage("seg_two_img_1", "seg_one_img_txt","/images/training_images/image012.jpg", "");
    changeImage("seg_four_img_1", "seg_one_img_txt","/images/training_images/image013.jpg", "");

    document.getElementById("seg_one_img_1").style.width="131px";
    document.getElementById("seg_one_img_1").style.height="112px";
    document.getElementById("seg_one_img_2").style.width="150px";
    document.getElementById("seg_one_img_2").style.height="112px";

    document.getElementById("seg_two_img_1").style.width="272px";
    document.getElementById("seg_two_img_1").style.height="70px";
    document.getElementById("seg_four_img_1").style.width="134px";
    document.getElementById("seg_four_img_1").style.height="140px";
}
function setSegFivemageDimensions()
{
    document.getElementById("seg_one_img_1").style.width="219px";
    document.getElementById("seg_one_img_1").style.height="151px";
}
function setSegSevenImageDimensions()
{
    document.getElementById("seg_one_img_1").style.width="302px";
    document.getElementById("seg_one_img_1").style.height="301px";
    document.getElementById("seg_two_img_1").style.width="302px";
    document.getElementById("seg_two_img_1").style.height="301px";
    document.getElementById("seg_three_img_1").style.width="302px";
    document.getElementById("seg_three_img_1").style.height="301px";
}

function setSegSixImageDimensions()
{
    document.getElementById("seg_one_img_1").style.width="269px";
    document.getElementById("seg_one_img_1").style.height="154px";
    document.getElementById("seg_one_img_2").style.width="134px";
    document.getElementById("seg_one_img_2").style.height="134px";
}

// functions that set correct display status of elements for each segment
function hideDisplayAllForSegOne()
{
    changeDisplay("training_img_1", "none");
    changeDisplay("training_img_4", "none");
    changeDisplay("training_img_3", "none");
    changeDisplay("seg_one_img_2", "none");
    changeDisplay("seg_two_img_1", "none");
    changeDisplay("seg_three_img_1", "none");
    changeDisplay("seg_four_img_1", "none");
    changeDisplay("segOneTitle", "none");

    changeDisplay("seg_one_img_1", "block");
    changeDisplay("segOne", "block");
    changeDisplay("segTwo", "block");
    changeDisplay("segThree", "block");


}

function hideDisplayAllForSegTwo()
{
    changeDisplay("training_img_1", "none");
    changeDisplay("training_img_4", "none");
    changeDisplay("training_img_3", "none");
    changeDisplay("seg_one_img_2", "none");
    changeDisplay("seg_one_img_1", "block");
    changeDisplay("seg_one_img_txt", "none");
    changeDisplay("seg_two_img_1", "none");
    changeDisplay("seg_two_img_txt_1", "none");
    changeDisplay("seg_three_img_1", "none");
    changeDisplay("seg_three_img_txt_1", "none");
    changeDisplay("seg_four_img_1", "none");
    changeDisplay("seg_four_img_txt_1", "none");
    changeDisplay("segOneTitle", "block");
    changeDisplay("segOne", "block");
    changeDisplay("segTwoTitle", "none");
    changeDisplay("segTwo", "none");
    changeDisplay("segThreeTitle", "none");
    changeDisplay("segThree", "none");
    changeDisplay("segFourTitle", "none");
    changeDisplay("segFour", "none");
}

function hideDisplayAllForSegThree()
{
    changeDisplay("training_img_1", "none");
    changeDisplay("training_img_4", "none");
    changeDisplay("training_img_3", "none");
    changeDisplay("seg_one_img_1", "block");
    changeDisplay("seg_one_img_2", "none");
    changeDisplay("seg_one_img_txt", "none");
    changeDisplay("seg_two_img_1", "none");
    changeDisplay("seg_two_img_txt_1", "none");
    changeDisplay("seg_three_img_1", "none");
    changeDisplay("seg_three_img_txt_1", "none");
    changeDisplay("seg_four_img_1", "none");
    changeDisplay("seg_four_img_txt_1", "none");
    changeDisplay("segOneTitle", "block");
    changeDisplay("segOne", "block");
    changeDisplay("segTwoTitle", "none");
    changeDisplay("segTwo", "none");
    changeDisplay("segThreeTitle", "none");
    changeDisplay("segThree", "none");
    changeDisplay("segFourTitle", "none");
    changeDisplay("segFour", "none");
}

function hideDisplayAllForSegFour()
{
    changeDisplay("training_img_1", "none");
    changeDisplay("training_img_4", "none");
    changeDisplay("training_img_3", "none");
    changeDisplay("seg_one_img_2", "block");
    changeDisplay("seg_one_img_1", "block");
    changeDisplay("seg_two_img_1", "block");
    changeDisplay("seg_three_img_1", "none");
    changeDisplay("seg_four_img_1", "block");
    changeDisplay("segOneTitle", "block");
    changeDisplay("segOne", "block");
    changeDisplay("segTwoTitle", "none");
    changeDisplay("segTwo", "block");
    changeDisplay("segThreeTitle", "none");
    changeDisplay("segThree", "block");
    changeDisplay("segFourTitle", "none");
    changeDisplay("segFour", "block");

}

function hideDisplayAllForSegFive()
{
    changeDisplay("training_img_1", "none");
    changeDisplay("training_img_4", "none");
    changeDisplay("training_img_3", "none");
    changeDisplay("seg_one_img_2", "none");
    changeDisplay("seg_one_img_1", "block");
    changeDisplay("seg_two_img_1", "none");
    changeDisplay("seg_three_img_1", "none");
    changeDisplay("seg_four_img_1", "none");
    changeDisplay("segOneTitle", "block");
    changeDisplay("segOne", "block");
    changeDisplay("segTwoTitle", "block");
    changeDisplay("segTwo", "block");
    changeDisplay("segThreeTitle", "none");
    changeDisplay("segThree", "none");
    changeDisplay("segFourTitle", "none");
    changeDisplay("segFour", "none");

}

function hideDisplayForAllSegSix()
{
    changeDisplay("training_img_1", "none");
    changeDisplay("training_img_4", "none");
    changeDisplay("training_img_3", "none");
    changeDisplay("seg_one_img_2", "block");
    changeDisplay("seg_one_img_1", "block");
    changeDisplay("seg_two_img_1", "none");
    changeDisplay("seg_three_img_1", "none");
    changeDisplay("seg_four_img_1", "none");
    changeDisplay("segOneTitle", "none");
    changeDisplay("segOne", "block");
    changeDisplay("segTwoTitle", "block");
    changeDisplay("segTwo", "block");
    changeDisplay("segThreeTitle", "none");
    changeDisplay("segThree", "none");
    changeDisplay("segFourTitle", "none");
    changeDisplay("segFour", "none");

}