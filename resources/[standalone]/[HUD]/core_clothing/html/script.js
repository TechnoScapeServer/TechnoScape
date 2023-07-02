var config
var store
var audioPlayer

var basketValue = 0
var basket = {}

var clothes = null;
var Clothing = {}

var animationPlaying = false;
var currentCategory = '';
var previousCategory = '';

var editing = null;
var editingEnabled = false;
var editingAvailable = false
var UsingCoreInventory = false
var CoreClothingItems = {};
var gender = ''
const clothesArray = {
    ['ID'] : {
        1: "mask",
        4: "pants",
        5: "bag",
        6: "shoes",
        7: "accessory",
        8: "t-shirt",
        9: "vest",
        11: "torso2"
    },
    ['PropID'] : {
        1: "glass",
        0: "hat",
        2: "ear",
        6: "watch",
        7: "bracelet"
    },
}
var woman = false;
var men = false;

function playSound(file) {
    if (audioPlayer != null) {
        audioPlayer.pause();
    }

    audioPlayer = new Audio("../sounds/" + file + ".mp3");
    audioPlayer.volume = 0.15;

    var didPlayPromise = audioPlayer.play();

    if (didPlayPromise === undefined) {
        audioPlayer = null;
    } else {
        didPlayPromise.then(_ => {}).catch(error => {
            audioPlayer = null;
        })
    }
}


function playClickSound() {
    var audio = document.getElementById("clickaudio");
    audio.volume = 0.1;
    audio.play();
}

function removeFromCart(t, item) {

    var storeItem = Clothing[item]
    if (basket[item] == 0 || basketValue == 0) {

        return;
    }

    $(t).attr('onclick', '');

    basket[item] -= 1;
    basketValue -= storeItem.price;

    $(t).fadeOut();
    setTimeout(() => {
        $(t).remove();
    }, 500)

    $('.clothes-text06').text(basketValue + '$');
    $('.clothes-text15').text(basketValue + '$');

}

function addToCart(item) {


    var storeItem = Clothing[item]

    if (editingEnabled) {

        editing = item;
        openEditing(Clothing[item].gender);
        $('#label').val(storeItem.label);
        $('#price').val(storeItem.price);
        $('#item').val(storeItem.item);
        $('#image').val(storeItem.image);



        return;
    }

    if (clothes.includes(item)) {
        storeItem.price = 0;
    }

    if (!basket[item]) {
        basket[item] = 1;
    } else {
        basket[item] += 1;
    }

    basketValue += storeItem.price;
    $('.clothes-text06').text(basketValue + '$');
    $('.clothes-text15').text(basketValue + '$');


    if ($('.clothes-checkoutcontainer').length) {

        var base = '        <div class="clothes-entry2" style="background-color: ' + config.Stores[store].Button + '" onclick="removeFromCart(this, \'' + item + '\')">' +
            '          <div class="clothes-iconcontainer2">' +
            '            <svg viewBox="0 0 791.4057142857142 1024" class="clothes-icon14">' +
            '              <path' +
            '                d="M585.143 18.286c0-10.286 8-18.286 18.286-18.286h164.571c20 0 36.571 16.571 36.571 36.571v164.571c0 10.286-8 18.286-18.286 18.286h-36.571c-10.286 0-18.286-8-18.286-18.286v-76.571l-145.143 145.714c44.571 56 72 127.429 72 205.143 0 169.143-128 308.571-292.571 326.857v75.429h54.857c10.286 0 18.286 8 18.286 18.286v36.571c0 10.286-8 18.286-18.286 18.286h-54.857v54.857c0 10.286-8 18.286-18.286 18.286h-36.571c-10.286 0-18.286-8-18.286-18.286v-54.857h-54.857c-10.286 0-18.286-8-18.286-18.286v-36.571c0-10.286 8-18.286 18.286-18.286h54.857v-75.429c-172.571-18.857-305.714-172.571-291.429-353.143 12-155.429 135.429-282.857 289.714-300.571 92.571-10.857 178.286 17.714 243.429 69.714l145.714-145.143h-76.571c-10.286 0-18.286-8-18.286-18.286v-36.571zM329.143 731.429c141.143 0 256-114.857 256-256s-114.857-256-256-256-256 114.857-256 256 114.857 256 256 256z"' +
            '              ></path>' +
            '            </svg>' +
            '          </div>' +
            '          <span class="clothes-text10">' + storeItem.label + '</span>' +
            '          <div class="clothes-pricecontainer2">' +
            '            <span class="clothes-price2">' +
            '              <span class="clothes-text11">$</span>' +
            '              <span class="clothes-text12">' + storeItem.price + '</span>' +
            '            </span>' +
            '          </div>' +
            '          <div class="clothes-remove">' +
            '            <span class="clothes-text13">REMOVE</span>' +
            '          </div>' +
            '        </div>';

        $('.clothes-entrylist1').append(base);

    }

}


