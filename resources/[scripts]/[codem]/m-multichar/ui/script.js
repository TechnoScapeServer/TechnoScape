var HSN = []
HSN.CharSlots = {
    [1]: undefined,
    [2]: undefined,
    [3]: undefined,
    [4]: undefined,
    [5]: undefined,
}
var TebexBought = []
HSN.SelectedGender = ""
HSN.SelectedCid = 0
HSN.SelectedDiv = 0
HSN.PlayerCharData = []
tebexopened = false
delcharopened = false
HSN.PlyName = ""
HSN.dataloaded = false
HSN.Slots = []

window.addEventListener('message', function (event) {
    if (event.data.message == "SetChars") {
        HSN.PlayerCharData = event.data.charData
        $("#charside").css("pointer-events", "none")
        HSN.SetSlots(event.data.Slots);
        $(".loading-container").fadeIn(1000)
        setTimeout(function () {
            HSN.SetupCharacters()
        }, 1000);

        $("body").fadeIn(300)
    } else if (event.data.message == "CloseNUI") {
        HSN.CloseNui()
    } else if (event.data.message == "SetSteamInfos") {
        HSN.PlyName = event.data.name
        HSN.SetStamInfos(event.data)
    } else if (event.data.message == "UnlockTebexSlot") {
        TebexBought[event.data.cid] = true
        $(".app-container-main-character-side").find("[char-id-m=tebex" + event.data.cid + "]").html('<div class="character-side-index-desc createcharacter" char-id=' + event.data.cid + '><div class="character-createnewcharacter"><i class="fas fa-plus-circle"></i><h>CREATE NEW CHARACTER</h></div></div><div class="selected">SELECTED</div>')
        //$(".app-container-main-character-side").append('')
        //$(".app-container-main-character-side").find("[char-id-m=tebex]").html('<div class="character-side-index-desc" char-id='+charV.cid+'><div class="character-infos"><p class="character-side-charname">'+charV.charinfo.firstname+' '+charV.charinfo.lastname+'</p><p class="character-side-job">'+charV.job.label+' - '+charV.job.grade.name+'</p></div></div><div class="selected">SELECTED</div>')
    }
    HSN.SetLanguage()
});


HSN.SetSlots = function (Slots) {
    $("#charside").html('<div class="character-side-index-title"><div class="border"></div><p id="header">Hello Leonardo,<br />Please select a character</p></div>')
    $.each(Slots, function (i, slot) {
        HSN.Slots[slot.id] = slot
        if (slot.tebex) {
            $("#charside").append('<div class="character-side-index" char-id-m=tebex' + slot.id + '><div class="character-side-index-desc" char-id=tebex><div class="character-createnewcharacter" char-id=tebex><i class="fas fa-plus-circle"></i><h></h></div></div><div class="selected">SELECTED</div></div>')
        } else {
            $("#charside").append('<div class="character-side-index" char-id-m=' + slot.id + '><div class="character-side-index-desc createcharacter" char-id=' + slot.id + '><div class="character-createnewcharacter"><i class="fas fa-plus-circle"></i><h></h></div></div><div class="selected">SELECTED</div></div>')
        }
    })
    $("#charside").css("pointer-events", "auto")
}

HSN.checkdata = function () {
    if (HSN.dataloaded == false) {
        $.post('https://m-multichar/loadagain')
        HSN.dataloaded = true
    }
}


window.addEventListener("load", (event) => {
    HSN.checkdata();
});

HSN.ErrorMessage = function () {
    $(".create-error").fadeIn(300)
    setTimeout($(".create-error").fadeOut(300), 2500)
    return
}

HSN.SetStamInfos = function (infos) {
    $(".app-top-userinfo-texts-playername").html(infos.name)
    $(".app-top-userinfo-texts-playerId").html("ID - " + infos.id)
    $(".app-container-main-charname").html(infos.name)
    $(".character-side-index-title").find("[id='header']").html("Hello " + infos.name + ",<br />Please select a character")
    $(".create-character-text").html("Hello " + infos.name + ", <br>Please create a character")
    $(".app-top-userinfo-localImage").css("background", "url(" + infos.profilephoto + ")")
    $(".app-top-userinfo-localImage").css("background-size", "cover")
}

