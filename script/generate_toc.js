var text = '';
[].forEach.call($$('h2, h3'), function(n) {
	var indent = n.nodeName == 'H3' ? '	' : '';
	text += indent + "* [" + n.innerHTML + "](#" + n.getAttribute('id') + ")" + "\n";
});
console.log(text);