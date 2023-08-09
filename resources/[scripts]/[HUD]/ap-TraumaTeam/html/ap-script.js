function unscrambleText(targetElement, text, animationDuration) {
  const delay = animationDuration / text.length;
  let currentIndex = 0;

  function unscrambleStep() {
    if (currentIndex < text.length) {
      const randomLetters =
        "!@#$%^&*()_-+=[]{}|;:,.<>?/" +
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
      const randomLetter =
        randomLetters[Math.floor(Math.random() * randomLetters.length)];
      const newText =
        text.substring(0, currentIndex) +
        randomLetter +
        text.substring(currentIndex + 1);
      targetElement.textContent = newText;
      currentIndex++;

      setTimeout(unscrambleStep, delay);
    } else {
      targetElement.textContent = text;
    }
  }

  unscrambleStep();
}

const h3Element = document.getElementById("MakeItYours");
unscrambleText(h3Element, "Make It Yours.", 1500);

function ShowColorUI() {
  // show a color picker
  var color = document.getElementById("colorPicker").value;
  document.getElementById("colorPicker").style.display = "block";
  document.getElementById("colorPicker").style.backgroundColor = color;
}

function test() {
  colorValue = document.getElementById("ActionColorValue").value;
  document.getElementById("ActionColorValue").style.color = colorValue;

  // change class ChangeableColorCard style background
  document.getElementById("ChangeableColorCard").style.backgroundColor =
    colorValue;
  // go back to 0 height and then change to 100% height 221px
  document.getElementById("ChangeableColorCard").style.height = "0px";
  // increase height 1px every 10ms
  var height = 0;
  var id = setInterval(frame, 5);
  function frame() {
    if (height == 221) {
      clearInterval(id);
    } else {
      height++;
      document.getElementById("ChangeableColorCard").style.height =
        height + "px";
    }
  }
}
function SelectTier() {
  document.getElementById("BlurBackgroundForProcessing").style.display =
    "block";
  document.getElementById("TierDetails").style.display = "block";
}

function HideHudeOnOutsideClick() {
  document.getElementById("BlurBackgroundForProcessing").style.display = "none";
  document.getElementById("TierDetails").style.display = "none";
  if (document.getElementById("ProcessingDetails").style.display == "block") {
    document.getElementById("BlurBackgroundForProcessing").style.display =
      "block";
  }
}

function SubmitMedicalDetails() {
  document.getElementById("BlurBackgroundForProcessing").style.display =
    "block";
  document.getElementById("ProcessingDetails").style.display = "block";
  var progress = document.getElementById("CreationProgressText");

  // change progress text every 500ms
  var progressText = 0;
  var id = setInterval(frame, 60);
  function frame() {
    if (progressText == 100) {
      clearInterval(id);
      document.getElementById("BlurBackgroundForProcessing").style.display = "none";
      document.getElementById("ProcessingDetails").style.display = "none";
      var MainShow = document.getElementById("TheMainShow");
      MainShow.classList.add("Invisible");
      $.post("https://ap-TraumaTeam/close");
    } else {
      progressText++;
      progress.textContent = progressText + "%";
    }
  }
}

$(document).ready(function () {
  window.addEventListener("message", function (event) {
    switch (event.data.action) {
      case "open":
        var MainShow = document.getElementById("TheMainShow");
        MainShow.classList.remove("Invisible");
        break;
      case "close":
        var MainShow = document.getElementById("TheMainShow");
        MainShow.classList.add("Invisible");
        break;
    }
  });
});

$(document).on("keydown", function () {
  switch (event.keyCode) {
    case 27: // ESC
      var MainShow = document.getElementById("TheMainShow");
      MainShow.classList.add("Invisible");
      $.post("https://ap-TraumaTeam/close");
      break;
  }
});