HSN.CloseNui = function () {
    $("body").fadeOut(100)
    $(".app-container-createcharacter").fadeOut(200)
    HSN.SelectedCid = 0
    HSN.SelectedDiv = 0
    $(".bottom-text").fadeOut(300)
    $(".play-button-main").fadeOut(300)
    $(".app-container-main-ellipse").fadeOut(300)
    $(".app-container-main-buttons").fadeOut(300)
    $(".app-container-main-character-side").find(".selected").fadeOut(50)
    $(".app-container-main-charname").html(HSN.PlyName)
    $(".app-container-main-character-statics").css({ 'display': 'block' }).animate({
        right: "-40vh",
    }, 300, function () {

    });
    setTimeout(function () {
        $(".app-container-main").fadeIn(300)
    }, 300);
}

HSN.SetupBackgrounds = function (charData) {
    if (charData.job.name == "police") {
        $(".character-side-index").find("[char-id=" + charData.cid + "]").css("background", "url(images/lspd.png)")
    } else if (charData.job.name == "traumateam") {
        $(".character-side-index").find("[char-id=" + charData.cid + "]").css("background", "url(images/ems.png)")
    } else {
        $(".character-side-index").find("[char-id=" + charData.cid + "]").css("background", "url(images/citizen.png)")
    }
}

HSN.UpdateBackgrounds = function (charData, isClicked) {
    if (isClicked) {
        if (charData.job.name == "police") {
            $(".character-side-index").find("[char-id=" + charData.cid + "]").css("background", "url(images/lspd-clicked.png)")
        } else if (charData.job.name == "traumateam") {
            $(".character-side-index").find("[char-id=" + charData.cid + "]").css("background", "url(images/ems-clicked.png)")
        } else {
            $(".character-side-index").find("[char-id=" + charData.cid + "]").css("background", "url(images/citizen-clicked.png)")
        }
        //$(".character-side-index").find("[char-id="+charData.cid+"]").css("border-left", "none")
    } else {
        if (charData.job.name == "police") {
            $(".character-side-index").find("[char-id=" + charData.cid + "]").css("background", "url(images/lspd.png)")
        } else if (charData.job.name == "traumateam") {
            $(".character-side-index").find("[char-id=" + charData.cid + "]").css("background", "url(images/ems.png)")
        } else {
            $(".character-side-index").find("[char-id=" + charData.cid + "]").css("background", "url(images/citizen.png)")
        }
        //$(".character-side-index").find("[char-id="+charData.cid+"]").css({"border-left":"0.5vw solid rgb(182, 182, 182)"})
    }

}



HSN.SetupCharacters = function () {
    $.each(HSN.PlayerCharData, function (i, charV) {
        if (HSN.Slots[charV.cid].tebex) {
            HSN.CharSlots[charV.cid] = charV
            TebexBought[charV.cid] = true
            $(".app-container-main-character-side").find("[char-id-m=tebex" + charV.cid + "]").html("")
            $(".app-container-main-character-side").find("[char-id-m=tebex" + charV.cid + "]").html('<div class="character-side-index-desc" char-id=' + charV.cid + '><div class="character-infos"><p class="character-side-charname">' + charV.charinfo.firstname + ' ' + charV.charinfo.lastname + '</p><p class="character-side-job">' + charV.job.label + ' - ' + charV.job.grade.name + '</p></div></div><div class="selected">' + Config.Text["selected"] + '</div>')
            $(".app-container-main-character-side").find("[char-id-m=tebex" + charV.cid + "]").data("charData", charV)
            HSN.SetupBackgrounds(charV)
        } else {
            HSN.CharSlots[charV.cid] = charV
            $(".app-container-main-character-side").find("[char-id-m=" + charV.cid + "]").html("")
            $(".app-container-main-character-side").find("[char-id-m=" + charV.cid + "]").html('<div class="character-side-index-desc" char-id=' + charV.cid + '><div class="character-infos"><p class="character-side-charname">' + charV.charinfo.firstname + ' ' + charV.charinfo.lastname + '</p><p class="character-side-job">' + charV.job.label + ' - ' + charV.job.grade.name + '</p></div></div><div class="selected">' + Config.Text["selected"] + '</div>')
            $(".app-container-main-character-side").find("[char-id-m=" + charV.cid + "]").data("charData", charV)
            HSN.SetupBackgrounds(charV)
        }
    })
    $(".loading-container").fadeOut(300)
}



