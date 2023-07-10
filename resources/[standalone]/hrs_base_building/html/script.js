var CurrentSituation
var CurrentProp 
var CurrentLife 
var adv 

$(function(){
    window.addEventListener("message", function(event){
        if (event.data.display == true){
            $(".ui").fadeIn(100);
           
            if (event.data.type == "Code") {
                $("#interact").hide();
                $("#doorlock").fadeIn(100);
                $("#text_div").html("");
                $("#info").hide();
                $("#info2").hide();


                CurrentSituation = event.data.action 
                CurrentProp = event.data.PropId
                adv = event.data.adv                         
            }else if (event.data.type == "Interact"){
                if (event.data.isdoor){
                    $("#code_img").show();
                }else{
                    $("#code_img").hide();
                }  

                if (event.data.upgrade){
                    $("#upgrade_img").show();
                }else{
                    $("#upgrade_img").hide();
                }  

                $("#doorlock").hide();
                $("#interact").fadeIn(100);

                CurrentLife = event.data.life;
                
                $("#info").html('<div id="life"></div>');
                $("#info").css("background-color","rgb(175, 24, 24)");
                $("#life").css("width", CurrentLife + "%");
                $("#info").fadeIn(100);
                

                
                if (event.data.fuel != undefined ) {
          
                    $("#fuel").css("width", event.data.fuel + "%");
                    $("#info2").fadeIn(100);

                    $("#fuel_img").show();
                }else{
                    $("#info2").hide();
                    $("#fuel_img").hide();
                }
              
                CurrentProp = event.data.PropId       
            }
        }else{
            $(".ui").fadeOut(100);
            $("#info").hide();
        }
    })
})

$(document).ready(function(){
    $(".ui").hide();

    $(".buttons_div").click(function() {
        var currentnumber = $("#text_div").text()
        var newtext = ""
        if (currentnumber.length < 4){
            newtext = $("#text_div").text() + $(this).text()
            if (newtext.length > 3){
                $.post(`http://${GetParentResourceName()}/number`, JSON.stringify(
                    {
                        number: newtext,
                        id: CurrentProp,
                        situation : CurrentSituation,
                        adv: adv
                    }));
            }
        }else{

        }
        
        $("#text_div").html(newtext);
    });

    $(".buttons_del").click(function() {
        console.log($(this).text())
        $("#text_div").html("");
    });

    $("#delete_img").click(function() {
        console.log("ola")
        $.post(`http://${GetParentResourceName()}/deleteprop`, JSON.stringify({id: CurrentProp}));
    });

    $("#repair_img").click(function() {
        $.post(`http://${GetParentResourceName()}/repairprop`, JSON.stringify({id: CurrentProp}));
    });

    $("#code_img").click(function() {
        $.post(`http://${GetParentResourceName()}/setcodeprop`, JSON.stringify({id: CurrentProp}));
    });

    $("#upgrade_img").click(function() {
        $.post(`http://${GetParentResourceName()}/upgradeprop`, JSON.stringify({id: CurrentProp}));
    });

    $("#fuel_img").click(function() {
        $.post(`http://${GetParentResourceName()}/addfuel`, JSON.stringify({id: CurrentProp}));
    });

    $("#delete_img").mouseenter(function() {
        $("#info").css("background-color","rgb(73, 67, 67)");
        $("#info").html("Destroy");
    });

    $("#repair_img").mouseenter(function() {
        $("#info").css("background-color","rgb(73, 67, 67)");
        $("#info").html("Repair");
    });

    $("#code_img").mouseenter(function() {
        $("#info").css("background-color","rgb(73, 67, 67)");
        $("#info").html("Set Code");
    });

    $("#fuel_img").mouseenter(function() {
        $("#info").css("background-color","rgb(73, 67, 67)");
        $("#info").html("Add fuel");
    });

    $("#upgrade_img").mouseenter(function() {
        $("#info").css("background-color","rgb(73, 67, 67)");
        $("#info").html("Upgrade");
    });

    $("#delete_img").mouseleave(function() {
        $("#info").css("background-color","rgb(175, 24, 24)");
        $("#info").html('<div id="life"></div>');
        $("#life").css("width", CurrentLife + "%");
    });

    $("#fuel_img").mouseleave(function() {
        $("#info").css("background-color","rgb(175, 24, 24)");
        $("#info").html('<div id="life"></div>');
        $("#life").css("width", CurrentLife + "%");
    });

    $("#repair_img").mouseleave(function() {
        $("#info").css("background-color","rgb(175, 24, 24)");
        $("#info").html('<div id="life"></div>');
        $("#life").css("width", CurrentLife + "%");
    });

    $("#code_img").mouseleave(function() {
        $("#info").css("background-color","rgb(175, 24, 24)");
        $("#info").html('<div id="life"></div>');
        $("#life").css("width", CurrentLife + "%");
    });

    $("#upgrade_img").mouseleave(function() {
        $("#info").css("background-color","rgb(175, 24, 24)");
        $("#info").html('<div id="life"></div>');
        $("#life").css("width", CurrentLife + "%");
    });

    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post(`http://${GetParentResourceName()}/exit`, JSON.stringify({}));
            return;
        }

        if (data.which == 8) {
            $.post(`http://${GetParentResourceName()}/exit`, JSON.stringify({}));
            return;
        }
    };
});