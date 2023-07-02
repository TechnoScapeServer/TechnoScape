var Inventories = {};
var InventoryParms = {};

var Admin = false;

//SETTINGS
var Settings = {
    inventorycolor: '#ffffff',
    labelcolor: '#242424',
    slotcolor: '#1f1f1f',
    slotborder: '#3b3b3b',
    slothover: '#ffffff',
    durabilitycolor: '#a442f5',
    autoplacing: true,
    discovered: {}
};

//DRAGGABLE
var itemDragging;
var idx;
var idy;

var startSlot = 0;
var startInv = '';

var startX = 0;
var startY = 0;

var canPlace = false;

var lastSlot = 0;
var lastInv = '';

var flipped = false;

var dragDrop = false;
var dragDropInventory = null;
var dragUse = false;
var dragTimeout = null;

//COMBINE
var combineItems = false;
var combineItem = null;
var combineInventory = null;
var combineReward = null;

//STACK
var stackItems = false;
var stackItem = null;
var stackInventory = null;

//SPLIT
var splitAmount = null;
var splitItem = null;
var splitSlot = null;
var splitFinv = null;
var splitTinv = null;
var tryShifted = false; 
var currentTimeout = null;

//PUT
var putType = null;
var putInventory = null;
var putItems = false;

//KEYS
var ctrlClicked = false;
var shiftClicked = false;
var inStackFocus = false;
var recentInventory = null;
var attachmentsOpened = false;
var attachmentContentPos = null;
var tabDown = false;

var keybindActive = null;

//MAIN
var config;
var cid;
var qbitems;

//SCREENPLACING
var minHeight;

// AUDIO
var audioPlayer;
var lootingPlayer;


//DISCOVER
var discovering = false;

//MOUSE DRAG
var dragging = false;
var dragX = 0;
var dragY = 0;

function getText(text) {

    if (config.Text[text]) {
        return config.Text[text];
    } else {
        return 'UNDEFINED';
    }

}

function hexToRgb(hex) {

    var shorthandRegex = /^#?([a-f\d])([a-f\d])([a-f\d])$/i;
    hex = hex.replace(shorthandRegex, function(m, r, g, b) {
        return r + r + g + g + b + b;
    });

    var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
    return result ? {
        r: parseInt(result[1], 16),
        g: parseInt(result[2], 16),
        b: parseInt(result[3], 16)
    } : null;
}

function playSound(file) {
    if (audioPlayer != null) {
        audioPlayer.pause();
    }

    audioPlayer = new Audio("../sounds/" + file + ".mp3");
    audioPlayer.volume = 0.1;

    var didPlayPromise = audioPlayer.play();


        didPlayPromise.then(_ => {}).catch(error => {
          
        })
    
}

function playLootingSound() {
    if (lootingPlayer != null) {
        lootingPlayer.pause();
    }

    lootingPlayer = new Audio("../sounds/looting.mp3");
    lootingPlayer.volume = 0.1;

    var didPlayPromise = lootingPlayer.play();


        didPlayPromise.then(_ => {}).catch(error => {
          
        })
    
}

function findAvailableSpot(inv, x, y) {

    for (let g = 0; g < InventoryParms[inv].slots; g++) {

        var testAvail = getSlots(g, x, y, InventoryParms[inv].rows, inv)

        if (testAvail != null) {
            var fail = false;

            for (let i = 0; i < testAvail.length; i++) {

                if ($('#' + inv).find('#slot-' + testAvail[i]).attr('slot') == null || $('#' + inv).find('#slot-' + testAvail[i]).attr('occupied') == "1") {

                    fail = true;
                }

            }

            if (!fail) {

                return g;
                break;
            }
        }

    }

    return null;

}

function getSlots(startSlot, x, y, rows, inv) {

    var slots = [];

    if ($('#' + inv).find('#slot-' + startSlot).attr('holder') == "1") {
        slots.push(1);
    } else {

        for (let i = startSlot; i < startSlot + (y * rows); i += rows) {

            if (i + x > Math.ceil((i + 1) / rows) * rows) {
                return null;
            }

            for (let g = i; g < i + x; g++) {

                slots.push(g);
            }
        }

    }

    return slots;

}

function isOverlap(el) {

    var fail = false;

    for (const [key, value] of Object.entries(InventoryParms)) {

        if ($('#' + key).parent().is(el) || !$('#' + key).parent().length) {
            return;
        }

        var rect1 = $('#' + key).parent()[0].getBoundingClientRect();
        var rect2 = $(el)[0].getBoundingClientRect();

        var overlap = !(rect1.right < rect2.left ||
            rect1.left > rect2.right ||
            rect1.bottom < rect2.top ||
            rect1.top > rect2.bottom)

        if (overlap) {
            fail = true;

            if (rect1.top + $('#' + key).parent().height() + 10 + $(el).height() < screen.height - 20) {
                $(el).css({
                    top: rect1.top + $('#' + key).parent().height() + 10 + 'px',

                })
            } else if (rect1.left + $('#' + key).parent().width() + 10 + $(el).width() < screen.width - 20) {
                $(el).css({
                    top: minHeight + 'px',
                    left: rect1.left + $('#' + key).parent().width() + 10 + 'px',

                })
            } else {
                fail = false
            }

            break;
        }

    }

    return fail;

}

//UNFINISHED
function findAvailableScreenPlace(el) {

    if (Settings['autoplacing']) {

        minHeight = screen.height;

        for (const [key, value] of Object.entries(InventoryParms)) {

            if (value) {
                if (!value.hidden) {
                    var off = $('#' + key).parent().offset().top

                    if (off < minHeight) {
                        minHeight = off;
                    }
                }
            }

        }

        if (minHeight > screen.height / 2) {
            minHeight = 20;
        }

        var tries = 0

        while (isOverlap(el)) {

            if (tries > 100) {
                return;
            }
            tries += 1;

        }

    }

}

function createHolder(name, slots, rows, content, label, locationX, locationY, restrictedTo, hidden, type) {

    if (InventoryParms[name] != null) {
        return;
    }

    Inventories[name] = content;
    InventoryParms[name] = {
        slots: slots,
        rows: rows,
        label: label,
        x: locationX,
        y: locationY,
        restrictedTo: restrictedTo,
        hidden: hidden,
        type: type
    }

    var base = '<div class="clearfix borderbox inventoryBox" inventory="' + name + '" holder="1"  style="left: ' + locationX + '; top: ' + locationY + '" ><!-- group -->';

    base = base + '<div class="header"><div class="label holder" style="background-color: ' + Settings['inventorycolor'] + '; color: ' + Settings['labelcolor'] + '">' + label + '</div></div>' +
        '   <div class="clearfix grpelem inventory holder" id="' + name + '" style="width: ' + (47 * rows) + '; height: ' + (slots / rows) * 47 + '; outline-color: ' + Settings['inventorycolor'] + '"><!-- group -->';

    base = base + '    <div class="slot" holder="1" id="slot-1" slot="1" occupied="0" inventory="' + name + '" data-sizePolicy="fixed" style=" outline-color: ' + Settings['slotborder'] + '; background-color: ' + Settings['slotcolor'] + '; width: ' + ((47 * rows) - 2) + '; height: ' + ((slots / rows) * 47 - 2) + '; " data-pintopage="page_fixedLeft"><!-- simple frame --></div>';

    base = base + '   </div>' +

        '  </div>';

    $('#main_container').append(base);

    //TOGGLES CHANGE OPACITY WHEN INACTIVE
    if ($('#hat-' + cid).is(":hidden")) {
        $('#toggleclothes').css('opacity', '0.5');
    }
    if ($('#primary-' + cid).is(":hidden")) {
        $('#toggleweapons').css('opacity', '0.5');
    }
    if ($('#content-' + cid).is(":hidden")) {
        $('#toggleinventory').css('opacity', '0.5');
    }
    if (!$('.settings-container').length) {
        $('#togglesettings').css('opacity', '0.5');
    }

    findAvailableScreenPlace($('#' + name).parent())

    for (const [key, value] of Object.entries(content)) {

        addItem(key, name)

    }

    $('#' + name).parent().addClass('pulse');
    setTimeout(() => {
        $('#' + name).parent().removeClass('pulse');
    }, 500)

    $(".inventoryBox").draggable({

        start: function(e, ui) {

            if ($(this).attr('inventory') != 'content-' + cid && $(this).attr('holder') != "1") {

                recentInventory = $(this).attr('inventory');
            }

            $(this).appendTo('#main_container');

        },
        stop: function(e, ui) {

            InventoryParms[$(this).attr('inventory')].x = $(this).css("left");
            InventoryParms[$(this).attr('inventory')].y = $(this).css("top");

        },

        handle: ".label"

    });

    if (hidden) {
        $('#' + name).parent().hide();
    }

}

function closeInventory(name) {

    if (name == 'content-' + cid) {
        closeMenu();
    } else {
        if (recentInventory == name) {
            recentInventory = null;
        }
        $.post('https://core_inventory/closeInventory', JSON.stringify({
            inventory: name,
            data: InventoryParms[name]
        }));
        InventoryParms[name] = null;
        Inventories[name] = null;
        $("#" + name).parent().remove();
    }

}

var num = 0;