HSN.SetCharacterStatics = function (charData) {
    agestring = HSN.CalculateAge(charData.charinfo.birthdate)
    $(".character-statics-index").find("[id=age]").find(".statics-index").html(agestring)
    $(".character-statics-index").find("[id=cash]").find(".statics-index").html("$" + charData.money.cash)
    $(".character-statics-index").find("[id=bank]").find(".statics-index").html("$" + charData.money.bank)
    $(".character-statics-index").find("[id=number]").find(".statics-index").html(charData.charinfo.phone)
    $(".character-statics-index").find("[id=nationality]").find(".statics-index").html(charData.charinfo.nationality)
    $("#playtime").html(charData.totalPlayedTime)
}


HSN.DeleteCharacter = function (toggle) {
    if (toggle) {
        if (HSN.Slots[HSN.SelectedCid].tebex) {
            $.post('https://m-multichar/DeleteCharacter', JSON.stringify({ citizenid: HSN.CharSlots[HSN.SelectedCid].citizenid }));
            $(".app-container-main-character-side").find("[char-id-m=tebex" + HSN.SelectedCid + "]").html("")
            $(".app-container-main-character-side").find("[char-id-m=tebex" + HSN.SelectedCid + "]").html('<div class="character-side-index-desc createcharacter" char-id=' + HSN.SelectedCid + '><div class="character-createnewcharacter"><i class="fas fa-plus-circle"></i><h>' + Config.Text["create-new-character"] + '</h></div></div><div class="selected">' + Config.Text["selected"] + '</div>')
            $("#deletechar").fadeOut(300)
            HSN.CharSlots[HSN.SelectedCid] = undefined
            delcharopened = false
            $(".bottom-text").fadeOut(300)
            $(".play-button-main").fadeOut(300)
            $(".app-container-main-ellipse").fadeOut(300)
            $(".app-container-main-buttons").fadeOut(300)
            $(".app-container-main-character-statics").css({ 'display': 'block' }).animate({
                right: "-40vh",
            }, 300, function () {

            });
        } else {
            $.post('https://m-multichar/DeleteCharacter', JSON.stringify({ citizenid: HSN.CharSlots[HSN.SelectedCid].citizenid }));
            $(".app-container-main-character-side").find("[char-id-m=" + HSN.SelectedCid + "]").html("")
            $(".app-container-main-character-side").find("[char-id-m=" + HSN.SelectedCid + "]").html(' <div class="character-side-index-desc createcharacter" char-id=' + HSN.SelectedCid + '><div class="character-createnewcharacter"><i class="fas fa-plus-circle"></i><h>' + Config.Text["create-new-character"] + '</h></div></div><div class="selected">' + Config.Text["selected"] + '</div>')
            $("#deletechar").fadeOut(300)
            HSN.CharSlots[HSN.SelectedCid] = undefined
            delcharopened = false
            $(".bottom-text").fadeOut(300)
            $(".play-button-main").fadeOut(300)
            $(".app-container-main-ellipse").fadeOut(300)
            $(".app-container-main-buttons").fadeOut(300)
            $(".app-container-main-character-statics").css({ 'display': 'block' }).animate({
                right: "-40vh",
            }, 300, function () {

            });
        }
        $(".app-container-main-charname").html(HSN.PlyName)
    } else {
        $("#deletechar").fadeOut(300)
        delcharopened = false
    }
}

