let resourceName = "CodeM-CyberHud";
let notifications = []
let hideRadarOnFoot = true
let inVeh = false




function GenerateNotification(message, type, timeout) {
    let id = notifications.length + 1;
    let colors = {
        ["succes"]: "#2abdc7",
        ["error"]: "#d4423d",
        ["info"]: "#FBD33F",
    }
    if (type == null) {
        type = "succes";
    }
    if (timeout == null) {
        timeout = 5000;
    }
    if (message == null) {
        message = "UNKOWN";
    }
    let html = `
        <div style="transform: translateX(-165px)" class="notify" id="notify-${id}">
        <h1 class="notify-title" style="color:${colors[type]}">${type.toUpperCase()}</h1>
        <P class="notify-text" style="color:${colors[type]}">${message}</P>
        <div class="top-line"></div>
        <div class="notify-dots-${type}"></div>
      </div>
    `
    $('.notify-container').append(html)
    anime({
        targets: `#notify-${id}`,
        translateX: "0",
        duration: 550,
        easing: "spring(1, 70, 100, 10)",
    });
    notifications[id] = setTimeout(() => {
        anime({
            targets: `#notify-${id}`,
            translateX: "-165px",
            duration: 550,
            easing: "spring(1, 70, 100, 10)",
        });
        setTimeout(() => {
            $("#notify-" + id).remove();
            notifications[id] = null;
        }, 150);
    }, timeout)
}

var bar = new ProgressBar.Path('#path', {
    easing: 'easeInOut',
    duration: 0,
});
function SetFuel(val) {


    bar.set(1);
    bar.animate(val / 100 + .0);
}


