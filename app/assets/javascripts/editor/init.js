 
  // config
  var options = {
    editor: document.querySelector('[data-toggle="pen"]'),
    debug: true
  };

  // create editor
  var pen = new Pen(options);


  // toggle editor mode
  // document.querySelector('#mode').addEventListener('click', function() {
//     var text = this.textContent;
// 
//     if(this.classList.contains('disabled')) {
//       this.classList.remove('disabled');
//       pen.rebuild();
//     } else {
//       this.classList.add('disabled');
//       pen.destory();
//     }
//   });
$(document).ready( function() {
    $("div[data-toggle='pen']").attr('spellcheck','false');
	ui.init();
});
(function ($) {
	$(document).on('change keydown keypress input', 'div[data-placeholder]', function() {
		if (this.textContent) {
			this.dataset.divPlaceholderContent = 'true';
		}
		else {
			delete(this.dataset.divPlaceholderContent);
		}
	});
})(jQuery);
 