function createInventory(name, slots, rows, content, label, locationX, locationY, hidden, type, restrictedTo) {

    if (InventoryParms[name] != null) {
        return;
    }

    if (name.includes('loot-')) {
        playLootingSound();
    }

    Inventories[name] = content;
    InventoryParms[name] = {
        slots: slots,
        rows: rows,
        label: label,
        x: locationX,
        y: locationY,
        hidden: hidden,
        type: type,
        restrictedTo: restrictedTo
    }

    var base = '<div class="clearfix borderbox inventoryBox " inventory="' + name + '" holder="0"  style="left: ' + locationX + '; top: ' + locationY + '" ><!-- group -->';

    base = base + '<div class="header"><div class="label" style="background-color: ' + Settings['inventorycolor'] + '; color: ' + Settings['labelcolor'] + '">' + label + '</div><div class="close" onclick="closeInventory(\'' + name + '\')">' +
        '<svg viewBox="0 0 1024 1024" class="close-icon">' +
        '      <path' +
        '        d="M512 0c-282.77 0-512 229.23-512 512s229.23 512 512 512 512-229.23 512-512-229.23-512-512-512zM512 928c-229.75 0-416-186.25-416-416s186.25-416 416-416 416 186.25 416 416-186.25 416-416 416z"' +
        '      ></path>' +
        '      <path' +
        '        d="M672 256l-160 160-160-160-96 96 160 160-160 160 96 96 160-160 160 160 96-96-160-160 160-160z"' +
        '      ></path>' +
        '    </svg>' +
        '' + getText('close') + '</div></div>' +
        '   <div class="clearfix grpelem inventory " id="' + name + '" style="width: ' + (47 * rows) + '; grid-template-columns: repeat(' + rows + ', 47px); outline-color: ' + Settings['inventorycolor'] + '">';
    for (let i = 0; i < slots; i++) {

        base = base + '    <div class="slot" holder="0"  id="slot-' + i + '" slot="' + i + '" style="outline-color: ' + Settings['slotborder'] + '; background-color: ' + Settings['slotcolor'] + ';" occupied="0" inventory="' + name + '" data-sizePolicy="fixed" data-pintopage="page_fixedLeft"><!-- simple frame --></div>';

    }

    base = base + '   </div>' +

        '  </div>';

    $('#main_container').append(base);

    findAvailableScreenPlace($('#' + name).parent())

    for (const [key, value] of Object.entries(content)) {

        if (content[key].slot != -1) {
            addItem(key, name);
        }

    }

    for (const [key, value] of Object.entries(content)) {

        if (content[key].slot == -1) {
            addItem(key, name);
        }

    }

    if (name != 'content-' + cid) {

        recentInventory = name;
    }

    $('#' + name).parent().addClass('pulse');
    setTimeout(() => {
        $('#' + name).parent().removeClass('pulse');
    }, 500)

    $(".inventoryBox").draggable({

        start: function(e, ui) {

            if ($(this).attr('inventory') != 'content-' + cid && $(this).attr('holder') != "1") {

                recentInventory = $(this).attr('inventory');
            }
            $(this).appendTo('#main_container');

        },
        stop: function(e, ui) {

            InventoryParms[$(this).attr('inventory')].x = $(this).css("left");
            InventoryParms[$(this).attr('inventory')].y = $(this).css("top");

        },

        handle: ".label"

    });

    if (hidden) {
        $('#' + name).parent().hide();
    }

}


window.onclick = e => {

    if (ctrlClicked && $(e.target).parent().hasClass('item')) {

        ctrlClick($(e.target).parent())

    }

}


function guideEngine(t, x, y) {

    requestAnimationFrame(function() {

    if (!itemDragging) {return}

    clearTimeout(dragTimeout);
    $('.gradientLeft').css('background', 'linear-gradient(90deg, rgba(255,255,255,0.1031547619047619) 0%, rgba(255,255,255,0) 100%)');
    $('.gradientRight').css('background', 'linear-gradient(-90deg, rgba(255,255,255,0.1031547619047619) 0%, rgba(255,255,255,0) 100%)');
    $('.slot').css('background-color', Settings['slotcolor']);
    $('.slot').css('outline-color', Settings['slotborder']);
    $('.dragElement').remove();
    dragDrop = false;
    dragUse = false;
    stackItems = false;
    combineItems = false;
    putItems = false;

    canPlace = false;
    lastSlot = startSlot;
    lastInv = startInv;

    var found = false;

    var el = document.elementsFromPoint(x, y)

    for (var i = 0; i < el.length; i++) {

          
          var e = $(el[i]);


         //SAME ITEM PROTECTION
        if (e.attr('id') == $('#' + itemDragging).attr('id') || (!e.hasClass('item') &&  !e.hasClass('slot')) ) {

            if (e.hasClass('character')) {
            dragUse = true;
            }

            continue;
        }

        //ITEM INFORMATION
        var item = e.attr("id");
        var category = e.attr("category");
        var inventory = e.attr("inventory");
        var name = e.attr("name");
        var snum = parseInt(e.attr("slot"));
        var holder = e.attr("holder");


        if (e.hasClass('item')) {

            //COMBINE
             for (const [key, value] of Object.entries(config.CombineItems)) {
                if ((value[0] == $('#' + itemDragging).attr("name") && value[1] == e.attr("name") )|| (value[1] == $('#' + itemDragging).attr("name") && value[0] == e.attr("name"))) {
                    
                     found = true;

                    combineItems = true;
                    combineReward = key;
                    combineItem = item;
                    combineInventory = inventory;

                    var slots = getSlots(snum, Inventories[inventory][item].x, Inventories[inventory][item].y, InventoryParms[inventory].rows, inventory);

                    for (let g = 0; g < slots.length; g++) {

                    $('#' + inventory).find('#slot-' + slots[g]).css('background', 'rgba(135, 245, 66, 1)');
                    $('#' + inventory).find('#slot-' + slots[g]).css('outline-color', 'rgba(135, 245, 66, 1)');
                    
                    }

                   

                    return;
               }
            }

            if (e.attr("name") == $('#' + itemDragging).attr("name") && config.ItemCategories[$('#' + itemDragging).attr("category")].stack) { //STACKING

             found = true;

            var slots = getSlots(snum, Inventories[inventory][item].x, Inventories[inventory][item].y, InventoryParms[inventory].rows, inventory);

            if (Inventories[inventory][item].amount + Inventories[startInv][itemDragging].amount <= config.ItemCategories[$('#' + itemDragging).attr("category")].stack) {

                for (let g = 0; g < slots.length; g++) {

                    $('#' + inventory).find('#slot-' + slots[g]).css('background', 'rgba(245, 182, 37, 1)');
                    $('#' + inventory).find('#slot-' + slots[g]).css('outline-color', 'rgba(245, 182, 37, 1)');

                    stackItems = true;
                    stackItem = item;
                    stackInventory = inventory;
                }
            } else {
                for (let g = 0; g < slots.length; g++) {
                    $('#' + inventory).find('#slot-' + slots[g]).css('background', 'rgba(247, 32, 54, 1)');
                    $('#' + inventory).find('#slot-' + slots[g]).css('outline-color', 'rgba(247, 32, 54, 1)');
                    stackItems = false;
                    stackItem = null;
                    stackInventory = null;
                }
            }

           

            return;
        }

        if ( config.Inventories[e.attr("name")] != null) { //PUT INTO BACKPACK

            found = true;

            if (config.Inventories[e.attr("name")].restrictedTo != null && !config.Inventories[e.attr("name")].restrictedTo.includes($(t).attr("category"))) {
                
              canPlace = false;
              lastSlot = startSlot;
              lastInv = startInv;

            } else {

            var slots = getSlots(snum, Inventories[inventory][item].x, Inventories[inventory][item].y, InventoryParms[inventory].rows, inventory);

            for (let g = 0; g < slots.length; g++) {

                    $('#' + inventory).find('#slot-' + slots[g]).css('background', 'rgba(245, 182, 37, 1)');
                    $('#' + inventory).find('#slot-' + slots[g]).css('outline-color', 'rgba(245, 182, 37, 1)');

                 
                }

            putItems = true;
            putInventory = 'inv-' + item;
            putType = name;


            return;
        }
        }



        } else if (e.attr("class") == 'slot') { 

            found = true;
            var place = true;

            var rows = InventoryParms[inventory].rows;

            slots = [];

            if (holder == "1") {

                if ($('#' + inventory).find('#slot-' + 1).attr('occupied') == "0" && (InventoryParms[inventory].restrictedTo == null || InventoryParms[inventory].restrictedTo.includes($(t).attr("category")))) {
                    $('#' + inventory).find('#slot-' + 1).css('background', Settings['slothover']);
                    $('#' + inventory).find('#slot-' + 1).css('outline-color', Settings['slothover']);
                } else {
                    $('#' + inventory).find('#slot-' + 1).css('background', 'rgba(247, 32, 54, 1)');
                    $('#' + inventory).find('#slot-' + 1).css('outline-color', 'rgba(247, 32, 54, 1)');
                    place = false;
                }

                slots.push(1);

            } else {

                for (let i = snum; i < snum + (idy * rows); i += rows) {

                    if (i + idx > Math.ceil((i + 1) / rows) * rows) {
                        place = false;
                        break;
                    }

                    for (let g = i; g < i + idx; g++) {

                        if ($('#' + inventory).find('#slot-' + g).attr('occupied') == "0" && (InventoryParms[inventory].restrictedTo == null || InventoryParms[inventory].restrictedTo.includes($(t).attr("category"))) && inventory != 'inv-' + $(t).attr('id')) {
                            $('#' + inventory).find('#slot-' + g).css('background', Settings['slothover']);
                            $('#' + inventory).find('#slot-' + g).css('outline-color', Settings['slothover']);
                        } else {
                            $('#' + inventory).find('#slot-' + g).css('background', 'rgba(247, 32, 54, 1)');
                            $('#' + inventory).find('#slot-' + g).css('outline-color', 'rgba(247, 32, 54, 1)');
                            place = false;
                        }

                        slots.push(g);
                    }
                }

            }

            if (place) {
                canPlace = true;
                lastSlot = snum;
                lastInv = inventory;
            }

            break;

        }

        
    }

    if (!found) {

        if (dragUse) {
            dragUse = false;
            dragTimeout = setTimeout(() => {

                $('.gradientLeft').css('background', 'linear-gradient(90deg, rgba(252, 190, 43,0.1931547619047619) 0%, rgba(252, 190, 43,0) 100%)')
                $('.gradientRight').css('background', 'linear-gradient(-90deg, rgba(252, 190, 43,0.1931547619047619) 0%, rgba(252, 190, 43,0) 100%)');
                $('#main_container').append('<div class="dragUse scale-down-center dragElement"><p>' + getText('use') + '</p></div>');
                dragUse = true;

            }, 500)
        } else {
            dragTimeout = setTimeout(() => {

                $('.gradientLeft').css('background', 'linear-gradient(90deg, rgba(255, 51, 61,0.1931547619047619) 0%, rgba(255, 51, 61,0) 100%)')
                $('.gradientRight').css('background', 'linear-gradient(-90deg, rgba(255, 51, 61,0.1931547619047619) 0%, rgba(255, 51, 61,0) 100%)');
                $('#main_container').append('<div class="dragDrop scale-down-center dragElement"><p>' + getText('drop') + '</p></div>');
                dragDrop = true;
                dragDropInventory = $('#' + itemDragging).attr("inventory");

            }, 500)
        }

    }

});

}