HSN.UpdateSelectDiv = function (id) {
    var SelectedCharData = $(".app-container-main-character-side").find("[char-id-m=" + id + "]").data("charData")
    if (SelectedCharData) {
        if (HSN.SelectedDiv == 0) {
            HSN.SelectedDiv = id
            $(".app-container-main-character-side").find("[char-id-m=" + id + "]").find(".selected").fadeIn(50)
            HSN.UpdateBackgrounds(SelectedCharData, true)
        } else {
            if (id == HSN.SelectedDiv) {
                return
            } else {
                $(".app-container-main-character-side").find("[char-id-m=" + HSN.SelectedDiv + "]").find(".selected").fadeOut(50)
                $(".app-container-main-character-side").find("[char-id-m=" + id + "]").find(".selected").fadeIn(50)
                var OldClickedCharData = $(".app-container-main-character-side").find("[char-id-m=" + HSN.SelectedDiv + "]").data("charData")
                HSN.UpdateBackgrounds(SelectedCharData, true)
                HSN.UpdateBackgrounds(OldClickedCharData, false)
                HSN.SelectedDiv = id
            }
        }
    }

}

clicked = 0
$(document).click(function (e) {
    clicked = clicked + 1
    if (tebexopened) {
        if (clicked > 1) {
            var tbxcontainer = e.target.id;
            if (tbxcontainer == !"tebex-container") {
                tebexopened = false
                $("#tebex-container").fadeOut(300)
                clicked = 0
            }
        }
    } else {
        clicked = 0
    }
    // }
});




$(document).on("click", ".character-side-index", function (e) {
    var loadingContainer = $(".loading-container");
    if (loadingContainer.is(":hidden")) {
        var id = $(this).attr("char-id-m")
        str = "tebex"
        var isdivtebex = id.search(str)
        if (isdivtebex != -1) {
            HSN.SelectedCid = Number(escapeHtml(id.replace('tebex', '')))
            if (!TebexBought[HSN.SelectedCid]) {
                if (delcharopened) {
                    $("#deletechar").fadeOut(300)
                }
                $("#tebex-container").fadeIn(300)
                tebexopened = true
            } else {
                if (!HSN.CharSlots[HSN.SelectedCid]) {
                    $(".app-container-main").fadeOut(300)
                    setTimeout(function () {
                        $(".app-container-createcharacter").fadeIn(300)
                    }, 300);
                    $.post('https://m-multichar/ChangeCam', JSON.stringify({}));
                    $.post('https://m-multichar/SetAnimations', JSON.stringify({ charData: undefined, toggle: false }));
                    HSN.SelectedCid = Number(escapeHtml(id.replace('tebex', '')))
                } else {
                    HSN.SelectedCid = Number(escapeHtml(id.replace('tebex', '')))
                    $(".bottom-text").fadeIn(300)
                    $(".play-button-main").fadeIn(300)
                    $(".app-container-main-ellipse").fadeIn(300)
                    $(".app-container-main-buttons").fadeIn(300)
                    $(".app-container-main-character-statics").css({ 'display': 'block' }).animate({
                        right: "4vh",
                    }, 300, function () {
                        HSN.SetCharacterStatics(HSN.CharSlots[HSN.SelectedCid])
                        $(".app-container-main-charname").html(HSN.CharSlots[HSN.SelectedCid].charinfo.firstname + " " + HSN.CharSlots[HSN.SelectedCid].charinfo.lastname)
                    });
                    $.post('https://m-multichar/SetBlur', JSON.stringify({ toggle: true }));
                    $(".loading-container").fadeIn(300)
                    setTimeout(function () {
                        $.post('https://m-multichar/SetAnimations', JSON.stringify({ charData: HSN.CharSlots[HSN.SelectedCid], toggle: true }))
                    }, 1000);
                    setTimeout(function () {
                        $.post('https://m-multichar/SetBlur', JSON.stringify({ toggle: false }));
                        $(".loading-container").fadeOut(300)
                    }, 1500);
                }
            }
        } else {
            if (HSN.CharSlots[id] == undefined) {
                $(".app-container-main").fadeOut(300)
                $(".app-container-main").fadeOut(300)
                setTimeout(function () {
                    $(".app-container-createcharacter").fadeIn(300)
                }, 300);
                $.post('https://m-multichar/ChangeCam', JSON.stringify({}));
                $.post('https://m-multichar/SetAnimations', JSON.stringify({ charData: undefined, toggle: false }));
                HSN.SelectedCid = (id)
            } else {
                HSN.SelectedCid = (id)
                $(".bottom-text").fadeIn(300)
                $(".play-button-main").fadeIn(300)
                $(".app-container-main-ellipse").fadeIn(300)
                $(".app-container-main-buttons").fadeIn(300)
                $(".app-container-main-character-statics").css({ 'display': 'block' }).animate({
                    right: "4vh",
                }, 300, function () {
                    HSN.SetCharacterStatics(HSN.CharSlots[HSN.SelectedCid])
                    $(".app-container-main-charname").html(HSN.CharSlots[HSN.SelectedCid].charinfo.firstname + " " + HSN.CharSlots[HSN.SelectedCid].charinfo.lastname)
                });
                $.post('https://m-multichar/SetBlur', JSON.stringify({ toggle: true }));
                $(".loading-container").fadeIn(300)
                setTimeout(function () {
                    $.post('https://m-multichar/SetAnimations', JSON.stringify({ charData: HSN.CharSlots[HSN.SelectedCid], toggle: true }))
                }, 1000);
                setTimeout(function () {
                    $.post('https://m-multichar/SetBlur', JSON.stringify({ toggle: false }));
                    $(".loading-container").fadeOut(300)
                }, 1500);
            }
        }
        HSN.UpdateSelectDiv(id)
    }
})