function openCheckout() {

    if (animationPlaying) {
        return;
    }

    if ($('.clothes-checkoutcontainer').length) {
        $('.clothes-checkoutcontainer').removeClass('slide-right');
        $('.clothes-checkoutcontainer').addClass('slide-back');
        animationPlaying = true;
        setTimeout(() => {
            $('.clothes-checkoutcontainer').remove();
            animationPlaying = false;
        }, 500)
        return;
    }

    playClickSound();

    var base = '<div class="clothes-checkoutcontainer slide-right">' +
        '      <span class="clothes-text09">BASKET</span>' +
        '      <svg viewBox="0 0 1170.2857142857142 1024" class="clothes-icon12">' +
        '        <path' +
        '          d="M1097.143 438.857c40.571 0 73.143 32.571 73.143 73.143s-32.571 73.143-73.143 73.143h-8.571l-65.714 378.286c-6.286 34.857-36.571 60.571-72 60.571h-731.429c-35.429 0-65.714-25.714-72-60.571l-65.714-378.286h-8.571c-40.571 0-73.143-32.571-73.143-73.143s32.571-73.143 73.143-73.143h1024zM277.143 896c20-1.714 35.429-19.429 33.714-39.429l-18.286-237.714c-1.714-20-19.429-35.429-39.429-33.714s-35.429 19.429-33.714 39.429l18.286 237.714c1.714 18.857 17.714 33.714 36.571 33.714h2.857zM512 859.429v-237.714c0-20-16.571-36.571-36.571-36.571s-36.571 16.571-36.571 36.571v237.714c0 20 16.571 36.571 36.571 36.571s36.571-16.571 36.571-36.571zM731.429 859.429v-237.714c0-20-16.571-36.571-36.571-36.571s-36.571 16.571-36.571 36.571v237.714c0 20 16.571 36.571 36.571 36.571s36.571-16.571 36.571-36.571zM932.571 862.286l18.286-237.714c1.714-20-13.714-37.714-33.714-39.429s-37.714 13.714-39.429 33.714l-18.286 237.714c-1.714 20 13.714 37.714 33.714 39.429h2.857c18.857 0 34.857-14.857 36.571-33.714zM272 166.857l-53.143 235.429h-75.429l57.714-252c14.857-66.857 73.714-113.714 142.286-113.714h95.429c0-20 16.571-36.571 36.571-36.571h219.429c20 0 36.571 16.571 36.571 36.571h95.429c68.571 0 127.429 46.857 142.286 113.714l57.714 252h-75.429l-53.143-235.429c-8-33.714-37.143-57.143-71.429-57.143h-95.429c0 20-16.571 36.571-36.571 36.571h-219.429c-20 0-36.571-16.571-36.571-36.571h-95.429c-34.286 0-63.429 23.429-71.429 57.143z"' +
        '        ></path>' +
        '      </svg>' +
        '      <div class="clothes-entrylist1">';

    for (const [key, value] of Object.entries(basket)) {

        var storeItem = Clothing[key]

        for (let i = 0; i < value; i++) {

            base = base + '        <div class="clothes-entry2" style="background-color: ' + config.Stores[store].Button + '" onclick="removeFromCart(this,\'' + key + '\')">' +
                '          <div class="clothes-iconcontainer2">' +
                '            <svg viewBox="0 0 791.4057142857142 1024" class="clothes-icon14">' +
                '              <path' +
                '                d="M585.143 18.286c0-10.286 8-18.286 18.286-18.286h164.571c20 0 36.571 16.571 36.571 36.571v164.571c0 10.286-8 18.286-18.286 18.286h-36.571c-10.286 0-18.286-8-18.286-18.286v-76.571l-145.143 145.714c44.571 56 72 127.429 72 205.143 0 169.143-128 308.571-292.571 326.857v75.429h54.857c10.286 0 18.286 8 18.286 18.286v36.571c0 10.286-8 18.286-18.286 18.286h-54.857v54.857c0 10.286-8 18.286-18.286 18.286h-36.571c-10.286 0-18.286-8-18.286-18.286v-54.857h-54.857c-10.286 0-18.286-8-18.286-18.286v-36.571c0-10.286 8-18.286 18.286-18.286h54.857v-75.429c-172.571-18.857-305.714-172.571-291.429-353.143 12-155.429 135.429-282.857 289.714-300.571 92.571-10.857 178.286 17.714 243.429 69.714l145.714-145.143h-76.571c-10.286 0-18.286-8-18.286-18.286v-36.571zM329.143 731.429c141.143 0 256-114.857 256-256s-114.857-256-256-256-256 114.857-256 256 114.857 256 256 256z"' +
                '              ></path>' +
                '            </svg>' +
                '          </div>' +
                '          <span class="clothes-text10">' + storeItem.label + '</span>' +
                '          <div class="clothes-pricecontainer2">' +
                '            <span class="clothes-price2">' +
                '              <span class="clothes-text11">$</span>' +
                '              <span class="clothes-text12">' + storeItem.price + '</span>' +
                '            </span>' +
                '          </div>' +
                '          <div class="clothes-remove">' +
                '            <span class="clothes-text13">REMOVE</span>' +
                '          </div>' +
                '        </div>';
        }
    }

    base = base + '      </div>' +
        '      <div class="clothes-container3">' +
        '        <div class="clothes-container4" style="background-color: ' + config.Stores[store].Checkout + '" onclick="checkout()">' +
        '          <svg viewBox="0 0 1170.2857142857142 1024" class="clothes-icon16">' +
        '            <path' +
        '              d="M1097.143 438.857c40.571 0 73.143 32.571 73.143 73.143s-32.571 73.143-73.143 73.143h-8.571l-65.714 378.286c-6.286 34.857-36.571 60.571-72 60.571h-731.429c-35.429 0-65.714-25.714-72-60.571l-65.714-378.286h-8.571c-40.571 0-73.143-32.571-73.143-73.143s32.571-73.143 73.143-73.143h1024zM277.143 896c20-1.714 35.429-19.429 33.714-39.429l-18.286-237.714c-1.714-20-19.429-35.429-39.429-33.714s-35.429 19.429-33.714 39.429l18.286 237.714c1.714 18.857 17.714 33.714 36.571 33.714h2.857zM512 859.429v-237.714c0-20-16.571-36.571-36.571-36.571s-36.571 16.571-36.571 36.571v237.714c0 20 16.571 36.571 36.571 36.571s36.571-16.571 36.571-36.571zM731.429 859.429v-237.714c0-20-16.571-36.571-36.571-36.571s-36.571 16.571-36.571 36.571v237.714c0 20 16.571 36.571 36.571 36.571s36.571-16.571 36.571-36.571zM932.571 862.286l18.286-237.714c1.714-20-13.714-37.714-33.714-39.429s-37.714 13.714-39.429 33.714l-18.286 237.714c-1.714 20 13.714 37.714 33.714 39.429h2.857c18.857 0 34.857-14.857 36.571-33.714zM272 166.857l-53.143 235.429h-75.429l57.714-252c14.857-66.857 73.714-113.714 142.286-113.714h95.429c0-20 16.571-36.571 36.571-36.571h219.429c20 0 36.571 16.571 36.571 36.571h95.429c68.571 0 127.429 46.857 142.286 113.714l57.714 252h-75.429l-53.143-235.429c-8-33.714-37.143-57.143-71.429-57.143h-95.429c0 20-16.571 36.571-36.571 36.571h-219.429c-20 0-36.571-16.571-36.571-36.571h-95.429c-34.286 0-63.429 23.429-71.429 57.143z"' +
        '            ></path>' +
        '          </svg>' +
        '          <span class="clothes-text14">CHECKOUT</span>' +
        '        </div>' +
        '        <svg viewBox="0 0 1280 1024" class="clothes-icon18">' +
        '          <path' +
        '            d="M1232 0h-384c-26.4 0-63.274 15.274-81.942 33.942l-476.116 476.116c-18.668 18.668-18.668 49.214 0 67.882l412.118 412.118c18.668 18.668 49.214 18.668 67.882 0l476.118-476.118c18.666-18.666 33.94-55.54 33.94-81.94v-384c0-26.4-21.6-48-48-48zM992 384c-53.020 0-96-42.98-96-96s42.98-96 96-96 96 42.98 96 96-42.98 96-96 96z"' +
        '          ></path>' +
        '          <path' +
        '            d="M128 544l544-544h-80c-26.4 0-63.274 15.274-81.942 33.942l-476.116 476.116c-18.668 18.668-18.668 49.214 0 67.882l412.118 412.118c18.668 18.668 49.214 18.668 67.882 0l30.058-30.058-416-416z"' +
        '          ></path>' +
        '        </svg>' +
        '        <span class="clothes-text15">' + basketValue + '$</span>' +
        '      </div>' +
        '    </div>';


    $('#main_container').append(base);


}

function valueInput(t) {
    var value = $(t)
    $.post('https://core_clothing/updateValue', JSON.stringify({
        part: value.attr('id'),
        value: value.val()
    }));
}


function resetOtherInputs(type){
    if (type === 'Accessories'){
        $('#wID').val(0)
        $('#wModel').val(0)
        $('#wTexture').val(0)
        $('#wTorso').val(15)
        $('#mID').val(0)
        $('#mModel').val(0)
        $('#mTexture').val(0)
        $('#mTorso').val(15)
        $.post('https://core_clothing/resetOthersClothes', JSON.stringify({parts: ['wID','wModel','wTexture','wTorso','mID','mModel','mTexture','mTorso']}));
    }else{
        $('#mPropID').val(0)
        $('#mPropModel').val(0)
        $('#mPropTexture').val(0)
        $('#wPropID').val(0)
        $('#wPropModel').val(0)
        $('#wPropTexture').val(0)
        $.post('https://core_clothing/resetOthersClothes', JSON.stringify({parts: ['mPropID','mPropModel','mPropTexture','wPropID','wPropModel','wPropTexture']}));

    }
}

function valueForward(t) {
    var value = $(t).parent().find('.edit-container08').find('input');
    var newVlaue = parseInt(value.val() || 0) + 1
    if (clothesArray[value.attr('id').substring(1)]){
        var key = Object.keys(clothesArray[value.attr('id').substring(1)]);
        var nextIndex = key.indexOf(value.val()) + 1;
        var nextKey = key[nextIndex];
        if (nextKey >= 0){
            newVlaue = nextKey;
        } else {
            newVlaue = Object.keys(clothesArray[value.attr('id').substring(1)])[0];
        }
        var types = value.attr('id').substring(1) == 'ID' ? 'Clothes' : 'Accessories'
        if (UsingCoreInventory){
            var newVlaues = 0
            if (types === 'Clothes'){newVlaues = newVlaue - 1}else{ newVlaues = newVlaue}
            $('#item').val(CoreClothingItems[types][newVlaues])
        }else{
            $('#item').val(clothesArray[value.attr('id').substring(1)][newVlaue])
        }
        resetOtherInputs(types)
    }
    if (parseInt(value.val() || 0) + 1 < 1000) {
        value.val(newVlaue);
        $.post('https://core_clothing/updateValue', JSON.stringify({
            part: value.attr('id'),
            value: value.val()
        }));
    }
}

function valueBack(t) {
    var value = $(t).parent().find('.edit-container08').find('input');
    var newVlaue = parseInt(value.val() || 0) -1
    if (clothesArray[value.attr('id').substring(1)]){
        var key = Object.keys(clothesArray[value.attr('id').substring(1)]);
        var nextIndex = key.indexOf(value.val()) -1;
        var nextKey = key[nextIndex];
        if (nextKey >= 0){
            newVlaue = nextKey;
        } else {
            newVlaue = Object.keys(clothesArray[value.attr('id').substring(1)])[0];
        }
        var types = value.attr('id').substring(1) == 'ID' ? 'Clothes' : 'Accessories'
        if (UsingCoreInventory){
            var newVlaues = 0
            if (types === 'Clothes'){newVlaues = newVlaue - 1}else{ newVlaues = newVlaue}
            $('#item').val(CoreClothingItems[types][newVlaues])
        }else{
            $('#item').val(clothesArray[value.attr('id').substring(1)][newVlaue])
        }
        resetOtherInputs(types)
    }
    if (parseInt(value.val() || 0) - 1 > -1) {
        value.val(newVlaue);
        $.post('https://core_clothing/updateValue', JSON.stringify({
            part: value.attr('id'),
            value: value.val()
        }));
    }
}

function updateValueNoCheck(part, value){
  $.post('https://core_clothing/updateValue', JSON.stringify({
    part: part,
    value: value
  }));
}

function deleteEditing() {

    $.post('https://core_clothing/deleteEdit', JSON.stringify({
        id: editing
    }));
    var base = '<div id="checkoutBackground"></div><img id="loader" src="loader.svg" class="scale-down-center">';
    $('.clothes-checkoutcontainer').append(base);
    editing = 'newclothing';

}


