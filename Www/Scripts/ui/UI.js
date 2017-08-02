
function pollAnswer(replacedPart, option) {
    var u = String(document.URL);
    $.ajax({
        url: u.replace(new RegExp(replacedPart, 'g'), 'PollAnswer') + '?option=' + option,
        method: "POST",
        dataType: "text",
        cache: false,
        timeout: 1000,

        success: function () { },
        error: function () { },
        complete: function () { }
    });
};

function setVoteButtonStyle() {
    $('input:submit').each(function () {
        //  Replaces "submit" with "button".
        $(this).replaceWith('<button type="' + $(this).attr('type') + '">' + $(this).val() + '</button>');

        //  Adds the icon to the "button".
        var b = $("button").button({ icons: { primary: "ui-icon-circle-plus" }, text: true }).click(function (event) {
            event.preventDefault();
        });

        //  Sets the height of the "button".
        if (b !== null && b !== undefined) {
            b.css("height", "32px");
            //b.css("text-wrap", "none");
            b.click(function () { $(this).attr('onclick')(); });
        }
    });
};

function alignDivsRightLeft() {
    var i = 0;
    $('.picture-div').each(function () {
        var poll = $(this).children(".poll");
        var img = $(this).children("img");

        if (i % 2) {
            if(poll !== null && poll !== undefined) poll.css('float', 'right');
            if(img !== null && img !== undefined) img.attr('class', 'leftimg');
        }
        else {
            if(poll !== null && poll !== undefined) poll.css('float', 'left');
            if(img !== null && img !== undefined) img.attr('class', 'rightimg');
        }
        i++;
    });
};