function Toggle(type) {

    playSound('hover');

    if (type == 'clothing') {

        if ($('#hat-' + cid).is(":visible")) {

            for (const [key, value] of Object.entries(config.InventoryClothing)) {

                $('#' + key + '-' + cid).parent().hide();
                InventoryParms[key + '-' + cid].hidden = true;

            }

            $('#toggleclothes').css('opacity', '0.5');
        } else {

            for (const [key, value] of Object.entries(config.InventoryClothing)) {

                $('#' + key + '-' + cid).parent().show();
                InventoryParms[key + '-' + cid].hidden = false;

            }

            $('#toggleclothes').css('opacity', '1.0');
        }

    }
    if (type == 'weapons') {

        if ($('#primary-' + cid).is(":visible")) {
            $('#primary-' + cid).parent().hide();
            $('#secondry-' + cid).parent().hide();

            InventoryParms['primary-' + cid].hidden = true;
            InventoryParms['secondry-' + cid].hidden = true;

            $('#toggleweapons').css('opacity', '0.5');
        } else {
            $('#primary-' + cid).parent().show();
            $('#secondry-' + cid).parent().show();

            InventoryParms['primary-' + cid].hidden = false;
            InventoryParms['secondry-' + cid].hidden = false;

            $('#toggleweapons').css('opacity', '1.0');
        }

    }
    if (type == 'inventory') {

        if ($('#content-' + cid).is(":visible")) {
            $('#content-' + cid).parent().hide();
            InventoryParms['content-' + cid].hidden = true;

            $('#toggleinventory').css('opacity', '0.5');
        } else {
            $('#content-' + cid).parent().show();
            InventoryParms['content-' + cid].hidden = false;
            $('#toggleinventory').css('opacity', '1.0');
        }

    }
    if (type == 'settings') {

        openSettings();

    }

}

function closeInformation() {
    if ($('.inf-container1').length) {
        $('.inf-container1').fadeOut();
        setTimeout(() => {

            $('.inf-container1').remove();
        }, 500)
    }
}

function setKeybind(id) {

    var t = $('#' + id);

    $(t).append('<div class="keybind"><p>?</p></div>');
    keybindActive = t;

}

$(window).on('keydown', function(e) {

    if (keybindActive != null) {

        var code = (e.keyCode ? e.keyCode : e.which);
        keybindActive.find('.keybind').find("p").addClass("scale-down-center").text(e.key.toUpperCase());
        $.post('https://core_inventory/setKeybind', JSON.stringify({
            key: e.key.toUpperCase(),
            exact: keybindActive.attr('id'),
            item: keybindActive.attr('name')
        }));
        var disapear = keybindActive;
        keybindActive = null;
        setTimeout(() => {
            disapear.find('.keybind').fadeOut();
            setTimeout(() => {
                disapear.find('.keybind').remove();

            }, 500)

        }, 500)

    }

});

function selectLocation(store) {

    $.post('https://core_inventory/selectlocation', JSON.stringify({
        location: store
    }));

}

function openWeaponUI(show, data, ammo, maxammo, percent) {

    if (config == null || config == undefined || !config.EnableWeaponUI) {
        return;
    }

    if (!show && $('.weaponui-main').length) {
        $('.weaponui-main').removeClass('slide-weaponui-left');
        $('.weaponui-main').addClass('slide-weaponui-back');
        setTimeout(() => {
            $('.weaponui-main').remove();
        }, 500)
        return;
    }

    if ($('.weaponui-main').length) {

        $('.weaponui-bullets').text(ammo);
        $('.weaponui-max').text(maxammo);
        $('.weaponui-durability').css('width', percent + '%');

        return;
    }

    var base =
        '<div class="weaponui-main slide-weaponui-left" style="right: ' + config.WeaponUIRight + 'vw; top: ' + config.WeaponUITop + 'vh;">' +
        '      <div class="weaponui-weapon">' +
        '        <div class="weaponui-bulletontainer" style="background-color: ' + Settings['inventorycolor'] + ';">' +
        '          <span class="weaponui-bullets" style="color: ' + Settings['labelcolor'] + '">' + ammo + '</span>' +
        '          <span class="weaponui-max" style="color: ' + Settings['labelcolor'] + '">' + maxammo + '</span>' +
        '        </div>' +
        '        <div' +
        '          style="background:  url(img/' + data.name + '.png) no-repeat center center; background-size: contain;"' +
        '          class="weaponui-image"' +
        '        </div>' +
        '        <div class="weaponui-durability" style="width: ' + percent + '%' + ';background-color: ' + Settings['durabilitycolor'] + ';"></div>' +
        '      </div>';

    $('body').append(base);

}

function saveMetadata(id, inventory) {

    var metadata = $('#metadataedit').val();
    $.post('https://core_inventory/saveMetadata', JSON.stringify({metadata: JSON.parse(metadata), item: id, inventory: inventory }));
     if ($('.inf-container1').length) {
        $('.inf-container1').remove();
    }



}

function openMetadataEdit(id, inventory) {

 if ($('.inf-container1').length) {
      
         var itemData = Inventories[$('#' + id).attr('inventory')][id]
        $('.inf-container1').append('<textarea id="metadataedit" style="background-color: rgba(0,0,0,0.9); position: absolute; resize:none; height: 100%; width: 100%; color:white; font-family: \'M PLUS 1 Code\', sans-serif;"> '+JSON.stringify(itemData.metadata)+' </textarea> <div class="savebutton" onclick="saveMetadata(\''+id+'\',\'' + inventory + '\');">SAVE</div>');

    }


}