function saveEditing() {

    $.post('https://core_clothing/saveEdit', JSON.stringify({
        id: editing,
        category: currentCategory,
        label: $('#label').val(),
        price: $('#price').val(),
        item:  $('#item').val(),
        image: $('#image').val(),
        gender:gender,
    }));
    var base = '<div id="checkoutBackground"></div><img id="loader" src="loader.svg" class="scale-down-center">';
    $('.clothes-checkoutcontainer').append(base);
    editing = 'newclothing';

}

function toggleEditing() {
    playClickSound();
    editingEnabled = !editingEnabled;
    if (editingEnabled) {
        $('.clothes-icon11').css('fill', config.Stores[store].Checkout);
    } else {
        if ($('.clothes-checkoutcontainer').length) {
            $('.clothes-checkoutcontainer').removeClass('slide-right');
            $('.clothes-checkoutcontainer').addClass('slide-back');
            animationPlaying = true;
            setTimeout(() => {
                $('.clothes-checkoutcontainer').remove();
                animationPlaying = false;
            }, 500)

        }
        $('.clothes-icon11').css('fill', 'white');

    }

}

function aquireValues(part) {

    if (Clothing[editing]) {
        if (part == "mID"&& Clothing[editing].men){
            $.post('https://core_clothing/updateValueNoChange', JSON.stringify({
                part: part,
                value: Clothing[editing].men.id
            }));
            return Clothing[editing].men.id;
        }
        if (part == "mModel"&& Clothing[editing].men){
            $.post('https://core_clothing/updateValueNoChange', JSON.stringify({
                part: part,
                value: Clothing[editing].men.model
            }));
            return Clothing[editing].men.model;
        }
        if (part == "mTexture" && Clothing[editing].men){
            $.post('https://core_clothing/updateValueNoChange', JSON.stringify({
                part: part,
                value: Clothing[editing].men.texture
            }));
            return Clothing[editing].men.texture;
        }
        if (part == "mTorso" && Clothing[editing].men && Clothing[editing].men.torso) {
            $.post('https://core_clothing/updateValueNoChange', JSON.stringify({
                part: part,
                value: Clothing[editing].men.torso
            }));
            return Clothing[editing].men.torso;
        } else if (part == "mTorso") {
            return 1;
        }
        if (part == "wID"&& Clothing[editing].woman){
            $.post('https://core_clothing/updateValueNoChange', JSON.stringify({
                part: part,
                value: Clothing[editing].woman.id
            }));
            return Clothing[editing].woman.id;

        }
        if (part == "wModel"&& Clothing[editing].woman){
            $.post('https://core_clothing/updateValueNoChange', JSON.stringify({
                part: part,
                value: Clothing[editing].woman.model
            }));
            return Clothing[editing].woman.model;
        }
        if (part == "wTexture"&& Clothing[editing].woman){
            $.post('https://core_clothing/updateValueNoChange', JSON.stringify({
                part: part,
                value: Clothing[editing].woman.texture
            }));
            return Clothing[editing].woman.texture;
        }
        if (part == "wTorso" && Clothing[editing].woman && Clothing[editing].woman.torso) {
            $.post('https://core_clothing/updateValueNoChange', JSON.stringify({
                part: part,
                value: Clothing[editing].woman.torso
            }));
            return Clothing[editing].woman.torso;
        } else if (part == "wTorso") {
            return 1;
        }

        if (part == "wPropID" && Clothing[editing].womanProp){
          $.post('https://core_clothing/updateValueNoChange', JSON.stringify({
            part: part,
            value: Clothing[editing].womanProp.id
          }));
          return Clothing[editing].womanProp.id;
        }
        if (part == "wPropModel" && Clothing[editing].womanProp){
          $.post('https://core_clothing/updateValueNoChange', JSON.stringify({
            part: part,
            value: Clothing[editing].womanProp.model
          }));
          return Clothing[editing].womanProp.model;
        }
        if (part == "wPropTexture" && Clothing[editing].womanProp){
          $.post('https://core_clothing/updateValueNoChange', JSON.stringify({
            part: part,
            value: Clothing[editing].womanProp.texture
          }));
          return Clothing[editing].womanProp.texture;
        }

        if (part == "mPropID" && Clothing[editing].menProp){
          $.post('https://core_clothing/updateValueNoChange', JSON.stringify({
            part: part,
            value: Clothing[editing].menProp.id
          }));
          return Clothing[editing].menProp.id;
        }
        if (part == "mPropModel" && Clothing[editing].menProp){
          $.post('https://core_clothing/updateValueNoChange', JSON.stringify({
            part: part,
            value: Clothing[editing].menProp.model
          }));
          return Clothing[editing].menProp.model;
        }
        if (part == "mPropTexture" && Clothing[editing].menProp){
          $.post('https://core_clothing/updateValueNoChange', JSON.stringify({
            part: part,
            value: Clothing[editing].menProp.texture
          }));
          return Clothing[editing].menProp.texture;
        }

    } else {
        return 0;
    }

}

function newEditing() {
    if (!editingEnabled) {
        toggleEditing();
    } else {
        playClickSound();
    }

    openEditing();
    editing = 'newclothing';
}