$(document).on("click", ".play-button", function (e) {
    var loadingContainer = $(".loading-container");

    if (loadingContainer.is(":hidden")) {
        loadingContainer.fadeOut(function () {
            $.post('https://m-multichar/Play', JSON.stringify({ charData: HSN.CharSlots[HSN.SelectedCid] }));
        });
    }
});

$(document).on("click", "#deletecharacter", function (e) {
    if (tebexopened) {
        $("#tebex-container").fadeOut(300)
        tebexopened = false
    }
    $("#deletechar").fadeIn(300)
    delcharopened = true
})






$(document).on("click", ".create-character-sex", function (e) {
    var gender = $(this).attr("gender")
    if (HSN.SelectedGender == "") {
        HSN.SelectedGender = gender
        $(".create-character-index").find("[gender=" + gender + "]").css("border-bottom", "3px solid white")
    } else {
        if (gender == HSN.SelectedGender) {
            return
        } else {
            $(".create-character-index").find("[gender=" + HSN.SelectedGender + "]").css("border-bottom", "none")
            $(".create-character-index").find("[gender=" + gender + "]").css("border-bottom", "3px solid white")
            HSN.SelectedGender = gender
        }
    }
})

function escapeHtml(string) {
    return String(string).replace(/[&<>"'=/]/g, function (s) {
        return entityMap[s];
    });
}
function hasWhiteSpace(s) {
    return /\s/g.test(s);
}

// create char

$(document).on("click", ".create-character-button", function (e) {
    var loadingContainer = $(".loading-container");
    if (loadingContainer.is(":hidden")) {
        let firstname = escapeHtml($(".create-character-index-container").find("[val='name']").val())
        let lastname = escapeHtml($(".create-character-index-container").find("[val='surname']").val())
        var e = document.getElementById("nationality-option-list");
        var value = e.value;
        let nationality = value
        let birthdate = escapeHtml($('#create-character-date').val())
        let height = $(".create-character-index-container").find("[val='height']").val()
        let gender = HSN.SelectedGender
        let cid = HSN.SelectedCid
        if (!firstname || !lastname || !nationality || !birthdate || !height || HSN.SelectedGender == "") {
            HSN.ErrorMessage()
            return
        }
        $.post('https://m-multichar/createChar', JSON.stringify({
            firstname: firstname,
            lastname: lastname,
            nationality: nationality,
            birthdate: birthdate,
            gender: gender,
            cid: cid,
        }));
        HSN.CloseNui()
        $(".create-character-index-container").find("[val='height']").val("")
        $(".create-character-index-container").find("[val='name']").val("")
        $(".create-character-index-container").find("[val='surname']").val("")
        $('#create-character-date').val("")
        $('.create-character-index-text').html("")
        $(".app-container-createcharacter").fadeOut(200)
        $(".app-container-main").fadeIn(300)
    }
})