function openInformation(item, id) {

    if ($('.inf-container1').length) {
        $('.inf-container1').remove();
    }

    var inventory = $('#' + id).attr('inventory')
    var itemData = Inventories[inventory][id]

    var base = '' +
        '    <div class="inf-container1 scale-down-ver-top">' +
        '      <svg viewBox="0 0 1024 1024" class="inf-close" onclick="closeInformation()">' +
        '        <path' +
        '          d="M810 274l-238 238 238 238-60 60-238-238-238 238-60-60 238-238-238-238 60-60 238 238 238-238z"' +
        '        ></path>' +
        '      </svg>';
    if (Admin) {

       base = base + '<svg viewBox="0 0 1024 1024" class="inf-edit" onclick="openMetadataEdit(\'' + id + '\',\'' + inventory + '\')">'+
'      <path'+
'        d="M469.333 128h-298.667c-35.328 0-67.413 14.379-90.496 37.504s-37.504 55.168-37.504 90.496v597.333c0 35.328 14.379 67.413 37.504 90.496s55.168 37.504 90.496 37.504h597.333c35.328 0 67.413-14.379 90.496-37.504s37.504-55.168 37.504-90.496v-298.667c0-23.552-19.115-42.667-42.667-42.667s-42.667 19.115-42.667 42.667v298.667c0 11.776-4.736 22.4-12.501 30.165s-18.389 12.501-30.165 12.501h-597.333c-11.776 0-22.4-4.736-30.165-12.501s-12.501-18.389-12.501-30.165v-597.333c0-11.776 4.736-22.4 12.501-30.165s18.389-12.501 30.165-12.501h298.667c23.552 0 42.667-19.115 42.667-42.667s-19.115-42.667-42.667-42.667zM759.168 76.501l-405.333 405.333c-5.205 5.163-9.259 11.947-11.221 19.84l-42.667 170.667c-1.664 6.4-1.792 13.568 0 20.693 5.717 22.869 28.885 36.779 51.755 31.061l170.667-42.667c7.125-1.749 14.080-5.504 19.84-11.221l405.333-405.333c25.984-25.984 38.997-60.16 38.997-94.165s-13.013-68.181-38.997-94.165-60.203-39.040-94.208-39.040-68.181 13.013-94.165 38.997zM819.499 136.832c9.344-9.344 21.504-13.995 33.835-13.995s24.491 4.651 33.835 13.995 13.995 21.504 13.995 33.835-4.651 24.491-13.995 33.835l-396.971 396.971-90.197 22.571 22.571-90.197z"'+
'      ></path>'+
'    </svg>';
    
    }
        base = base + '      <div class="inf-image" style="background:  url(img/' + item + '.png) no-repeat center center; background-size: contain;"></div>' +
        '      <span class="inf-text">' + qbitems[item].label.toUpperCase() + '</span>' +
        '      <span class="inf-description">' +
        qbitems[item].description +
        '      </span>' +
        '      <div class="inf-details">';

    if (itemData.metadata.durability) {
        base = base + '        <div class="inf-durability">' +
            '          <span class="inf-text1">' + getText('durability') + '</span>' +
            '          <div class="inf-bar"><div class="inf-fillbar" style="background-color: ' + Settings['durabilitycolor'] + '; width: ' + itemData.metadata.durability + '%"></div></div>' +
            '        </div>';
    }

    if (itemData.metadata.serial) {
        base = base + '        <div class="inf-buy">' +
            '          <span class="inf-text5">' + getText('serial') + '</span>' +
            '          <div class="inf-location">' +
            '            <span class="inf-text4">' + itemData.metadata.serial + '</span>' +
            '          </div>' +
            '        </div>';
    }

    for (const [key, value] of Object.entries(config.ShownMetadata)) {

        if (itemData.metadata[key] != null) {
            base = base + '        <div class="inf-' + key + '">' +
                '          <span class="inf-text5">' + value + '</span>' +
                '          <div class="inf-location">' +
                '            <span class="inf-text4">' + itemData.metadata[key] + '</span>' +
                '          </div>' +
                '        </div>';
        }

    }

    var foundSell = false;
    for (const [key, value] of Object.entries(config.ItemSell)) {

        if (value.items[item] != null) {
            foundSell = true;
        }

    }
    if (foundSell) {

        base = base + '        <div class="inf-sell">' +
            '          <span class="inf-text2">' + getText('sell_it_at') + '</span>';
        for (const [key, value] of Object.entries(config.ItemSell)) {
            if (value.items[item] != null) {
                base = base + '          <div class="inf-location" onclick="selectLocation(\'' + key + '\')">' +
                    '            <span class="inf-text3">$' + value.items[item] + '</span>' +
                    '            <span class="inf-text4">' + value.label + '</span>' +
                    '          </div>';
            }
        }
        base = base + '        </div>';
    }

    var foundBuy = false;
    for (const [key, value] of Object.entries(config.ItemBuy)) {

        if (value.items[item] != null) {
            foundBuy = true;
        }

    }
    if (foundBuy) {

        base = base + '        <div class="inf-buy">' +
            '          <span class="inf-text5">' + getText('buy_it_at') + '</span>';

        for (const [key, value] of Object.entries(config.ItemBuy)) {
            if (value.items[item] != null) {
                base = base + '          <div class="inf-location" onclick="selectLocation(\'' + key + '\')">' +
                    '            <span class="inf-text3">$' + value.items[item] + '</span>' +
                    '            <span class="inf-text4">' + value.label + '</span>' +
                    '          </div>';
            }
        }

        base = base + '        </div>';
    }

    base = base + '      </div>';

     for (const [key, value] of Object.entries(config.CombineItems)) {

        if (value[0] == item || value[1] == item) {

            var combinableItem;

            if (value[0] == item) {
                combinableItem = value[1];
            } else {
                combinableItem = value[0];
            }


 base = base + '<div class="combine-container1">'+
'      <div class="combine-item1" style="background:  url(img/'+item+'.png) no-repeat center center; background-size: contain; "></div>'+
'      <svg viewBox="0 0 1024 1024" class="combine-icon">'+
'        <path'+
'          d="M213.333 554.667h256v256c0 23.552 19.115 42.667 42.667 42.667s42.667-19.115 42.667-42.667v-256h256c23.552 0 42.667-19.115 42.667-42.667s-19.115-42.667-42.667-42.667h-256v-256c0-23.552-19.115-42.667-42.667-42.667s-42.667 19.115-42.667 42.667v256h-256c-23.552 0-42.667 19.115-42.667 42.667s19.115 42.667 42.667 42.667z"'+
'        ></path>'+
'      </svg>'+
'      <div class="combine-item2" style="background:  url(img/'+combinableItem+'.png) no-repeat center center; background-size: contain; "></div>'+
'      <svg viewBox="0 0 1024 1024" class="combine-icon2">'+
'        <path'+
'          d="M481.835 243.499l225.835 225.835h-494.336c-23.552 0-42.667 19.115-42.667 42.667s19.115 42.667 42.667 42.667h494.336l-225.835 225.835c-16.683 16.683-16.683 43.691 0 60.331s43.691 16.683 60.331 0l298.667-298.667c3.925-3.925 7.083-8.619 9.259-13.824 4.309-10.453 4.309-22.229 0-32.683-2.091-5.035-5.163-9.728-9.259-13.824l-298.667-298.667c-16.683-16.683-43.691-16.683-60.331 0s-16.683 43.691 0 60.331z"'+
'        ></path>'+
'      </svg>'+
'      <div class="combine-reward" style="background:  url(img/'+key+'.png) no-repeat center center; background-size: contain; "></div>'+
'    </div>';
    


        }

     }

    
    base = base + '    </div>';

    $('#' + id).append(base);
   
    setTimeout(() => {

        $('.inf-container1').removeClass('scale-down-ver-top');
    }, 200)

}

function setAutoplacing() {

    if (Settings['autoplacing']) {
        $('.settings-text6').css('opacity', 0.5);
        Settings['autoplacing'] = false
    } else {
        $('.settings-text6').css('opacity', 1.0);
        Settings['autoplacing'] = true
    }

}

function resetKeybinds() {

    $.post('https://core_inventory/resetKeybinds', JSON.stringify({}));

}

function openSettings() {

    if ($('.settings-container').length) {
        $('.settings-container').removeClass('slide-right');
        $('.settings-container').addClass('slide-back');
        setTimeout(() => {

            $('.settings-container').remove();
        }, 500)

        $('#togglesettings').css('opacity', '0.5');

        return;

    }

    var colorpickerOptions = {
        parts: ['map', 'bar'],
        altProperties: 'background-color',
        altField: '.colorpicker',
        color: '#ffffff',
        alpha: true,
        init: function(event, color) {
            var labelcolor = '#4444';

            var cc = Settings[$(event.target).attr('setting')];
            var rgb = hexToRgb(cc);
            if (rgb != null) {

                if ((rgb.r * 0.299 + rgb.g * 0.587 + rgb.b * 0.114) > 186) {

                    labelcolor = '#000000';

                } else {

                    labelcolor = '#ffff';
                }

            }

            $(event.target).css('color', labelcolor);
            $(event.target).css('background-color', cc)

        },
        select: function(event, color) {
                var color_in_hex_format = '#' + color.formatted;
                Settings[$(event.target).attr('setting')] = color_in_hex_format;
                $(event.target).css('background-color', color_in_hex_format);

                var setting = $(event.target).attr('setting');

                if (setting == 'inventorycolor') {
                    $('.inventory').css('outline-color', color_in_hex_format);
                    $('.label').css('background-color', color_in_hex_format);
                    $('.weaponui-bulletontainer').css('background-color', color_in_hex_format);
                    $('.stackSlider').css('background-color', color_in_hex_format);
                } else if (setting == 'labelcolor') {
                    $('.label').css('color', color_in_hex_format);

                } else if (setting == 'slotcolor') {
                    $('.slot').css('background-color', color_in_hex_format);

                } else if (setting == 'slotborder') {
                    $('.slot').css('outline-color', color_in_hex_format);

                } else if (setting == 'durabilitycolor') {
                    $('.durability').css('background-color', color_in_hex_format);
                    $('.inf-fillbar').css('background-color', color_in_hex_format);
                    $('.weaponui-durability').css('background-color', color_in_hex_format);

                }

                var labelcolor = '#4444';
                var rgb = hexToRgb(color_in_hex_format);
                if (rgb != null) {

                    if ((rgb.r * 0.299 + rgb.g * 0.587 + rgb.b * 0.114) > 186) {

                        labelcolor = '#000000';

                    } else {

                        labelcolor = '#ffff';
                    }

                }

                $(event.target).css('color', labelcolor);

            }

            ,
        inline: false
    };

    $('#togglesettings').css('opacity', '1.0');

    var base =
        '  <div class="settings-container slide-right">' +
        '    <div class="settings-main">' +
        '      <div class="settings-inventorycolor">' +
        '        <span class="settings-text" setting="inventorycolor">INVENTORY COLOR</span>' +
        '      </div>' +
        '      <div class="settings-labelcolor">' +
        '        <span class="settings-text" setting="labelcolor">LABEL COLOR</span>' +
        '      </div>' +
        '      <div class="settings-slotcolor">' +
        '        <span class="settings-text" setting="slotcolor">SLOT COLOR</span>' +
        '      </div>' +
        '      <div class="settings-slotborder">' +
        '        <span class="settings-text" setting="slotborder">SLOT BORDER</span>' +
        '      </div>' +
        '      <div class="settings-slothover">' +
        '        <span class="settings-text" setting="slothover">SLOT HOVER</span>' +
        '      </div>' +
        '      <div class="settings-durabilitycolor">' +
        '        <span class="settings-text" setting="durabilitycolor">DURABILITY COLOR</span>' +
        '      </div>' +
        '      <div class="settings-autoplacing">' +
        '        <span class="settings-text6" onclick="setAutoplacing()">AUTO PLACING</span>' +
        '      </div>' +
        '      <div class="settings-resetkeybinds">' +
        '        <span class="settings-text7" onclick="resetKeybinds()">RESET KEYBINDS</span>' +
        '      </div>' +
        '    </div>' +
        '  </div>';

    $('#main_container').append(base);
    $('.settings-text').colorpicker(colorpickerOptions);

    if (Settings['autoplacing']) {
        $('.settings-text6').css('opacity', 1.0);

    } else {
        $('.settings-text6').css('opacity', 0.5);

    }
}