function openEditing() {

    if (animationPlaying) {
        return;
    }

    if ($('.clothes-checkoutcontainer').length) {

        $('.clothes-checkoutcontainer').remove();
        animationPlaying = false;


    }

    var base = '<div class="clothes-checkoutcontainer slide-right">' +
        '      <span class="clothes-text09">EDITING</span>' +
        '      <svg viewBox="0 0 1170.2857142857142 1024" class="clothes-icon12">' +
        ' <path d="M585.143 512c0-80.571-65.714-146.286-146.286-146.286s-146.286 65.714-146.286 146.286 65.714 146.286 146.286 146.286 146.286-65.714 146.286-146.286zM877.714 449.714v126.857c0 8.571-6.857 18.857-16 20.571l-105.714 16c-6.286 18.286-13.143 35.429-22.286 52 19.429 28 40 53.143 61.143 78.857 3.429 4 5.714 9.143 5.714 14.286s-1.714 9.143-5.143 13.143c-13.714 18.286-90.857 102.286-110.286 102.286-5.143 0-10.286-2.286-14.857-5.143l-78.857-61.714c-16.571 8.571-34.286 16-52 21.714-4 34.857-7.429 72-16.571 106.286-2.286 9.143-10.286 16-20.571 16h-126.857c-10.286 0-19.429-7.429-20.571-17.143l-16-105.143c-17.714-5.714-34.857-12.571-51.429-21.143l-80.571 61.143c-4 3.429-9.143 5.143-14.286 5.143s-10.286-2.286-14.286-6.286c-30.286-27.429-70.286-62.857-94.286-96-2.857-4-4-8.571-4-13.143 0-5.143 1.714-9.143 4.571-13.143 19.429-26.286 40.571-51.429 60-78.286-9.714-18.286-17.714-37.143-23.429-56.571l-104.571-15.429c-9.714-1.714-16.571-10.857-16.571-20.571v-126.857c0-8.571 6.857-18.857 15.429-20.571l106.286-16c5.714-18.286 13.143-35.429 22.286-52.571-19.429-27.429-40-53.143-61.143-78.857-3.429-4-5.714-8.571-5.714-13.714s2.286-9.143 5.143-13.143c13.714-18.857 90.857-102.286 110.286-102.286 5.143 0 10.286 2.286 14.857 5.714l78.857 61.143c16.571-8.571 34.286-16 52-21.714 4-34.857 7.429-72 16.571-106.286 2.286-9.143 10.286-16 20.571-16h126.857c10.286 0 19.429 7.429 20.571 17.143l16 105.143c17.714 5.714 34.857 12.571 51.429 21.143l81.143-61.143c3.429-3.429 8.571-5.143 13.714-5.143s10.286 2.286 14.286 5.714c30.286 28 70.286 63.429 94.286 97.143 2.857 3.429 4 8 4 12.571 0 5.143-1.714 9.143-4.571 13.143-19.429 26.286-40.571 51.429-60 78.286 9.714 18.286 17.714 37.143 23.429 56l104.571 16c9.714 1.714 16.571 10.857 16.571 20.571z"' +
        '      ></path>' +
        '      </svg>' +

        '<div class="edit-editing">' +
        '      <div class="edit-container01"><span class="edit-text">NAMING & PRICE</span></div>' +
        '      <div class="edit-container02">' +
        '        <div class="edit-container03">' +
        '          <input' +
        '            type="text" id="label"' +
        '            placeholder="ex. Casual Pants"' +
        '            class="edit-textinput input"' +
        '          />' +
        '        </div>' +
        '        <div class="edit-cash">' +
        '          <span class="edit-text1">$</span>' +
        '          <input type="number" id="price" placeholder="0" class="edit-textinput1 input" />' +
        '        </div>' +
        '      </div>' +
        '      <div class="edit-container01" style="display: none;"><span class="edit-text">ITEM OR PART</span></div>' +
        '      <div class="edit-container02" style="display: none;">' +
        '        <div class="edit-container03" style="width: 80% !important;">' +
        '          <input value="empty"' +
        '            type="text" id="item"' +
        '            placeholder="ex. pants"' +
        '            class="edit-textinput input"' +
        '          />' +
        '        </div>' +
        '      </div>'
        if (UsingCoreInventory){
            base = base +
            '      <div class="edit-container01" ><span class="edit-text">IMAGE</span></div>' +
            '      <div class="edit-container02" >' +
            '        <div class="edit-container03" style="width: 80% !important;">' +
            '          <input value=""' +
            '            type="text" id="image"' +
            '            placeholder="ex. red_pants"' +
            '            class="edit-textinput input"' +
            '          />' +
            '        </div>' +
            '      </div>'
        }

        if (gender == 'men'){
          base = base +
        '      <div class="edit-container04"><span class="edit-text2">Clothes</span></div>' +
        '      <div class="edit-men">' +

        '        <div class="edit-selector1">' +
        '          <div class="edit-back1" onclick="valueBack(this)">' +
        '            <svg viewBox="0 0 1024 1024" class="edit-icon4">' +
        '              <path d="M658 708l-60 60-256-256 256-256 60 60-196 196z"></path>' +
        '            </svg>' +
        '          </div>' +
        '          <div class="edit-container08">' +
        '            <input type="number" value="' + aquireValues("mID") + '"  oninput="valueInput(this)"  disabled class="edit-textinput3 input" id="mID" />' +
        '          </div>' +
        '          <div class="edit-forward1" onclick="valueForward(this)">' +
        '            <svg viewBox="0 0 1024 1024" class="edit-icon6">' +
        '              <path d="M426 256l256 256-256 256-60-60 196-196-196-196z"></path>' +
        '            </svg>' +
        '          </div>' +
        '          <div class="edit-container09">' +
        '            <span class="edit-text5">PART</span>' +
        '          </div>' +
        '        </div>' +

        '<div class="edit-selector1">' +
        '          <div class="edit-back1" onclick="valueBack(this)">' +
        '            <svg viewBox="0 0 1024 1024" class="edit-icon4">' +
        '              <path d="M658 708l-60 60-256-256 256-256 60 60-196 196z"></path>' +
        '            </svg>' +
        '          </div>' +
        '          <div class="edit-container08">' +
        '            <input type="number" value="' + aquireValues("mModel") + '" oninput="valueInput(this)"  class="edit-textinput3 input" id="mModel" />' +
        '          </div>' +
        '          <div class="edit-forward1" onclick="valueForward(this)">' +
        '            <svg viewBox="0 0 1024 1024" class="edit-icon6">' +
        '              <path d="M426 256l256 256-256 256-60-60 196-196-196-196z"></path>' +
        '            </svg>' +
        '          </div>' +
        '          <div class="edit-container09">' +
        '            <span class="edit-text5">MODEL</span>' +
        '          </div>' +
        '        </div>' +

        '<div class="edit-selector1">' +
        '          <div class="edit-back1" onclick="valueBack(this)">' +
        '            <svg viewBox="0 0 1024 1024" class="edit-icon4">' +
        '              <path d="M658 708l-60 60-256-256 256-256 60 60-196 196z"></path>' +
        '            </svg>' +
        '          </div>' +
        '          <div class="edit-container08">' +
        '            <input type="number" value="' + aquireValues("mTexture") + '" oninput="valueInput(this)" class="edit-textinput3 input" id="mTexture" />' +
        '          </div>' +
        '          <div class="edit-forward1" onclick="valueForward(this)">' +
        '            <svg viewBox="0 0 1024 1024" class="edit-icon6">' +
        '              <path d="M426 256l256 256-256 256-60-60 196-196-196-196z"></path>' +
        '            </svg>' +
        '          </div>' +
        '          <div class="edit-container09">' +
        '            <span class="edit-text5">TEXTURE</span>' +
        '          </div>' +
        '        </div>' +

        '<div class="edit-selector1">' +
        '          <div class="edit-back1" onclick="valueBack(this)">' +
        '            <svg viewBox="0 0 1024 1024" class="edit-icon4">' +
        '              <path d="M658 708l-60 60-256-256 256-256 60 60-196 196z"></path>' +
        '            </svg>' +
        '          </div>' +
        '          <div class="edit-container08">' +
        '            <input type="number" value="' + aquireValues("mTorso") + '" oninput="valueInput(this)"  class="edit-textinput3 input" id="mTorso" />' +
        '          </div>' +
        '          <div class="edit-forward1" onclick="valueForward(this)">' +
        '            <svg viewBox="0 0 1024 1024" class="edit-icon6">' +
        '              <path d="M426 256l256 256-256 256-60-60 196-196-196-196z"></path>' +
        '            </svg>' +
        '          </div>' +
        '          <div class="edit-container09">' +
        '            <span class="edit-text5">ARMS</span>' +
        '          </div>' +
        '        </div>' +
        '      </div>' +
        '    </div>'+
        '      <div class="edit-container04"><span class="edit-text2">ACCESSORIES</span></div>' +
        '      <div class="edit-men">' +
        '        <div class="edit-selector1">' +
        '          <div class="edit-back1" onclick="valueBack(this)">' +
        '            <svg viewBox="0 0 1024 1024" class="edit-icon4">' +
        '              <path d="M658 708l-60 60-256-256 256-256 60 60-196 196z"></path>' +
        '            </svg>' +
        '          </div>' +
        '          <div class="edit-container08">' +
        '            <input type="number" value="' + aquireValues("mPropID") + '" oninput="valueInput(this)"  disabled class="edit-textinput3 input" id="mPropID" />' +
        '          </div>' +
        '          <div class="edit-forward1" onclick="valueForward(this)">' +
        '            <svg viewBox="0 0 1024 1024" class="edit-icon6">' +
        '              <path d="M426 256l256 256-256 256-60-60 196-196-196-196z"></path>' +
        '            </svg>' +
        '          </div>' +
        '          <div class="edit-container09">' +
        '            <span class="edit-text5">PART</span>' +
        '          </div>' +
        '        </div>' +

        '<div class="edit-selector1">' +
        '          <div class="edit-back1" onclick="valueBack(this)">' +
        '            <svg viewBox="0 0 1024 1024" class="edit-icon4">' +
        '              <path d="M658 708l-60 60-256-256 256-256 60 60-196 196z"></path>' +
        '            </svg>' +
        '          </div>' +
        '          <div class="edit-container08">' +
        '            <input type="number" value="' + aquireValues("mPropModel") + '" oninput="valueInput(this)"  class="edit-textinput3 input" id="mPropModel" />' +
        '          </div>' +
        '          <div class="edit-forward1" onclick="valueForward(this)">' +
        '            <svg viewBox="0 0 1024 1024" class="edit-icon6">' +
        '              <path d="M426 256l256 256-256 256-60-60 196-196-196-196z"></path>' +
        '            </svg>' +
        '          </div>' +
        '          <div class="edit-container09">' +
        '            <span class="edit-text5">MODEL</span>' +
        '          </div>' +
        '        </div>' +

        '<div class="edit-selector1">' +
        '          <div class="edit-back1" onclick="valueBack(this)">' +
        '            <svg viewBox="0 0 1024 1024" class="edit-icon4">' +
        '              <path d="M658 708l-60 60-256-256 256-256 60 60-196 196z"></path>' +
        '            </svg>' +
        '          </div>' +
        '          <div class="edit-container08">' +
        '            <input type="number" value="' + aquireValues("mPropTexture") + '" oninput="valueInput(this)"  class="edit-textinput3 input" id="mPropTexture" />' +
        '          </div>' +
        '          <div class="edit-forward1" onclick="valueForward(this)">' +
        '            <svg viewBox="0 0 1024 1024" class="edit-icon6">' +
        '              <path d="M426 256l256 256-256 256-60-60 196-196-196-196z"></path>' +
        '            </svg>' +
        '          </div>' +
        '          <div class="edit-container09">' +
        '            <span class="edit-text5">TEXTURE</span>' +
        '          </div>' +
        '        </div>' 
        }
        if (gender == 'woman'){
          base = base +
        '      <div class="edit-container07"><span class="edit-text4">Clothes</span></div>' +
        '      <div class="edit-woman">' +

        '        <div class="edit-selector1">' +
        '          <div class="edit-back1"  onclick="valueBack(this)">' +
        '            <svg viewBox="0 0 1024 1024" class="edit-icon4">' +
        '              <path d="M658 708l-60 60-256-256 256-256 60 60-196 196z"></path>' +
        '            </svg>' +
        '          </div>' +
        '          <div class="edit-container08">' +
        '            <input type="number" value="' + aquireValues("wID") + '" oninput="valueInput(this)"  disabled class="edit-textinput3 input" id="wID" />' +
        '          </div>' +
        '          <div class="edit-forward1"  onclick="valueForward(this)">' +
        '            <svg viewBox="0 0 1024 1024" class="edit-icon6">' +
        '              <path d="M426 256l256 256-256 256-60-60 196-196-196-196z"></path>' +
        '            </svg>' +
        '          </div>' +
        '          <div class="edit-container09">' +
        '            <span class="edit-text5">PART</span>' +
        '          </div>' +
        '        </div>' +

        '        <div class="edit-selector1">' +
        '          <div class="edit-back1"  onclick="valueBack(this)">' +
        '            <svg viewBox="0 0 1024 1024" class="edit-icon4">' +
        '              <path d="M658 708l-60 60-256-256 256-256 60 60-196 196z"></path>' +
        '            </svg>' +
        '          </div>' +
        '          <div class="edit-container08">' +
        '            <input type="number" value="' + aquireValues("wModel") + '" oninput="valueInput(this)"  class="edit-textinput3 input" id="wModel" />' +
        '          </div>' +
        '          <div class="edit-forward1"  onclick="valueForward(this)">' +
        '            <svg viewBox="0 0 1024 1024" class="edit-icon6">' +
        '              <path d="M426 256l256 256-256 256-60-60 196-196-196-196z"></path>' +
        '            </svg>' +
        '          </div>' +
        '          <div class="edit-container09">' +
        '            <span class="edit-text5">MODEL</span>' +
        '          </div>' +
        '        </div>' +

        '        <div class="edit-selector1">' +
        '          <div class="edit-back1"  onclick="valueBack(this)">' +
        '            <svg viewBox="0 0 1024 1024" class="edit-icon4">' +
        '              <path d="M658 708l-60 60-256-256 256-256 60 60-196 196z"></path>' +
        '            </svg>' +
        '          </div>' +
        '          <div class="edit-container08">' +
        '            <input type="number" value="' + aquireValues("wTexture") + '" oninput="valueInput(this)"  class="edit-textinput3 input" id="wTexture" />' +
        '          </div>' +
        '          <div class="edit-forward1"  onclick="valueForward(this)">' +
        '            <svg viewBox="0 0 1024 1024" class="edit-icon6">' +
        '              <path d="M426 256l256 256-256 256-60-60 196-196-196-196z"></path>' +
        '            </svg>' +
        '          </div>' +
        '          <div class="edit-container09">' +
        '            <span class="edit-text5">TEXTURE</span>' +
        '          </div>' +
        '        </div>' +

        '        <div class="edit-selector1">' +
        '          <div class="edit-back1"  onclick="valueBack(this)">' +
        '            <svg viewBox="0 0 1024 1024" class="edit-icon4">' +
        '              <path d="M658 708l-60 60-256-256 256-256 60 60-196 196z"></path>' +
        '            </svg>' +
        '          </div>' +
        '          <div class="edit-container08">' +
        '            <input type="number" value="' + aquireValues("wTorso") + '" oninput="valueInput(this)"  class="edit-textinput3 input" id="wTorso" />' +
        '          </div>' +
        '          <div class="edit-forward1"  onclick="valueForward(this)">' +
        '            <svg viewBox="0 0 1024 1024" class="edit-icon6">' +
        '              <path d="M426 256l256 256-256 256-60-60 196-196-196-196z"></path>' +
        '            </svg>' +
        '          </div>' +
        '          <div class="edit-container09">' +
        '            <span class="edit-text5">ARMS</span>' +
        '          </div>' +
        '        </div>' +
        '      </div>' +
        '    </div>'+
        '      <div class="edit-container04"><span class="edit-text2">ACCESSORIES</span></div>' +
        '      <div class="edit-men">' +

        '        <div class="edit-selector1">' +
        '          <div class="edit-back1" onclick="valueBack(this)">' +
        '            <svg viewBox="0 0 1024 1024" class="edit-icon4">' +
        '              <path d="M658 708l-60 60-256-256 256-256 60 60-196 196z"></path>' +
        '            </svg>' +
        '          </div>' +
        '          <div class="edit-container08">' +
        '            <input type="number" value="' + aquireValues("wPropID") + '" oninput="valueInput(this)"  disabled class="edit-textinput3 input" id="wPropID" />' +
        '          </div>' +
        '          <div class="edit-forward1" onclick="valueForward(this)">' +
        '            <svg viewBox="0 0 1024 1024" class="edit-icon6">' +
        '              <path d="M426 256l256 256-256 256-60-60 196-196-196-196z"></path>' +
        '            </svg>' +
        '          </div>' +
        '          <div class="edit-container09">' +
        '            <span class="edit-text5">PART</span>' +
        '          </div>' +
        '        </div>' +

        '<div class="edit-selector1">' +
        '          <div class="edit-back1" onclick="valueBack(this)">' +
        '            <svg viewBox="0 0 1024 1024" class="edit-icon4">' +
        '              <path d="M658 708l-60 60-256-256 256-256 60 60-196 196z"></path>' +
        '            </svg>' +
        '          </div>' +
        '          <div class="edit-container08">' +
        '            <input type="number" value="' + aquireValues("wPropModel") + '" oninput="valueInput(this)"  class="edit-textinput3 input" id="wPropModel" />' +
        '          </div>' +
        '          <div class="edit-forward1" onclick="valueForward(this)">' +
        '            <svg viewBox="0 0 1024 1024" class="edit-icon6">' +
        '              <path d="M426 256l256 256-256 256-60-60 196-196-196-196z"></path>' +
        '            </svg>' +
        '          </div>' +
        '          <div class="edit-container09">' +
        '            <span class="edit-text5">MODEL</span>' +
        '          </div>' +
        '        </div>' +

        '<div class="edit-selector1">' +
        '          <div class="edit-back1" onclick="valueBack(this)">' +
        '            <svg viewBox="0 0 1024 1024" class="edit-icon4">' +
        '              <path d="M658 708l-60 60-256-256 256-256 60 60-196 196z"></path>' +
        '            </svg>' +
        '          </div>' +
        '          <div class="edit-container08">' +
        '            <input type="number" value="' + aquireValues("wPropTexture") + '" oninput="valueInput(this)"  class="edit-textinput3 input" id="wPropTexture" />' +
        '          </div>' +
        '          <div class="edit-forward1" onclick="valueForward(this)">' +
        '            <svg viewBox="0 0 1024 1024" class="edit-icon6">' +
        '              <path d="M426 256l256 256-256 256-60-60 196-196-196-196z"></path>' +
        '            </svg>' +
        '          </div>' +
        '          <div class="edit-container09">' +
        '            <span class="edit-text5">TEXTURE</span>' +
        '          </div>' +
        '        </div>'
        }
        base = base +
        '      <div class="clothes-container3">' +
        '        <div class="clothes-container4" style="background-color: ' + config.Stores[store].Checkout + '" onclick="saveEditing()">' +
        '          <svg viewBox="0 0 1170.2857142857142 1024" class="clothes-icon16">' +
        '            <path' +
        '              d="M1097.143 438.857c40.571 0 73.143 32.571 73.143 73.143s-32.571 73.143-73.143 73.143h-8.571l-65.714 378.286c-6.286 34.857-36.571 60.571-72 60.571h-731.429c-35.429 0-65.714-25.714-72-60.571l-65.714-378.286h-8.571c-40.571 0-73.143-32.571-73.143-73.143s32.571-73.143 73.143-73.143h1024zM277.143 896c20-1.714 35.429-19.429 33.714-39.429l-18.286-237.714c-1.714-20-19.429-35.429-39.429-33.714s-35.429 19.429-33.714 39.429l18.286 237.714c1.714 18.857 17.714 33.714 36.571 33.714h2.857zM512 859.429v-237.714c0-20-16.571-36.571-36.571-36.571s-36.571 16.571-36.571 36.571v237.714c0 20 16.571 36.571 36.571 36.571s36.571-16.571 36.571-36.571zM731.429 859.429v-237.714c0-20-16.571-36.571-36.571-36.571s-36.571 16.571-36.571 36.571v237.714c0 20 16.571 36.571 36.571 36.571s36.571-16.571 36.571-36.571zM932.571 862.286l18.286-237.714c1.714-20-13.714-37.714-33.714-39.429s-37.714 13.714-39.429 33.714l-18.286 237.714c-1.714 20 13.714 37.714 33.714 39.429h2.857c18.857 0 34.857-14.857 36.571-33.714zM272 166.857l-53.143 235.429h-75.429l57.714-252c14.857-66.857 73.714-113.714 142.286-113.714h95.429c0-20 16.571-36.571 36.571-36.571h219.429c20 0 36.571 16.571 36.571 36.571h95.429c68.571 0 127.429 46.857 142.286 113.714l57.714 252h-75.429l-53.143-235.429c-8-33.714-37.143-57.143-71.429-57.143h-95.429c0 20-16.571 36.571-36.571 36.571h-219.429c-20 0-36.571-16.571-36.571-36.571h-95.429c-34.286 0-63.429 23.429-71.429 57.143z"' +
        '            ></path>' +
        '          </svg>' +
        '          <span class="clothes-text14">SAVE</span>' +
        '        </div>' +
        '        <div class="clothes-container40" style="background-color: ' + config.Stores[store].Checkout + '" onclick="deleteEditing()">' +
        '<svg viewBox="0 0 804.5714285714286 1024" class="clothes-icon16">' +
        '      <path' +
        '        d="M292.571 420.571v329.143c0 10.286-8 18.286-18.286 18.286h-36.571c-10.286 0-18.286-8-18.286-18.286v-329.143c0-10.286 8-18.286 18.286-18.286h36.571c10.286 0 18.286 8 18.286 18.286zM438.857 420.571v329.143c0 10.286-8 18.286-18.286 18.286h-36.571c-10.286 0-18.286-8-18.286-18.286v-329.143c0-10.286 8-18.286 18.286-18.286h36.571c10.286 0 18.286 8 18.286 18.286zM585.143 420.571v329.143c0 10.286-8 18.286-18.286 18.286h-36.571c-10.286 0-18.286-8-18.286-18.286v-329.143c0-10.286 8-18.286 18.286-18.286h36.571c10.286 0 18.286 8 18.286 18.286zM658.286 834.286v-541.714h-512v541.714c0 27.429 15.429 43.429 18.286 43.429h475.429c2.857 0 18.286-16 18.286-43.429zM274.286 219.429h256l-27.429-66.857c-1.714-2.286-6.857-5.714-9.714-6.286h-181.143c-3.429 0.571-8 4-9.714 6.286zM804.571 237.714v36.571c0 10.286-8 18.286-18.286 18.286h-54.857v541.714c0 62.857-41.143 116.571-91.429 116.571h-475.429c-50.286 0-91.429-51.429-91.429-114.286v-544h-54.857c-10.286 0-18.286-8-18.286-18.286v-36.571c0-10.286 8-18.286 18.286-18.286h176.571l40-95.429c11.429-28 45.714-50.857 76-50.857h182.857c30.286 0 64.571 22.857 76 50.857l40 95.429h176.571c10.286 0 18.286 8 18.286 18.286z"' +
        '      ></path>' +
        '    </svg>' +
        '          <span class="clothes-text14">DELETE</span>' +
        '        </div>' +

        '      </div>' +
        '    </div>';




    $('#main_container').append(base);


}