window.addEventListener("message", function (event) {
    var item = event.data;
    switch (item.type) {
        case "clock_update":
            $('.clock').text(item.hours + ":" + item.minutes);
            break;
        case "location_update":
            if (item.location_name.length > 14) {
                $('.location-text').css("font-size", "1rem")
                $('.location-text').text(item.location_name);
            } else {
                $('.location-text').css("font-size", "1.4rem")
                $('.location-text').text(item.location_name);
            }
            break;
        case "set_stamina":
            if (item.oxygen <= 0) {
                $('.stamina-text-onwalk').text("0%")
            } else {
                $('.stamina-text-onwalk').text(item.oxygen.toFixed(0) + "%")
            }

            break
        case "playerid_update":
            $('.player-id').text("ID : " + item.playerid);
            $('.player-id-onwalk').text("ID : " + item.playerid);

            break
        case "set_resourcename":
            resourceName = item.resourcename;
            break
        case "NuiReady":
            $.post(`https://${resourceName}/Ready`);

            break
        case "armour_update":
            $('.armor-text').text(item.armour + "%")
            $('.armor-text-onwalk').text(item.armour + "%")

            break
        case "hunger_update":
            $('.hunger-text').text(Number(item.hunger).toFixed(0) + "%")
            $('.hunger-text-onwalk').text(Number(item.hunger).toFixed(0) + "%")


            break
        case "thirsty_update":
            $('.water-text').text(Number(item.thirsty).toFixed(0) + "%")
            $('.water-text-onwalk').text(Number(item.thirsty).toFixed(0) + "%")

            break
        case "health_update":
            let health = item.health - 100
            if (health <= 0) {
                health = 0
            }
            $('.health-text').text(health + "%")
            $('.health-text-onwalk').text(health + "%")

            break
        case "update_job":
            let job = item.job.toUpperCase()
            if (job.length > 10) {
                $('.job').css("font-size", "0.8rem")

            } else {
                $('.job').css("font-size", "1.1rem")

            }
            $('.job').text(job);
            break
        case "update_money":
            $('.cash').html(item.money + ` <span class="dollar-icon">$</span>`);
            break
        case "speed_update":
            let rpm = (item.rpm * 1.5) * 10
            rpm = rpm.toFixed(0)
            $('.speed').text(item.speed)
            for (let i = 1; i < 15; i++) {
                $(`.speedometer-inner-${i}`).css("width", "0")
            }
            for (let i = 1; i < rpm; i++) {
                $(`.speedometer-inner-${i}`).css("width", "100%")

            }
            break
        case "shake":
            $('.glitch-anim-2').css("display", "block")
            $('.hudMap').addClass("shake-anim")
            $('.player-info').addClass("shake-anim")
            $('.glitch-anim-4').addClass("glitch-2")
            $('.glitch-anim-2').addClass("glitch-2")
            $('.speedometer').addClass("shake-anim")
            if (!inVeh && hideRadarOnFoot) {
                $('.glitch-anim-3').css("display", "block")
                $('.glitch-anim-3').addClass("glitch-2")
                $('.hudmap-onwalk').addClass("shake-anim")

            }
            setTimeout(() => {
                $('.glitch-anim-2').css("display", "none")
                $('.glitch-anim-3').css("display", "none")
                $('.hudmap-onwalk').removeClass("shake-anim")

                $('.hudMap').removeClass("shake-anim")
                $('.player-info').removeClass("shake-anim")
                $('.glitch-anim-4').removeClass("glitch-2")
                $('.speedometer').removeClass("shake-anim")
                $('.glitch-anim-2').removeClass("glitch-2")
                $('.glitch-anim-3').removeClass("glitch-2")

            }, 1550)
            break
        case "update_seatbelt":
            if (item.toggle) {
                $('.seatbelt').css("backgroundImage", "url(./images/Seatbelt-On.png)")
            } else {
                $('.seatbelt').css("backgroundImage", "url(./images/Seatbelt-Off.png)")
            }
            break
        case "show_vehhud":
            $('.speedometer').fadeIn(100)


            inVeh = true
            $('.speedometer').css("display", "block")
            if (item.hideRadar) {
                $('.hudMap').fadeIn(500)
                $('.hudmap-onwalk').fadeOut(150)
            } else {
                $('.hudMap').fadeIn(0)
                $('.hudmap-onwalk').fadeOut(0)
            }
            break
        case "talking_radius":
            if (item.radius == 1) {
                $('.hudmap-onwalk-mic-radius').css("backgroundImage", "url(./images/Mic-Low-onwalk.png)")
                $('.mic-radius-mid').css("display", "none")
                $('.mic-radius-high').css("display", "none")
                $('.mic-radius-low').css("display", "block")

            }
            if (item.radius == 2) {
                $('.hudmap-onwalk-mic-radius').css("backgroundImage", "url(./images/Mic-Mid-onwalk.png)")
                $('.mic-radius-mid').css("display", "block")
                $('.mic-radius-high').css("display", "none")
                $('.mic-radius-low').css("display", "none")
            }
            if (item.radius == 3) {
                $('.hudmap-onwalk-mic-radius').css("backgroundImage", "url(./images/Mic-High-onwalk.png)")
                $('.mic-radius-mid').css("display", "none")
                $('.mic-radius-high').css("display", "block")
                $('.mic-radius-low').css("display", "none")
            }
            break
        case "update_weapon_ammo":
            let ammo = $('.ammo')
            let maxammo = $('.max-ammo')
            if (ammo.length > 0 && maxammo.length > 0) {
                ammo.html(item.ammo)
                maxammo.html(item.maxammo)
            }
            break
        case "hide_vehhud":
            inVeh = false
            if (item.hideRadar) {
                $('.hudmap-onwalk').fadeIn(500)
                $('.hudMap').fadeOut(150)
            } else {
                $('.hudmap-onwalk').fadeOut(0)
                $('.hudMap').fadeIn(0)
            }


            $('.speedometer').fadeOut(100)

            break
        case "hideradaronfoot":
            hideRadarOnFoot = item.toggle
            break
        case "displayhud":
            $('body').css("display", `${item.toggle ? "block" : "none"}`)
            break
        case "toggle_engine":
            if (item.toggle) {
                $('.engine').css("backgroundImage", "url(./images/Engine-On.png)")

            } else {

                $('.engine').css("backgroundImage", "url(./images/Engine-Off.png)")
            }

            break
        case "toggle_cruise":
            if (item.toggle) {
                $('.cruise').css("backgroundImage", "url(./images/Speedlimiter-On.png)")
            } else {

                $('.cruise').css("backgroundImage", "url(./images/Speedlimiter-Off.png)")
            }

            break
        case "update_ligths":
            if (item.state == "off") {
                $('.lights').css("backgroundImage", "url(./images/Headlights-Off.png)")
                $('.shortlights').css("backgroundImage", "url(./images/Lights-Off.png)")
            }
            if (item.state == "normal") {
                $('.lights').css("backgroundImage", "url(./images/Headlights-Off.png)")
                $('.shortlights').css("backgroundImage", "url(./images/Lights-On.png)")
            }
            if (item.state == "high") {
                $('.lights').css("backgroundImage", "url(./images/Headlights-On.png)")
                $('.shortlights').css("backgroundImage", "url(./images/Lights-On.png)")
            }
            break
        case "talking":
            if (item.talking) {
                $('.mic-radius-mid').css("backgroundImage", "url(./images/Mic-Radius-Mid-Open.png)")
                $('.mic-radius-high').css("backgroundImage", "url(./images/Mic-Radius-High-Open.png)")
                $('.mic-radius-low').css("backgroundImage", "url(./images/Mic-Radius-Low-Open.png)")
                $('.hudmap-onwalk-mic').css("backgroundImage", "url(./images/Mic-On.png)")
                $('.microphone').css("backgroundImage", "url(./images/Mic-On.png)")
            } else {
                $('.mic-radius-mid').css("backgroundImage", "url(./images/Mic-Radius-Mid.png)")
                $('.mic-radius-high').css("backgroundImage", "url(./images/Mic-Radius-High.png)")
                $('.mic-radius-low').css("backgroundImage", "url(./images/Mic-Radius-Low.png)")
                $('.hudmap-onwalk-mic').css("backgroundImage", "url(./images/Mic-Off.png)")

                $('.microphone').css("backgroundImage", "url(./images/Mic-Off.png)")
            }
            break
        case "fuel_update":
            SetFuel(item.fuel)
            break
        case "unbuckle":
            unbuckle.volume = event.data.volume;
            unbuckle.play();
            break;
        case "buckle":
            buckle.volume = event.data.volume;
            buckle.play();
            break;
        case "update_ammo":
            $('.ammo-cont').html(item.html)
            break
        case "send_notification":
            GenerateNotification(item.message, item.notifytype, item.time)
            break
        default:
            break;
    }
});