function openInventory() {

    var base =
        '<div class="gradientLeft"></div>' +
        '<div class="gradientRight"></div>' +
        '<div class="character"></div>' +
        '  <div class="home-container">' +
        '    <div class="home-container1">';

    if (!config.DisableClothing) {
        base = base + '      <span class="home-text slide-bottom" id="toggleclothes" onclick="Toggle( \'clothing\')">' + getText('clothing') + '</span>';
    }

    base = base + '      <span class="home-text slide-bottom" id="toggleweapons" onclick="Toggle( \'weapons\')">' + getText('weapons') + '</span>' +
        '      <span class="home-text slide-bottom" id="toggleinventory" onclick="Toggle( \'inventory\')">' + getText('inventory') + '</span>' +
        ' <svg viewBox="0 0 877.7142857142857 1024" class="settings-icon slide-bottom" id="togglesettings" onclick="Toggle( \'settings\')">' +
        '      <path' +
        '        d="M585.143 512c0-80.571-65.714-146.286-146.286-146.286s-146.286 65.714-146.286 146.286 65.714 146.286 146.286 146.286 146.286-65.714 146.286-146.286zM877.714 449.714v126.857c0 8.571-6.857 18.857-16 20.571l-105.714 16c-6.286 18.286-13.143 35.429-22.286 52 19.429 28 40 53.143 61.143 78.857 3.429 4 5.714 9.143 5.714 14.286s-1.714 9.143-5.143 13.143c-13.714 18.286-90.857 102.286-110.286 102.286-5.143 0-10.286-2.286-14.857-5.143l-78.857-61.714c-16.571 8.571-34.286 16-52 21.714-4 34.857-7.429 72-16.571 106.286-2.286 9.143-10.286 16-20.571 16h-126.857c-10.286 0-19.429-7.429-20.571-17.143l-16-105.143c-17.714-5.714-34.857-12.571-51.429-21.143l-80.571 61.143c-4 3.429-9.143 5.143-14.286 5.143s-10.286-2.286-14.286-6.286c-30.286-27.429-70.286-62.857-94.286-96-2.857-4-4-8.571-4-13.143 0-5.143 1.714-9.143 4.571-13.143 19.429-26.286 40.571-51.429 60-78.286-9.714-18.286-17.714-37.143-23.429-56.571l-104.571-15.429c-9.714-1.714-16.571-10.857-16.571-20.571v-126.857c0-8.571 6.857-18.857 15.429-20.571l106.286-16c5.714-18.286 13.143-35.429 22.286-52.571-19.429-27.429-40-53.143-61.143-78.857-3.429-4-5.714-8.571-5.714-13.714s2.286-9.143 5.143-13.143c13.714-18.857 90.857-102.286 110.286-102.286 5.143 0 10.286 2.286 14.857 5.714l78.857 61.143c16.571-8.571 34.286-16 52-21.714 4-34.857 7.429-72 16.571-106.286 2.286-9.143 10.286-16 20.571-16h126.857c10.286 0 19.429 7.429 20.571 17.143l16 105.143c17.714 5.714 34.857 12.571 51.429 21.143l81.143-61.143c3.429-3.429 8.571-5.143 13.714-5.143s10.286 2.286 14.286 5.714c30.286 28 70.286 63.429 94.286 97.143 2.857 3.429 4 8 4 12.571 0 5.143-1.714 9.143-4.571 13.143-19.429 26.286-40.571 51.429-60 78.286 9.714 18.286 17.714 37.143 23.429 56l104.571 16c9.714 1.714 16.571 10.857 16.571 20.571z"' +
        '      ></path>' +
        '    </svg>' +
        '    </div>' +

        '    <img src="gradient.png" alt="image" class="home-image" />' +
        '  </div>';

    $("#main_container").append(base);

    playSound('openbag');
    inventoryOpened = true;

}

function syncInventory(inventory) {

    $.post('https://core_inventory/sync', JSON.stringify({
        inventory: inventory,
        data: Inventories[inventory]
    }));

}

function updateFocusInput(value) {
    inStackFocus = value;
}

function splitOnKeyPress(event) {
    if (event.keyCode == 13) {
        inStackFocus = false;
        shiftClicked = false;
    }
}

function updateSlider(val, max) {
    if (val > max) {
        val = max;
    }
    let newVal = 130 / $('.stackSlider').attr('max') * val;
    $('.stackText').css('left', newVal + 'px');
    $('.stackText').text(val);
    $('.stackTextInput').val(val);
    $('.stackSlider').val(val);

    playSound('slider');

    splitAmount = parseInt(val);

}

function splitStack(inv, item, tslot, finv) {

    var amount = Inventories[finv][item].amount

    $('#' + inv).append('<div class="stackBackground" style="width: 100%; height: 100%; background-color: rgba(0,0,0,0.8); position: absolute; z-index: 6000;"></div>');
    $('#' + inv).find('#clone')
    .append('<div class="stackContainer pulse">'
    +'<input type="range" min="1" max="' + amount + '" value="' + parseInt(amount / 2) + '" oninput="updateSlider(this.value, ' + amount + ')" class="stackSlider">'
    +'<input autofocus id="rangeValue" class="stackText stackTextInput" type="text" onkeydown="splitOnKeyPress(event)" onfocusin="updateFocusInput(true)" onfocusout="updateFocusInput(false)" oninput="updateSlider(this.value, ' + amount + ')" min="1" max="' + amount + '" value="' + parseInt(amount / 2) + '" >'
    // +'<div class="stackText">1</div>'
    +'</input>'
    +'</div>');
    $('.stackSlider').css('background-color', Settings['inventorycolor']);

    if (((tslot % InventoryParms[inv].rows) / InventoryParms[inv].rows) > 0.5) {
        $('.stackContainer').css('left', '-160px');
    } else {
        $('.stackContainer').css('right', '-30px');
    }

    splitAmount = parseInt(amount / 2);
    let newVal = 130 / $('.stackSlider').attr('max') * splitAmount - (130 / $('.stackSlider').attr('max') / splitAmount);
    $('.stackText').css('left', newVal + 'px');
    $('.stackText').text(splitAmount);

}

function changeItemLocation(item, fslot, tslot, finv, tinv) {

    var found = false;


    if (!itemDragging) {
      return;
    }


      if (!canPlace) {

        if (flipped == false && $('#' + item).attr("flipped") == "1" || flipped == true && $('#' + item).attr("flipped") == "0") {
            flipGuide(false);
        }

    }

    if (putItems) {

         $.post('https://core_inventory/putItems', JSON.stringify({
            item: item,
            finv: finv,
            tinv: putInventory,
            type: putType
        }));

         var pos = $('#' + tinv).find('#slot-' + tslot).position();
    var x = pos.left;
    var y = pos.top;

    $('#' + item).css({
        zIndex: 5000,
        left: x,
        top: y
    });


    var occupy = getSlots(fslot, startX, startY, InventoryParms[finv].rows, finv);
    for (let g = 0; g < occupy.length; g++) {

        $("#" + finv).find('#slot-' + occupy[g]).attr('occupied', "1");

    }



        putItems = false;
         return;
    }

    if (shiftClicked && canPlace) {

        if (Inventories[finv][item].amount > 1) {

            var pos = $('#' + tinv).find('#slot-' + tslot).position();
            var x = pos.left;
            var y = pos.top;

            var pos2 = $('#' + finv).find('#slot-' + fslot).position();
            var x2 = pos2.left;
            var y2 = pos2.top;

            $('#' + item).appendTo('#' + finv).css({

                left: x2,
                top: y2
            });

             var occupy = getSlots(fslot, Inventories[finv][item].x, Inventories[finv][item].y, InventoryParms[finv].rows, finv);
    for (let g = 0; g < occupy.length; g++) {

        $("#" + finv).find('#slot-' + occupy[g]).attr('occupied', "1");
    }

            $('#clone').appendTo('#' + tinv).css({
                zIndex: 7000,
                left: x,
                top: y
            });

            splitItem = item;
            splitSlot = tslot;
            splitFinv = finv;
            splitTinv = tinv;

            splitStack(tinv, item, tslot, finv)

        } else {
            $('#clone').remove();
             var pos2 = $('#' + finv).find('#slot-' + fslot).position();
            var x2 = pos2.left;
            var y2 = pos2.top;

        $('#' + item).appendTo('#' + finv).css({

            left: x2,
            top: y2
        });
        }

        return;

    } else if (!canPlace) {
        $('#clone').remove();
       
    }

    if (combineItems) {

       

         $.post('https://core_inventory/combineItems', JSON.stringify({
            fitem: item,
            titem: combineItem,
            finv: finv,
            tinv: combineInventory,
            item: combineReward
        }));

           var pos = $('#' + tinv).find('#slot-' + tslot).position();
            var x = pos.left;
            var y = pos.top;

    $('#' + item).css({
        zIndex: 5000,
        left: x,
        top: y
    });


    var occupy = getSlots(fslot, startX, startY, InventoryParms[finv].rows, finv);
    for (let g = 0; g < occupy.length; g++) {

        $("#" + finv).find('#slot-' + occupy[g]).attr('occupied', "1");

    }

         combineItems = false;

        return;
    }

    if (stackItems) {
        playSound('tik');
        $.post('https://core_inventory/stackItems', JSON.stringify({
            fitem: item,
            titem: stackItem,
            finv: finv,
            tinv: stackInventory
        }));
        $('#' + stackItem).find('#ItemImage').find('#ItemCount').text(Inventories[stackInventory][stackItem].amount + Inventories[finv][item].amount);
        removeItem(item, finv);
        stackItems = false;
        return;
    }


    if ($('#' + item).attr('flipped') == "1" && $("#" + tinv).find("#slot-" + tslot).attr("holder") == "1") {
        flipGuide(false);
    }

    var itemData = Inventories[finv][item];

    var unoccupy = getSlots(fslot, startX, startY, InventoryParms[finv].rows, finv);
    for (let g = 0; g < unoccupy.length; g++) {

        $("#" + finv).find('#slot-' + unoccupy[g]).attr('occupied', "0");

    }

    var occupy = getSlots(tslot, itemData.x, itemData.y, InventoryParms[tinv].rows, tinv);
    for (let g = 0; g < occupy.length; g++) {

        $("#" + tinv).find('#slot-' + occupy[g]).attr('occupied', "1");
    }

    itemData.slot = tslot;

    Inventories[finv][item] = null;
    Inventories[tinv][item] = itemData;

    $('#' + item).appendTo("#" + tinv)

    $('#' + item).attr('inventory', tinv);
    $('#' + item).attr('slot', tslot);

    if ($("#" + finv).find("#slot-" + fslot).attr("holder") == "1") {
        $.post('https://core_inventory/holderData', JSON.stringify({
            holder: $("#" + finv).find("#slot-" + fslot).attr("inventory"),
            data: null
        }));

    }

    if ($("#" + tinv).find("#slot-" + tslot).attr("holder") == "1") {

        $('#' + item).css("width", $("#" + tinv).find("#slot-" + tslot).css('width'));
        $('#' + item).css("height", $("#" + tinv).find("#slot-" + tslot).css('height'));
        $.post('https://core_inventory/holderData', JSON.stringify({
            holder: $("#" + tinv).find("#slot-" + tslot).attr("inventory"),
            data: itemData
        }));
    }

    var pos = $('#' + tinv).find('#slot-' + tslot).position();
    var x = pos.left;
    var y = pos.top;

    $('#' + item).css({
        zIndex: 5000,
        left: x,
        top: y
    });

    //add check if not obstructed

    $.post('https://core_inventory/changeItemLocation', JSON.stringify({
        item: item,
        inventory: tinv,
        slot: tslot,
        fromInv: finv,
        itemData: itemData
    }));

    if (dragDrop) {

        dropItem(item, dragDropInventory);

    }
    if (dragUse) {

        useItem(itemData.name, item);

    }

}

