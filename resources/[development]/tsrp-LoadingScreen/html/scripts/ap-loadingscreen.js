async function StartLoading() {

    var audio = new Audio('./assets/intro.mp3');
    audio.play();

    // Intro Video
    document.getElementById("introLoader").classList.add("Invisible");
    document.getElementById("introLoader").pause();

    // 3 Seconds Black
    document.getElementById("DevelopmentStudios").classList.add("Invisible");
    await new Promise(r => setTimeout(r, 3000));
    document.getElementById("DevelopmentEngine").classList.add("Invisible");

    // Development Studios
    document.getElementById("DevelopmentStudios").classList.remove("Invisible");
    await new Promise(r => setTimeout(r, 3000));
    document.getElementById("DevelopmentStudios").classList.add("Invisible");

    // Technoscape Logo
    document.getElementById("DevelopmentEngine").classList.remove("Invisible");
    await new Promise(r => setTimeout(r, 6500));
    document.getElementById("DevelopmentEngine").classList.add("Invisible");

    // Built For You
    document.getElementById("CSPartOne").classList.remove("Invisible");
    await new Promise(r => setTimeout(r, 3000));
    document.getElementById("CSPartTwo").classList.remove("Invisible");
    await new Promise(r => setTimeout(r, 3000));
    document.getElementById("CSPartOne").classList.add("Invisible");
    document.getElementById("CSPartTwo").classList.add("Invisible");

    // Terms Text
    document.getElementById("TermsText").classList.remove("Invisible");
    await new Promise(r => setTimeout(r, 8000));
    document.getElementById("TermsText").classList.add("Invisible");

    // Intro Video
    audio.pause();

    document.getElementById("InformationForVideo").classList.remove("Invisible");
    document.getElementById("introLoader").classList.remove("Invisible");
    document.getElementById("introLoader").play();
    document.getElementById("introLoader").volume = 0;
    var audio2 = new Audio('./assets/highwaySong.mp3');
    audio2.volume = 0.5;
    audio2.play();
}

StartLoading();