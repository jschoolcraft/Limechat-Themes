// Code based on
// https://github.com/tmitz/limechat-emoji/blob/master/Limelight-emoji.js

String.prototype.startsWith = function (s) {
	return this.indexOf(s) == 0;
}

Element.prototype.empty = function() {
	while (this.firstChild) this.removeChild(this.firstChild);
}

document.addEventListener("DOMNodeInserted", function(e) {
	var line = e.target;
	switch (line.getAttribute("type")) {
		case "privmsg":
			// emoji
			var imgbase = "https://raw.github.com/tmitz/rails_emoji/master/vendor/assets/images/emojis/";
			var msg = line.getElementsByClassName('message').item(0);
			if (/http:/.test(msg.innerHTML)) return;

			var emojis = msg.innerHTML.match(/\:([a-zA-Z][a-zA-Z\d-_]+)\:/g);
			if (!emojis) return;

			var src = "";
			var emoji = "";
			for(var order in emojis) {
				emoji = emojis[order].match(/\:([\d\w+-_]+)\:/);
				src = imgbase + emoji[1] + '.png';
				msg.innerHTML = msg.innerHTML.replace(":"+emoji[1]+":", '<img src="'+src+'" class="emoji-img" title="'+emoji[1]+'" />');
			}

			break;
	}

}, false);