function discoverItem(id, name) {

    if (discovering || itemDragging || !$('#' + id).find('#ItemImage').hasClass( "unknown" ) ) {
        return;
    }

    var base = '<img class="loader" src="loader.svg" class="scale-down-center">';
    $('#' + id).append(base);
    discovering = true;
    setTimeout(() => {

        $('.item').each(function(i, obj) {
            if ( $(this).attr('name') == name ) {
                $(this).find('#ItemImage').removeClass('unknown');
               
            }
        });
        


        $('#' + id).find('.loader').fadeOut();
        Settings['discovered'][name] = true;
        discovering = false;
    }, 1000);
    
}

function giveItem(id) {

     $.post('https://core_inventory/giveItem', JSON.stringify({
        item: id
    }));



}

function dropItem(id, inventory) {

    $.post('https://core_inventory/dropItem', JSON.stringify({
        item: id,
        inventory: inventory || null
    }));

}

function useItem(name, exact) {

    if (config.CloseAfterUse.includes(name)) {
        closeMenu();
    }

    $.post('https://core_inventory/useItem', JSON.stringify({
        item: name,
        exact: exact
    }));

}

function dropdownMenu(el) {

    if ($('.dropdown').length) {
        $('.dropdown').remove();
    }

    if (attachmentsOpened) {
        return;
    }

  

    $(el).parent().appendTo('#' + $(el).parent().attr('inventory'))

    var base = '<div class="dropdown">';


      if ( $(el).hasClass('unknown') ) {
        base = base + '<div class="dropdown-option shadow-pop-br" onclick="discoverItem(\'' + $(el).parent().attr('id') + '\', \'' + $(el).parent().attr('name') + '\')">' + getText('discover') + '</div>';
    } else {



    if ($(el).parent().attr('inventory') == 'content-' + cid) {
        base = base + '<div class="dropdown-option shadow-pop-br" onclick="useItem(\'' + $(el).parent().attr('name') + '\', \'' + $(el).parent().attr('id') + '\')">' + getText('use') + '</div>';
    }

    if ($(el).parent().attr('inventory') == 'content-' + cid) {
        base = base + '<div class="dropdown-option shadow-pop-br" onclick="giveItem( \'' + $(el).parent().attr('id') + '\')">' + getText('give') + '</div>';
    }
    if ($(el).parent().attr('inventory') == 'content-' + cid && $(el).parent().attr('category') == 'weapons') {
        base = base + '<div class="dropdown-option shadow-pop-br" onclick="openAttachemnts(\'' + $(el).parent().attr('id') + '\')">' + getText('attachments') + '</div>';
    }

    
        base = base + '<div class="dropdown-option shadow-pop-br" onclick="dropItem(\'' + $(el).parent().attr('id') + '\', \'' + $(el).parent().attr('inventory') + '\')">' + getText('drop') + '</div>';
    
    if ($(el).parent().hasClass('item')) {
        base = base + '<div class="dropdown-option shadow-pop-br" onclick="openInformation(\'' + $(el).parent().attr('name') + '\', \'' + $(el).parent().attr('id') + '\')">' + getText('info') + '</div>';
    }
    if ($(el).parent().attr('inventory') == 'content-' + cid) {
        base = base + '<div class="dropdown-option shadow-pop-br" onclick="setKeybind(\'' + $(el).parent().attr('id') + '\')">' + getText('keybind') + '</div>';
    }

}

    base = base + '</div>';

    $(el).parent().append(base);

    $('.dropdown').css('margin-top', $(el).parent().css('height'));

    $('.dropdown-option').hover(function() {

        playSound('hover');

    });

}

$(document).click(function() {

    if ($('.dropdown').length) {
        $('.dropdown').remove();

    }

});

$(document).on("contextmenu", ".item", function(e) {
    dropdownMenu(e.target);
    return false;
});

function popupInventory(item, data) {

    if (config.Inventories[data.name] != null && !$('#' + item).find('#ItemImage').hasClass( "unknown" ) ) {
        playSound('openbag');
        $.post('https://core_inventory/openPopupInventory', JSON.stringify({
            inventory: 'inv-' + item,
            type: data.name
        }));
    }

}

function removeItem(item, inv) {

    var itemData = Inventories[inv][item];

    if (!itemData) {
        return;
    }

    if (item == itemDragging) {
      itemDragging = null;
      
    }

    var ItemSlots2 = getSlots(itemData.slot, itemData.x, itemData.y, InventoryParms[inv].rows, inv);

    for (let g = 0; g < ItemSlots2.length; g++) {

        $("#" + inv).find('#slot-' + ItemSlots2[g]).attr('occupied', "0");

    }

    $("#" + item).remove();

}

function addItem(item, inv) {

    var itemData = Inventories[inv][item];

    if (!config.ItemCategories[itemData.category]) {
        console.log('[Core Inventory] Category ' + itemData.category + ' does not exist!');
        return;
    }

    var slot = $("#" + inv).find('#slot-' + itemData.slot);

    // if slot does not exist it will find suitable one
    if (slot.attr('id') == null) {

        console.log('[Core Inventory] Asigned slot not found! (Should not happen) ');

        return;

    }

    if (!itemData.flipped) {
        Inventories[inv][item].flipped = 0;
    }
   

    if (config.EnableDiscovery && !Settings['discovered'][itemData.name]) {
  
    $('#' + inv).append('<div class="item" flipped="' + itemData.flipped + '" slot="' + itemData.slot + '" x="' + itemData.x + '" y="' + itemData.y + '" name="' + itemData.name + '" category="' + itemData.category + '" inventory="' + inv + '" id="' + item + '"><div id="ItemImage" ondblclick="discoverItem(\''+item+'\', \''+itemData.name+'\')" class="unknown"></div></div>');
    
    } else {
    $('#' + inv).append('<div class="item" flipped="' + itemData.flipped + '" slot="' + itemData.slot + '" x="' + itemData.x + '" y="' + itemData.y + '" name="' + itemData.name + '" category="' + itemData.category + '" inventory="' + inv + '" id="' + item + '"><div id="ItemImage"></div></div>');
    }


    if (config.ShowItemName) {
        $('#' + item).find('#ItemImage').append('<div id="ItemName">' + qbitems[itemData.name].label.toUpperCase() + '</div>');
    }
    if (config.ShowItemCount && itemData.amount) {
        $('#' + item).find('#ItemImage').append('<div id="ItemCount">' + itemData.amount + '</div>');
    }
    if (config.ShowItemAmmunition && itemData.metadata.ammo != null) {
        $('#' + item).find('#ItemImage').append('<div id="ItemAmmo">' + itemData.metadata.ammo + '</div>');
    }

    $('#' + item).dblclick(function() {

        popupInventory(item, itemData);
    });

    if (itemData.metadata.durability != null) {

        $('#' + item).append('<div class="durability" style="width: ' + itemData.metadata.durability + '%; background-color: ' + Settings['durabilitycolor'] + ' "></div>');

    }

    var ItemSlots2 = getSlots(itemData.slot, itemData.x, itemData.y, InventoryParms[inv].rows, inv);

    for (let g = 0; g < ItemSlots2.length; g++) {
        $("#" + inv).find('#slot-' + ItemSlots2[g]).attr('occupied', "1");

    }

  

         $('#' + item).find('#ItemImage').css({
        background: " url(img/" + (itemData.metadata.image || itemData.name) + ".png) no-repeat center center",
        "background-size": "contain"
        });

    
   

    if (itemData.flipped == 1) {

        $('#' + item).find('#ItemImage').css({

            transform: 'rotate(90deg) translateY(-100%)',
            height: itemData.x * 47 + 'px',
            width: itemData.y * 47 + 'px',

        });
    }

    var color = config.ItemCategories[itemData.category].color

    if (slot.attr('holder') == "1") {
        $('#' + item).css({
            zIndex: 5000,
            left: slot.position().left,
            top: slot.position().top,
            height: slot.css('height'),
            width: slot.css('width'),
            "border-color": color,
            "background": "rgba(" + hexToRgb(color).r + "," + hexToRgb(color).g + "," + hexToRgb(color).b + ", 0.1)"

        });
        $.post('https://core_inventory/holderData', JSON.stringify({
            holder: slot.attr("inventory"),
            data: itemData
        }));
    } else {
        $('#' + item).css({
            zIndex: 5000,
            left: slot.position().left,
            top: slot.position().top,
            height: (47 * itemData.y) + "px",
            width: (47 * itemData.x) + "px",
            "border-color": color,
            "background": "rgba(" + hexToRgb(color).r + "," + hexToRgb(color).g + "," + hexToRgb(color).b + ", 0.1)"

        });

    }

    $('#' + item).draggable({
        start: function(e, ui) {

            if (ctrlClicked) {
                e.preventDefault();
                return;
            }

            playSound(config.ItemCategories[itemData.category].takeSound);

            closeInformation();
            itemDragging = item;

            if ($('.dropdown').length) {
                $('.dropdown').fadeOut(50);

            }

            startInv = $(this).attr("inventory");
            startSlot = parseInt($(this).attr("slot"));
            x = parseInt($(this).attr("x"));
            y = parseInt($(this).attr("y"));

            if (shiftClicked && Inventories[startInv][item].amount) {
                $(this).clone().appendTo("#" + startInv).attr('id', 'clone').attr('name', 'clone');

            } else {
                var unoccupy = getSlots(startSlot, x, y, InventoryParms[startInv].rows, startInv);

               for (let g = 0; g < unoccupy.length; g++) {
                $("#" + startInv).find('#slot-' + unoccupy[g]).attr('occupied', "0");
                }
            }

            if ($(this).attr("flipped") == "1") {

                flipped = true

            } else {
                flipped = false
            }

            startX = x;
            startY = y;

            $('#' + item).css({

                height: (47 * startY) + "px",
                width: (47 * startX) + "px",

            });

            idx = x;
            idy = y;

            $(this).parent().parent().appendTo('#main_container');


        },
        stop: function(e, ui) {
            playSound(config.ItemCategories[itemData.category].putSound);
            $('.slot').css('background-color', Settings['slotcolor']);
            $('.slot').css('outline-color', Settings['slotborder']);

            changeItemLocation(item, startSlot, lastSlot, startInv, lastInv);
            itemDragging = null;

            clearTimeout(dragTimeout);
            $('.gradientLeft').css('background', 'linear-gradient(90deg, rgba(255,255,255,0.1031547619047619) 0%, rgba(255,255,255,0) 100%)');
            $('.gradientRight').css('background', 'linear-gradient(-90deg, rgba(255,255,255,0.1031547619047619) 0%, rgba(255,255,255,0) 100%)');
            $('.dragElement').remove();
            dragDrop = false;

        },
        drag: function() {

            var pos = $(this).offset();
            var x = pos.left;
            var y = pos.top;

            guideEngine(this, x + (47 / 2), y + (47 / 2));

            if (shiftClicked) {
                startInv = $(this).attr("inventory");
                if ($("#"+startInv).find('#clone').length <= 0) {
                    changeItemLocation(item, startSlot, startSlot, startInv, lastInv, true);
                    $(this).clone().appendTo("#" + startInv).attr('id', 'clone').attr('name', 'clone');
                }
            }
        }
    });

}

