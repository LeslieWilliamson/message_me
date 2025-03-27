// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "channels"

window.scroll_bottom = function () {
    if ($('#messages').length > 0) {
        $('#messages').scrollTop($('#messages')[0].scrollHeight);
    }
}

window.submit_message = function () {
    $('message_body').on('keydown', function (event) {
        if (event.keyCode == 13) {
            $('button').click();
            event.target.value = ''; // this didn't work
            // $('message_body').val(''); // this didn't work either
        }
    })
}

// $(document).bind("ajax:beforeSend", function () {
//     $('#message_body').val('');
// });

$(document).on('turbo:load', function () {
    $(".ui.dropdown").dropdown();

    $('.message .close').on('click', function () {
        $(this).closest('.message').transition('fade');
    });
    submit_message();
    scroll_bottom();
});