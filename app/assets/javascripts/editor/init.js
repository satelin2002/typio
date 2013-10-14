 // config
var options = {
    editor: document.querySelector('[data-toggle="pen"]'),
    debug: true
};

 // create editor
var pen = new Pen(options);

$(document).ready(function () {
    $("div[data-toggle='pen']").attr('spellcheck', 'false');
    ui.init();
});

(function ($) {
    $(document).on('change keydown keypress input', 'div[data-placeholder]', function () {
        if (this.textContent) {
            this.dataset.divPlaceholderContent = 'true';
        } else {
            delete(this.dataset.divPlaceholderContent);
        }
    });
})(jQuery);