function closeAttachments() {

    $.post('https://core_inventory/closeAttachments', JSON.stringify({}));

    $('#suppressor').parent().remove();
    $('#flashlight').parent().remove();
    $('#grip').parent().remove();
    $('#scope').parent().remove();
    $('#finish').parent().remove();
    $('#clip').parent().remove();

    Inventories['suppressor'] = null;
    Inventories['flashlight'] = null;
    Inventories['grip'] = null;
    Inventories['scope'] = null;
    Inventories['finish'] = null;
    Inventories['clip'] = null;

    InventoryParms['suppressor'] = null;
    InventoryParms['flashlight'] = null;
    InventoryParms['grip'] = null;
    InventoryParms['scope'] = null;
    InventoryParms['finish'] = null;
    InventoryParms['clip'] = null;

    var canvas = document.querySelector('#canvas');
    var context = canvas.getContext('2d');
    context.clearRect(0, 0, canvas.width, canvas.height);

    for (const [key, value] of Object.entries(InventoryParms)) {
        if (value != null) {
            if (!value.hidden) {

                $('#' + key).parent().show();
            }
        }

    }

    $('#content-' + cid).parent().animate({
        top: attachmentContentPos.top + 'px',
        left: attachmentContentPos.left + 'px'
    }, 500, function() {
        InventoryParms['content-' + cid].x = attachmentContentPos.left;
        InventoryParms['content-' + cid].y = attachmentContentPos.top;

    });
    attachmentsOpened = false;
}

function openAttachemnts(weapon) {

    attachmentsOpened = true;
    attachmentContentPos = $('#content-' + cid).parent().offset();

    for (const [key, value] of Object.entries(InventoryParms)) {
        $('#' + key).parent().hide();
    }

    $.post('https://core_inventory/setupAttachments', JSON.stringify({
        data: Inventories['content-' + cid][weapon],
        weapon: weapon
    }));
    playSound('open_bass');
}

function attachmentContent(data, field) {


    if (data.metadata.attachments[field]) {
        return {
            [data.metadata.attachments[field].id]: data.metadata.attachments[field]
        };
    } else {
        return {};
    }

}

function setupAttachments(data, suppressor, flashlight, grip, scope, finish, clip) {

    if (suppressor) {

        createHolder('suppressor', 4, 2, attachmentContent(data, 'suppressor'), getText('suppressor'), suppressor['x'] + '%', suppressor['y'] + '%', 'component_suppressor', false, 'attachments')

    }
    if (flashlight) {

        createHolder('flashlight', 4, 2, attachmentContent(data, 'flashlight'), getText('flashlight'), flashlight['x'] + '%', flashlight['y'] + '%', 'component_flashlight', false, 'attachments')
    }
    if (grip) {

        createHolder('grip', 4, 2, attachmentContent(data, 'grip'), getText('grip'), grip['x'] + '%', grip['y'] + '%', 'component_grip', false, 'attachments')
    }
    if (scope) {

        createHolder('scope', 4, 2, attachmentContent(data, 'scope'), getText('scope'), scope['x'] + '%', scope['y'] + '%', 'component_scope', false, 'attachments')
    }
    if (finish) {

        createHolder('finish', 4, 2, attachmentContent(data, 'finish'), getText('finish'), finish['x'] + '%', finish['y'] + '%', 'component_finish', false, 'attachments')
    }
    if (clip) {

        createHolder('clip', 4, 2, attachmentContent(data, 'clip'), getText('clip'), clip['x'] + '%', clip['y'] + '%', 'component_clip', false, 'attachments')
    }

}

function rand(max) {
    return Math.floor(Math.random() * max);
}

function drawLine(context, x1, y1, x2, y2) {

    context.beginPath();
    context.moveTo(x1, y1);
    context.lineTo(x2, y2);
    context.strokeStyle = '#ffff';
    context.stroke();
}

function drawAttachmentLines(suppressor, flashlight, grip, scope, finish, clip) {

    var canvas = document.querySelector('#canvas');
    var context = canvas.getContext('2d');

    canvas.width = $(window).width(); //document.width is obsolete
    canvas.height = $(window).height(); //document.height is obsolete

    context.clearRect(0, 0, canvas.width, canvas.height);

    if (suppressor) {
        let start = $('#suppressor').offset();
        drawLine(context, start.left + 42, start.top + 42, (suppressor['x'] * document.body.clientWidth), (suppressor['y'] * document.body.clientHeight))
    }
    if (flashlight) {
        let start = $('#flashlight').offset();
        drawLine(context, start.left + 42, start.top + 42, (flashlight['x'] * document.body.clientWidth), (flashlight['y'] * document.body.clientHeight))
    }
    if (grip) {
        let start = $('#grip').offset();
        drawLine(context, start.left + 42, start.top + 42, (grip['x'] * document.body.clientWidth), (grip['y'] * document.body.clientHeight))
    }
    if (scope) {
        let start = $('#scope').offset();
        drawLine(context, start.left + 42, start.top + 42, (scope['x'] * document.body.clientWidth), (scope['y'] * document.body.clientHeight))
    }
    if (finish) {
        let start = $('#finish').offset();
        drawLine(context, start.left + 42, start.top + 42, (finish['x'] * document.body.clientWidth), (finish['y'] * document.body.clientHeight))
    }
    if (clip) {
        let start = $('#clip').offset();
        drawLine(context, start.left + 42, start.top + 42, (clip['x'] * document.body.clientWidth), (clip['y'] * document.body.clientHeight))
    }

}

function prepareChangeLocaton(item, fslot, tslot, finv, tinv) {

    startInv = finv;
    startSlot = fslot
    x = parseInt($('#' + item).attr("x"));
    y = parseInt($('#' + item).attr("y"));

    if ($('#' + item).attr("flipped") == "1") {

        flipped = true

    } else {
        flipped = false
    }

    startX = x;
    startY = y;

    $('#' + item).css({

        height: (47 * startY) + "px",
        width: (47 * startX) + "px",

    });

    idx = x;
    idy = y;
    itemDragging = item;

    $('#' + item).parent().parent().appendTo('#main_container');

    var unoccupy = getSlots(startSlot, x, y, InventoryParms[startInv].rows, startInv);

    for (let g = 0; g < unoccupy.length; g++) {
        $("#" + startInv).find('#slot-' + unoccupy[g]).attr('occupied', "0");
    }

    changeItemLocation(item, fslot, tslot, finv, tinv)
    itemDragging = null;

}