function PreviousCategory() {

    if (previousCategory != '') {
        currentCategory = config.Stores[store].Clothes[previousCategory].parent;
    } else {
        currentCategory = '';
    }



    if (editing != null) {
      $('.clothes-checkoutcontainer').removeClass('slide-right');
      $('.clothes-checkoutcontainer').addClass('slide-back');
        editing = null;
    }

    openCategory(previousCategory)


}

function openCategory(cat) {
    $('.clothes-entrylist').html('');
    if (cat != '') {
        $('.clothes-category').text(config.Stores[store].Clothes[cat].label);
    } else {
        $('.clothes-category').text(config.Stores[store].Label);
    }

    previousCategory = currentCategory;
    currentCategory = cat;
    if (cat==='men' || cat === 'woman'){
        gender = cat
    }
    for (const [key, value] of Object.entries(config.Stores[store].Clothes)) {



        if (value.parent == cat && value.category) {

            var base = '';

            base = base + '        <div class="clothes-entry scale-up-center" style="background-color: ' + config.Stores[store].Button + '" name="' + key + '" onclick="openCategory(\'' + key + '\')">';

            base = base + '          <div class="clothes-iconcontainer">' +
                '            <svg viewBox="0 0 791.4057142857142 1024" class="clothes-icon">' +
                '              <path' +
                '                d="M585.143 18.286c0-10.286 8-18.286 18.286-18.286h164.571c20 0 36.571 16.571 36.571 36.571v164.571c0 10.286-8 18.286-18.286 18.286h-36.571c-10.286 0-18.286-8-18.286-18.286v-76.571l-145.143 145.714c44.571 56 72 127.429 72 205.143 0 169.143-128 308.571-292.571 326.857v75.429h54.857c10.286 0 18.286 8 18.286 18.286v36.571c0 10.286-8 18.286-18.286 18.286h-54.857v54.857c0 10.286-8 18.286-18.286 18.286h-36.571c-10.286 0-18.286-8-18.286-18.286v-54.857h-54.857c-10.286 0-18.286-8-18.286-18.286v-36.571c0-10.286 8-18.286 18.286-18.286h54.857v-75.429c-172.571-18.857-305.714-172.571-291.429-353.143 12-155.429 135.429-282.857 289.714-300.571 92.571-10.857 178.286 17.714 243.429 69.714l145.714-145.143h-76.571c-10.286 0-18.286-8-18.286-18.286v-36.571zM329.143 731.429c141.143 0 256-114.857 256-256s-114.857-256-256-256-256 114.857-256 256 114.857 256 256 256z"' +
                '              ></path>' +
                '            </svg>' +
                '          </div>' +
                '          <span class="clothes-text">' + value.label + '</span>';

            if (value.price) {

                if (clothes.includes(key)) {
                    base = base + '          <div class="clothes-pricecontainer">' +
                        '            <span class="clothes-price">' +
                        '              <span class="clothes-text02">FREE</span>' +
                        '            </span>' +
                        '          </div>';
                } else {
                    base = base + '          <div class="clothes-pricecontainer">' +
                        '            <span class="clothes-price">' +
                        '              <span class="clothes-text01">$</span>' +
                        '              <span class="clothes-text02">' + value.price + '</span>' +
                        '            </span>' +
                        '          </div>';
                }

            }


            base = base + '        </div>';


            $('.clothes-entrylist').append(base);




        } else if (!value.category && value.parent == cat) {

            var base = '';


            if ((men && value.men.length == 0) || (woman && value.woman.length == 0)) {
                base = base + '        <div class="clothes-entry scale-up-center" style="opacity: 0.5; background-color: ' + config.Stores[store].Button + '" name="' + key + '" onclick="addToCart(\'' + key + '\')">';
            } else {
                base = base + '        <div class="clothes-entry scale-up-center" style="opacity: 1.0; background-color: ' + config.Stores[store].Button + '" name="' + key + '" onclick="addToCart(\'' + key + '\')">';
            }

            base = base + '          <div class="clothes-iconcontainer">' +
                '            <svg viewBox="0 0 791.4057142857142 1024" class="clothes-icon">' +
                '              <path' +
                '                d="M585.143 18.286c0-10.286 8-18.286 18.286-18.286h164.571c20 0 36.571 16.571 36.571 36.571v164.571c0 10.286-8 18.286-18.286 18.286h-36.571c-10.286 0-18.286-8-18.286-18.286v-76.571l-145.143 145.714c44.571 56 72 127.429 72 205.143 0 169.143-128 308.571-292.571 326.857v75.429h54.857c10.286 0 18.286 8 18.286 18.286v36.571c0 10.286-8 18.286-18.286 18.286h-54.857v54.857c0 10.286-8 18.286-18.286 18.286h-36.571c-10.286 0-18.286-8-18.286-18.286v-54.857h-54.857c-10.286 0-18.286-8-18.286-18.286v-36.571c0-10.286 8-18.286 18.286-18.286h54.857v-75.429c-172.571-18.857-305.714-172.571-291.429-353.143 12-155.429 135.429-282.857 289.714-300.571 92.571-10.857 178.286 17.714 243.429 69.714l145.714-145.143h-76.571c-10.286 0-18.286-8-18.286-18.286v-36.571zM329.143 731.429c141.143 0 256-114.857 256-256s-114.857-256-256-256-256 114.857-256 256 114.857 256 256 256z"' +
                '              ></path>' +
                '            </svg>' +
                '          </div>' +
                '          <span class="clothes-text">' + value.label + '</span>';

            if (value.price) {

                if (clothes.includes(key)) {
                    base = base + '          <div class="clothes-pricecontainer">' +
                        '            <span class="clothes-price">' +
                        '              <span class="clothes-text02">FREE</span>' +
                        '            </span>' +
                        '          </div>';
                } else {
                    base = base + '          <div class="clothes-pricecontainer">' +
                        '            <span class="clothes-price">' +
                        '              <span class="clothes-text01">$</span>' +
                        '              <span class="clothes-text02">' + value.price + '</span>' +
                        '            </span>' +
                        '          </div>';
                }

            }


            base = base + '        </div>';


            $('.clothes-entrylist').append(base);



        }



    }

    for (const [key, value] of Object.entries(Clothing)) {



        if (value.parent == cat && value.store == store) {

            var base = '';


            // if ((men && value.men.length == 0) || (woman && value.woman.length == 0)) {
            //     base = base + '        <div class="clothes-entry scale-up-center" style="opacity: 0.5; background-color: ' + config.Stores[store].Button + '" name="' + key + '" onclick="addToCart(\'' + key + '\')">';
            // } else {
                base = base + '        <div class="clothes-entry scale-up-center" style="opacity: 1.0; background-color: ' + config.Stores[store].Button + '" name="' + key + '" onclick="addToCart(\'' + key + '\')">';
            // }

            base = base + '          <div class="clothes-iconcontainer">' +
                '            <svg viewBox="0 0 791.4057142857142 1024" class="clothes-icon">' +
                '              <path' +
                '                d="M585.143 18.286c0-10.286 8-18.286 18.286-18.286h164.571c20 0 36.571 16.571 36.571 36.571v164.571c0 10.286-8 18.286-18.286 18.286h-36.571c-10.286 0-18.286-8-18.286-18.286v-76.571l-145.143 145.714c44.571 56 72 127.429 72 205.143 0 169.143-128 308.571-292.571 326.857v75.429h54.857c10.286 0 18.286 8 18.286 18.286v36.571c0 10.286-8 18.286-18.286 18.286h-54.857v54.857c0 10.286-8 18.286-18.286 18.286h-36.571c-10.286 0-18.286-8-18.286-18.286v-54.857h-54.857c-10.286 0-18.286-8-18.286-18.286v-36.571c0-10.286 8-18.286 18.286-18.286h54.857v-75.429c-172.571-18.857-305.714-172.571-291.429-353.143 12-155.429 135.429-282.857 289.714-300.571 92.571-10.857 178.286 17.714 243.429 69.714l145.714-145.143h-76.571c-10.286 0-18.286-8-18.286-18.286v-36.571zM329.143 731.429c141.143 0 256-114.857 256-256s-114.857-256-256-256-256 114.857-256 256 114.857 256 256 256z"' +
                '              ></path>' +
                '            </svg>' +
                '          </div>' +
                '          <span class="clothes-text">' + value.label + '</span>';

            if (value.price) {

                if (clothes.includes(key)) {
                    base = base + '          <div class="clothes-pricecontainer">' +
                        '            <span class="clothes-price">' +
                        '              <span class="clothes-text02">FREE</span>' +
                        '            </span>' +
                        '          </div>';
                } else {
                    base = base + '          <div class="clothes-pricecontainer">' +
                        '            <span class="clothes-price">' +
                        '              <span class="clothes-text01">$</span>' +
                        '              <span class="clothes-text02">' + value.price + '</span>' +
                        '            </span>' +
                        '          </div>';
                }

            }


            base = base + '        </div>';


            $('.clothes-entrylist').append(base);




        }



    }

    if (editingAvailable && cat != '' ) {
        var adder = '<svg viewBox="0 0 1024 1024" class="edit-icon hover" style="fill:white; margin-top: 30px; min-height: 30px; z-index: 99; width: 30px;" onclick="newEditing()">' +
            '      <path' +
            '        d="M992 384h-352v-352c0-17.672-14.328-32-32-32h-192c-17.672 0-32 14.328-32 32v352h-352c-17.672 0-32 14.328-32 32v192c0 17.672 14.328 32 32 32h352v352c0 17.672 14.328 32 32 32h192c17.672 0 32-14.328 32-32v-352h352c17.672 0 32-14.328 32-32v-192c0-17.672-14.328-32-32-32z"' +
            '      ></path>' +
            '    </svg>';
        $('.clothes-entrylist').append(adder);
    }

    setTimeout(() => {
        $('.clothes-entry').removeClass('scale-up-center');
    }, 400);


    $(".clothes-entry").mouseenter(function() {
        playSound('hover');
        $.post('https://core_clothing/hoverClothes', JSON.stringify({
            clothes: $(this).attr('name')
        }));
    });

    $(".clothes-entry").mouseleave(function() {
        $.post('https://core_clothing/hoverClothes', JSON.stringify({
            clothes: null
        }));
    });



}

