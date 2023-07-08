$(document).ready(function () {

    function display(bool) {
        if (bool) {
            $("#lifepath-ui").show();
        } else {
            $("#lifepath-ui").hide();
        }
    }

    // Hide the UI on page load
    display(false);

    // Play hover sound
    function playHoverSound() {
        var audio = $("#hover-sound")[0];
        audio.volume = 0.5;
        audio.play();
    }

    // Close the UI and hide mouse cursor
    function closeUI() {
        display(false);
        $.post('http://tsrp-lifepaths/exit', JSON.stringify({}));
    }

    // Handle lifepath selection
    function handleLifepathSelection(event) {
        var selectedLifepath = $(this).data("choice");
        console.log("Selected Lifepath:", selectedLifepath);
        $.post('http://tsrp-lifepaths/selectLifepath', JSON.stringify({ lifepath: selectedLifepath }), function (response) {
            // Handle the response from the server
        }).fail(function (error) {
            // Handle any errors that occur during the request
        });
        closeUI();
    }

    // Add event listeners to lifepath images
    $(".lifepath-image").on("mouseenter", playHoverSound)
        .on("click", handleLifepathSelection)
        .css("cursor", "pointer");

    // Handle messages from the server-side
    window.addEventListener('message', function (event) {
        var message = event.data;

        // Check the message type
        if (message.type === 'openUI') {
            if (message.display === true) {
                display(true);
            } else {
                display(false);
            }
        }
    });
});