function ctrlClick(item) {

    var inventory = item.attr('inventory');
    var id = item.attr('id');
    var slot = item.attr('slot');
    var x = item.attr('x');
    var y = item.attr('y');
    var category = item.attr('category');



    if (inventory == 'content-' + cid) {

        //CATEGORY MATCH
        for (const [key, value] of Object.entries(InventoryParms)) {
          
            if (value.restrictedTo != null) {

                if (value.restrictedTo.includes(category) && !value.hidden) {

                    if ($('#' + key).find('#slot-' + 1).attr('occupied') == "0" && $('#' + key).find('#slot-' + 1).attr('holder') == "1") {

                        playSound(config.ItemCategories[category].putSound);
                        prepareChangeLocaton(id, parseInt(slot), 1, inventory, key)
                        return
                    }

                }

            }

        }

        if (InventoryParms[recentInventory] != null) {

            if (!InventoryParms[recentInventory].hidden && $('#' + recentInventory).find('#slot-' + 1).attr('holder') == "0" ) {

                if (recentInventory == 'inv-' + id) {
                    return;
                }

                if (InventoryParms[recentInventory].restrictedTo) {
                           if (!InventoryParms[recentInventory].restrictedTo.includes(category)) {
                                return;
                           }
                }
             

                var newSlot = findAvailableSpot(recentInventory, parseInt(x), parseInt(y));

                if (newSlot == null) {
                    console.log('[Core Inventory] Ctrl click No slot found!');
                } else {

                    playSound(config.ItemCategories[category].putSound);
                    prepareChangeLocaton(id, parseInt(slot), newSlot, inventory, recentInventory)
                    return
                }
            }

        }

    } else if (!InventoryParms['content-' + cid].hidden) {

        var newSlot = findAvailableSpot('content-' + cid, parseInt(x), parseInt(y));

        if (newSlot == null) {
            console.log('Not enough space');
        } else {

            playSound(config.ItemCategories[category].putSound);
            prepareChangeLocaton(id, parseInt(slot), newSlot, inventory, 'content-' + cid)
            return
        }

    }

}

function flipGuide(guide) {

    if (itemDragging != null) {

        var save = idx;

        idx = idy;
        idy = save;

        $('#' + itemDragging).attr("x", idx);
        $('#' + itemDragging).attr("y", idy);

        Inventories[startInv][itemDragging].x = idx;
        Inventories[startInv][itemDragging].y = idy;

        $('#' + itemDragging).css({
            zIndex: 5000,

            height: $('#' + itemDragging).css("width"),
            width: $('#' + itemDragging).css("height")

        });

        if ($('#' + itemDragging).attr("flipped") == "0") {
            $('#' + itemDragging).attr("flipped", "1");
            Inventories[startInv][itemDragging].flipped = 1;
            $('#' + itemDragging).find('#ItemImage').css({

                transform: 'rotate(90deg) translateY(-100%)',
                height: idx * 47 + 'px',
                width: idy * 47 + 'px',

            });
        } else {
            $('#' + itemDragging).attr("flipped", "0");
            Inventories[startInv][itemDragging].flipped = 0;
            $('#' + itemDragging).find('#ItemImage').css({

                transform: 'rotate(0deg)',
                height: idy * 47 + 'px',
                width: idx * 47 + 'px',

            });
        }

        if (guide) {
            var dom = $('#' + itemDragging)[0];
            var position = $(dom).offset();
            var x = position.left;
            var y = position.top;

            guideEngine(dom, x + (47 / 2), y + (47 / 2))
        }

    }

}



//KEY CLICKED
$(document).keyup(function(e) {
    if (e.keyCode === 27 || (e.keyCode === 9 && tabDown)) {

        if (attachmentsOpened) {
            closeAttachments();
        } else {
            closeMenu();
        }

        tabDown = false;

    }
    if (e.keyCode === 82) {

        flipGuide(true);

    }
    if (e.keyCode === 86) {

        overlayCheck();

    }
    if (e.keyCode == 17) {
        ctrlClicked = false;
    }
    if (e.keyCode == 16) {
        shiftClicked = false;
        if (splitAmount && inStackFocus == false) {
            playSound('tik');
            $('.stackBackground').remove();
            $('.stackContainer').remove();
            $('#clone').remove();
            if (splitAmount >= 1){
                $.post('https://core_inventory/splitItems', JSON.stringify({
                    fitem: splitItem,
                    tslot: splitSlot,
                    finv: splitFinv,
                    tinv: splitTinv,
                    stack: splitAmount
                }));
            }
            splitAmount = null;
            splitItem = null;
            splitSlot = null;
            splitFinv = null;
            splitTinv = null;
        }
    }
    if (e.keyCode == 13) {
        if (splitAmount && inStackFocus == false) {
            playSound('tik');
            $('.stackBackground').remove();
            $('.stackContainer').remove();
            $('#clone').remove();
            if (splitAmount >= 1){
                $.post('https://core_inventory/splitItems', JSON.stringify({
                    fitem: splitItem,
                    tslot: splitSlot,
                    finv: splitFinv,
                    tinv: splitTinv,
                    stack: splitAmount
                }));
            }
            splitAmount = null;
            splitItem = null;
            splitSlot = null;
            splitFinv = null;
            splitTinv = null;
        }
    }

})
.on('keydown',function(e) {
    if (e.keyCode == 9) {
        tabDown = true;
    }
    if (e.keyCode == 17) {
        ctrlClicked = true;
    }
    if (e.keyCode == 16) {
        if (tryShifted) {
            return;   
        } 
        
        tryShifted = true;
        currentTimeout = setTimeout(() => {
            if (tryShifted) {
                shiftClicked = true;
            } else {
                shiftClicked = false;
            }
        }, 250)
    }
})
.on('keyup', function (e) {
    if (e.keyCode == 16) {
        tryShifted = false;
        if (currentTimeout != null && currentTimeout != undefined) {
        clearTimeout(currentTimeout);
    }
}
});

function closeMenu() {
    $.post('https://core_inventory/close', JSON.stringify({
        data: InventoryParms,
        settings: Settings
    }));

    Inventories = {};
    InventoryParms = {};

     if (lootingPlayer != null) {
        lootingPlayer.pause();
        lootingPlayer.currentTime = 0;
    }

    $('#main_container').fadeOut();
    timeout = setTimeout(function() {
        $("#main_container").html("");
        inventoryOpened = false;

    }, 400);

}

//DRAGGING
document.addEventListener('mousedown', e => {

    if (!$(e.target).hasClass('ui-draggable-handle')) {
        dragX = e.pageX;
        dragY = e.pageY;
        $.post('https://core_inventory/registerMouse', JSON.stringify({}));
        dragging = true
    }
});
document.addEventListener('mouseup', () => dragging = false);
document.addEventListener('mousemove', e => {

    if (dragging && !itemDragging) {
        var x = dragX - e.pageX;
        var y = dragY - e.pageY;

        $.post('https://core_inventory/mouseMovement', JSON.stringify({
            x: x,
            y: y
        }));
    }

});

function playClickSound() {
    var audio = document.getElementById("clickaudio");
    audio.volume = 0.05;
    audio.play();
}

window.addEventListener('message', function(event) {

    var edata = event.data;

    if (edata.type == 'addItem') {

        addItem(edata.item, edata.inventory)

    }
    if (edata.type == 'removeItem') {

        removeItem(edata.item, edata.inventory)

    }

    if (edata.type == 'openBase') {

        cid = edata.cid;
        config = edata.config;
        Admin = edata.admin;
        qbitems = edata.qbitems;
        if (edata.settings != null) {
            Settings = edata.settings;

            if (Settings.discovered === undefined ) { 
                Settings.discovered = {};
            } else if (Settings.discovered.length == 0) {
                Settings.discovered = {};
            }
        }
        $('#main_container').fadeIn();
        openInventory();

    }

    if (edata.type == 'Sync') {

        var newData = edata.data.content;

        if (Inventories[edata.inventory] == null) {
            return;
        }

        // REMOVE FROM INVENTORY ITEM THAT ARENT ANYMORE THERE
        for (const [key, value] of Object.entries(Inventories[edata.inventory])) {

            if (!newData[key] && $('#' + key).attr("inventory") == edata.inventory) {

                removeItem(key, edata.inventory);

            }
        }

        //ADD REMOVE ITEMS IF THEY ARE HERE
        for (const [key, value] of Object.entries(newData)) {

            if ($('#' + key).length) {

                if (parseInt($('#' + key).attr("slot")) != parseInt(value.slot)) {

                    removeItem(key, edata.inventory);
                    Inventories[edata.inventory][key] = newData[key]

                    addItem(key, edata.inventory);

                } else {
                    Inventories[edata.inventory][key] = newData[key]

                    //STACKING
                    if (value.amount) {
                        if (parseInt($('#' + key).find('#ItemImage').find('#ItemCount').text()) != parseInt(value.amount)) {
                            $('#' + key).find('#ItemImage').find('#ItemCount').text(value.amount);
                        }
                    }

                }

            } else {
                Inventories[edata.inventory][key] = newData[key]

                addItem(key, edata.inventory);

            }

        }

    }
    if (edata.type == 'setupAttachments') {

        setupAttachments(edata.data, edata.suppressor, edata.flashlight, edata.grip, edata.scope, edata.finish, edata.clip);

    }

    if (edata.type == 'attachmentLine') {
        drawAttachmentLines(edata.suppressor, edata.flashlight, edata.grip, edata.scope, edata.finish, edata.clip)
    }

    if (edata.type == 'openHolder') {
        createHolder(edata.name, edata.slots, edata.rows, edata.content, edata.label, edata.locationX, edata.locationY, edata.restrictedTo, edata.hidden, edata.invType);
    }

    if (edata.type == 'openInventory') {

        createInventory(edata.name, edata.slots, edata.rows, edata.content, edata.label, edata.locationX, edata.locationY, edata.hidden, edata.invType, edata.restrictedTo);

    }
    if (edata.type == 'playSound') {
        playSound(edata.sound)

    }
    if (edata.type == 'weaponUI') {
        openWeaponUI(edata.show, edata.data, edata.ammo, edata.maxammo, edata.percent);

    }

});