function openStore() {

    if ($('.clothes-maincontainer').length) {
        $('.clothes-maincontainer').remove();
    }


    playSound('open')


    var base = '      <div class="gradient" style="background: linear-gradient(270deg, ' + config.Stores[store].Button + ' 0%, rgba(255,255,255,0) 70%)"></div>' +
        '<div class="clothes-maincontainer slide-right" style="background: linear-gradient(180deg, ' + config.Stores[store].Background1 + ', ' + config.Stores[store].Background2 + '); " >' +

        '      <div class="clothes-pattern">' +
        '        <img' +
        '          alt="image"' +
        '          src="img/' + config.Stores[store].Pattern + '"' +
        '          class="clothes-image"' +
        '        />' +
        '      </div>' +
        '      <div class="clothes-shopcontainer">' +
        '        <img' +
        '          alt="image"' +
        '          src="img/' + config.Stores[store].Logo + '"' +
        '          class="clothes-shopicon"' +
        '        />' +
        '      </div>' +
        '      <span class="clothes-category">' + config.Stores[store].Label + '</span>' +
        '      <div class="clothes-entrylist">';



    base = base + '      </div>' +
        '      <div class="clothes-container01">' +
        '        <div class="clothes-container02" style="background-color: ' + config.Stores[store].Checkout + '" onclick="openCheckout()">' +
        '          <svg viewBox="0 0 1170.2857142857142 1024" class="clothes-icon04">' +
        '            <path' +
        '              d="M1097.143 438.857c40.571 0 73.143 32.571 73.143 73.143s-32.571 73.143-73.143 73.143h-8.571l-65.714 378.286c-6.286 34.857-36.571 60.571-72 60.571h-731.429c-35.429 0-65.714-25.714-72-60.571l-65.714-378.286h-8.571c-40.571 0-73.143-32.571-73.143-73.143s32.571-73.143 73.143-73.143h1024zM277.143 896c20-1.714 35.429-19.429 33.714-39.429l-18.286-237.714c-1.714-20-19.429-35.429-39.429-33.714s-35.429 19.429-33.714 39.429l18.286 237.714c1.714 18.857 17.714 33.714 36.571 33.714h2.857zM512 859.429v-237.714c0-20-16.571-36.571-36.571-36.571s-36.571 16.571-36.571 36.571v237.714c0 20 16.571 36.571 36.571 36.571s36.571-16.571 36.571-36.571zM731.429 859.429v-237.714c0-20-16.571-36.571-36.571-36.571s-36.571 16.571-36.571 36.571v237.714c0 20 16.571 36.571 36.571 36.571s36.571-16.571 36.571-36.571zM932.571 862.286l18.286-237.714c1.714-20-13.714-37.714-33.714-39.429s-37.714 13.714-39.429 33.714l-18.286 237.714c-1.714 20 13.714 37.714 33.714 39.429h2.857c18.857 0 34.857-14.857 36.571-33.714zM272 166.857l-53.143 235.429h-75.429l57.714-252c14.857-66.857 73.714-113.714 142.286-113.714h95.429c0-20 16.571-36.571 36.571-36.571h219.429c20 0 36.571 16.571 36.571 36.571h95.429c68.571 0 127.429 46.857 142.286 113.714l57.714 252h-75.429l-53.143-235.429c-8-33.714-37.143-57.143-71.429-57.143h-95.429c0 20-16.571 36.571-36.571 36.571h-219.429c-20 0-36.571-16.571-36.571-36.571h-95.429c-34.286 0-63.429 23.429-71.429 57.143z"' +
        '            ></path>' +
        '          </svg>' +
        '          <span class="clothes-text06">0$</span>' +
        '        </div>' +
        '        <svg viewBox="0 0 1097.142857142857 1024" class="clothes-icon06">' +
        '          <path' +
        '            d="M438.857 658.286h219.429v-54.857h-73.143v-256h-65.143l-84.571 78.286 44 45.714c13.714-12 22.286-18.286 31.429-32.571h1.143v164.571h-73.143v54.857zM731.429 512c0 104-62.857 237.714-182.857 237.714s-182.857-133.714-182.857-237.714 62.857-237.714 182.857-237.714 182.857 133.714 182.857 237.714zM1024 658.286v-292.571c-80.571 0-146.286-65.714-146.286-146.286h-658.286c0 80.571-65.714 146.286-146.286 146.286v292.571c80.571 0 146.286 65.714 146.286 146.286h658.286c0-80.571 65.714-146.286 146.286-146.286zM1097.143 182.857v658.286c0 20-16.571 36.571-36.571 36.571h-1024c-20 0-36.571-16.571-36.571-36.571v-658.286c0-20 16.571-36.571 36.571-36.571h1024c20 0 36.571 16.571 36.571 36.571z"' +
        '          ></path>' +
        '        </svg>' +
        '        <span class="clothes-text07">0$</span>' +
        '        <svg viewBox="0 0 1097.142857142857 1024" class="clothes-icon08">' +
        '          <path' +
        '            d="M1005.714 73.143c50.286 0 91.429 41.143 91.429 91.429v694.857c0 50.286-41.143 91.429-91.429 91.429h-914.286c-50.286 0-91.429-41.143-91.429-91.429v-694.857c0-50.286 41.143-91.429 91.429-91.429h914.286zM91.429 146.286c-9.714 0-18.286 8.571-18.286 18.286v128h950.857v-128c0-9.714-8.571-18.286-18.286-18.286h-914.286zM1005.714 877.714c9.714 0 18.286-8.571 18.286-18.286v-347.429h-950.857v347.429c0 9.714 8.571 18.286 18.286 18.286h914.286zM146.286 804.571v-73.143h146.286v73.143h-146.286zM365.714 804.571v-73.143h219.429v73.143h-219.429z"' +
        '          ></path>' +
        '        </svg>' +
        '        <span class="clothes-text08">0$</span>' +
        '      </div>' +
        '      <svg viewBox="0 0 1024 1024" class="clothes-icon10" onclick="PreviousCategory()">' +
        '        <path d="M658 708l-60 60-256-256 256-256 60 60-196 196z"></path>' +
        '      </svg>';
    if (editingAvailable) {
        base = base + '      <svg viewBox="0 0 877.7142857142857 1024" class="clothes-icon11" onclick="toggleEditing()">';
    }

    base = base + '        <path d="M585.143 512c0-80.571-65.714-146.286-146.286-146.286s-146.286 65.714-146.286 146.286 65.714 146.286 146.286 146.286 146.286-65.714 146.286-146.286zM877.714 449.714v126.857c0 8.571-6.857 18.857-16 20.571l-105.714 16c-6.286 18.286-13.143 35.429-22.286 52 19.429 28 40 53.143 61.143 78.857 3.429 4 5.714 9.143 5.714 14.286s-1.714 9.143-5.143 13.143c-13.714 18.286-90.857 102.286-110.286 102.286-5.143 0-10.286-2.286-14.857-5.143l-78.857-61.714c-16.571 8.571-34.286 16-52 21.714-4 34.857-7.429 72-16.571 106.286-2.286 9.143-10.286 16-20.571 16h-126.857c-10.286 0-19.429-7.429-20.571-17.143l-16-105.143c-17.714-5.714-34.857-12.571-51.429-21.143l-80.571 61.143c-4 3.429-9.143 5.143-14.286 5.143s-10.286-2.286-14.286-6.286c-30.286-27.429-70.286-62.857-94.286-96-2.857-4-4-8.571-4-13.143 0-5.143 1.714-9.143 4.571-13.143 19.429-26.286 40.571-51.429 60-78.286-9.714-18.286-17.714-37.143-23.429-56.571l-104.571-15.429c-9.714-1.714-16.571-10.857-16.571-20.571v-126.857c0-8.571 6.857-18.857 15.429-20.571l106.286-16c5.714-18.286 13.143-35.429 22.286-52.571-19.429-27.429-40-53.143-61.143-78.857-3.429-4-5.714-8.571-5.714-13.714s2.286-9.143 5.143-13.143c13.714-18.857 90.857-102.286 110.286-102.286 5.143 0 10.286 2.286 14.857 5.714l78.857 61.143c16.571-8.571 34.286-16 52-21.714 4-34.857 7.429-72 16.571-106.286 2.286-9.143 10.286-16 20.571-16h126.857c10.286 0 19.429 7.429 20.571 17.143l16 105.143c17.714 5.714 34.857 12.571 51.429 21.143l81.143-61.143c3.429-3.429 8.571-5.143 13.714-5.143s10.286 2.286 14.286 5.714c30.286 28 70.286 63.429 94.286 97.143 2.857 3.429 4 8 4 12.571 0 5.143-1.714 9.143-4.571 13.143-19.429 26.286-40.571 51.429-60 78.286 9.714 18.286 17.714 37.143 23.429 56l104.571 16c9.714 1.714 16.571 10.857 16.571 20.571z"' +
        '      ></path>' +
        '      </svg>' +

        '    </div>';



    $('#main_container').append(base);
    $('.clothes-text06').text(basketValue + '$');


    openCategory('');

}