HSN.CalculateHeight = function () {
    var n = $(".create-character-index-area-class").val();
    if (isNaN(n) || n == "") {
        return
    }
    n = Number(n)
    var realFeet = ((n * 0.393700) / 12);
    var feet = Math.floor(realFeet);
    var inches = Math.round((realFeet - feet) * 12);
    $(".create-character-index-area-class").val(n + "cm " + " - " + feet + "'" + inches)
    return feet + "" + inches + '';
}


HSN.CalculateAge = function (birthdate) {
    var today = new Date();
    var birthDate = new Date(birthdate);
    var age = today.getFullYear() - birthDate.getFullYear();
    var m = today.getMonth() - birthDate.getMonth();
    if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
        age--;
    }
    return age + " years old - " + birthdate;
}

HSN.CheckTebex = function () {
    var tbxlink = document.getElementById("tebex-link-div").value
    if (tbxlink == "") {
        $("#tebex-container").fadeOut(300)
        tebexopened = false
        return
    }
    $.post('https://m-multichar/checkTebex', JSON.stringify({ tbxid: tbxlink, cid: HSN.SelectedCid }));
    $("#tebex-container").fadeOut(300)
    tebexopened = false
}

HSN.Cancel = function () {
    $(".app-container-createcharacter").fadeOut(200)
    HSN.SelectedCid = 0
    HSN.SelectedDiv = 0
    $(".bottom-text").fadeOut(300)
    $(".play-button-main").fadeOut(300)
    $(".app-container-main-ellipse").fadeOut(300)
    $(".app-container-main-buttons").fadeOut(300)
    $(".app-container-main-character-side").find(".selected").fadeOut(50)
    $(".app-container-main-charname").html(HSN.PlyName)
    $(".app-container-main-character-statics").css({ 'display': 'block' }).animate({
        right: "-40vh",
    }, 300, function () {

    });
    setTimeout(function () {
        $(".app-container-main").fadeIn(300)
    }, 300);
}

HSN.SetLanguage = function () {
    $(".app-top-text").html(Config.Text["top-text"])
    $(".character-createnewcharacter").find("h").html(Config.Text["create-new-character"])
    $(".character-statics-desc").find("[id='age']").find(".statics-label").html(Config.Text["age"])
    $(".character-statics-desc").find("[id='cash']").find(".statics-label").html(Config.Text["cash"])
    $(".character-statics-desc").find("[id='bank']").find(".statics-label").html(Config.Text["bank"])
    $(".character-statics-desc").find("[id='number']").find(".statics-label").html(Config.Text["number"])
    $(".character-statics-desc").find("[id='nationality']").find(".statics-label").html(Config.Text["nationality"])
    $(".delete-character-container").find("[id='yes']").html(Config.Text["yes"])
    $(".delete-character-container").find("[id='no']").html(Config.Text["no"])
    $(".app-container-main").find("[id='deletechar']").find("p").html(Config.Text["delchartext"])
    $(".app-container-main").find("[id='tebex-container']").find("p").html(Config.Text["tebex-container-header"])
    $(".app-container-main-character-statics").find("p").html()
    $(".app-server-image").css("background", "url(images/" + Config.ServerImage + ")")
    $(".app-server-image").css("background-repeat", "no-repeat")
    $(".app-server-image").css("background-size", "100% 100%")
}