function openPopup() {

    basket = {};
    basketValue = 0


    var base = '<div class="clothes-popup slide-right2">' +
        '      <div class="clothes-iconcontainer3">' +
        '        <img' +
        '          alt="image"' +
        '          src="img/' + config.Stores[store].Logo + '"' +
        '          class="clothes-icon21"' +
        '        />' +
        '      </div>' +
        '      <div class="clothes-container5">' +
        '        <span class="clothes-storetext">' + config.Stores[store].Label.toUpperCase() + '</span>' +
        '        <div class="clothes-container6">' +
        '          <span class="clothes-text16">PRESS</span>' +
        '          <div class="clothes-container7">' +
        '            <span class="clothes-text17">E</span>' +
        '          </div>' +
        '          <span class="clothes-text18">TO ENTER</span>' +
        '        </div>' +
        '      </div>' +
        '    </div>';




    $('#main_container').append(base);



}

function checkOutStatus(success) {

    $('#loader').removeClass('scale-down-center');
    $('#loader').addClass('disapear');

    if (success) {
        playSound('checkout');
        var base = '    <span class="checkout-text3 scale-down-center">SUCCESSFUL</span>';
        $('.clothes-checkoutcontainer').append(base);

        basket = {};
        basketValue = 0;


    } else {
        playSound('failed');
        var base = '    <span class="checkout-text4 scale-down-center">FAILED</span>';
        $('.clothes-checkoutcontainer').append(base);



    }

    if (editing == null) {

        setTimeout(() => {

            closeStore();

        }, 1100);


    } else {

        $('.clothes-checkoutcontainer').removeClass('slide-right');
        $('.clothes-checkoutcontainer').addClass('slide-back');

        setTimeout(() => {
            $('.clothes-checkoutcontainer').remove();
            editing = null;

        }, 1100);


    }



}

function checkout() {

    var base = '<div id="checkoutBackground"></div><img id="loader" src="loader.svg" class="scale-down-center">';
    $('.clothes-checkoutcontainer').append(base);

    $.post('https://core_clothing/checkout', JSON.stringify({
        basket: basket,
        value: basketValue
    }));
    basket = {};
    basketValue = 0;

}

function closeStore() {

    $.post('https://core_clothing/close', JSON.stringify({}));

    if ($('.clothes-checkoutcontainer').length) {
        $('.clothes-checkoutcontainer').removeClass('slide-right');
        $('.clothes-checkoutcontainer').addClass('slide-back');
        animationPlaying = true;
        setTimeout(() => {
            $('.clothes-maincontainer').removeClass('slide-right');
            $('.clothes-maincontainer').addClass('slide-back');
            $('.gradient').fadeOut();
            $('.clothes-checkoutcontainer').remove();
            setTimeout(() => {
                $('.clothes-maincontainer').remove();
                $('.gradient').remove();
                animationPlaying = false;
            }, 500)

        }, 500)
    } else {

        $('.clothes-maincontainer').removeClass('slide-right');
        $('.clothes-maincontainer').addClass('slide-back');
        $('.gradient').fadeOut();
        setTimeout(() => {
            $('.clothes-maincontainer').remove();
            $('.gradient').remove();
            animationPlaying = false;
        }, 500)

    }




}


$(document).keyup(function(e) {
    if (e.keyCode === 27) {

        closeStore();

    }

});


var dragX = 0;
var dragY = 0;
var dragging = false;

//DRAGGING
document.addEventListener('mousedown', e => {

    if (!$(e.target).hasClass('clothes-maincontainer')) {
        dragX = e.pageX;
        dragY = e.pageY;
        $.post('https://core_clothing/registerMouse', JSON.stringify({}));
        dragging = true
    }
});
document.addEventListener('mouseup', () => dragging = false);
document.addEventListener('mousemove', e => {

    if (dragging) {
        var x = dragX - e.pageX;
        var y = dragY - e.pageY;




        $.post('https://core_clothing/mouseMovement', JSON.stringify({
            x: x,
            y: y
        }));
    }


});

window.addEventListener('message', function(event) {


    var edata = event.data;

    if (edata.type == 'enterStore') {

        config = edata.config;
        store = edata.store;

        openPopup();


    }
    if (edata.type == 'openStore') {


        clothes = edata.clothes;
        men = edata.men;
        woman = edata.woman;
        Clothing = edata.clothing;
        editingEnabled = false;
        editingAvailable = edata.editing
        UsingCoreInventory = edata.UsingCoreInventory
        CoreClothingItems = edata.CoreClothingItems
        openStore();

    }
    if (edata.type == 'checkoutStatus') {


        checkOutStatus(edata.status);


    }
    if (edata.type == 'updateClothing') {


        Clothing = edata.clothing;
        openCategory(currentCategory);


    }


    if (edata.type == 'closeStore') {

        $('#main_container').fadeOut();
        setTimeout(() => {
            $('#main_container').html('');
            $('#main_container').fadeIn();
        }, 1000);


    }

    if (edata.type == 'updateMoney') {

        $('.clothes-text08').text('$' + edata.bank);
        $('.clothes-text07').text('$' + edata.money);


    }



});