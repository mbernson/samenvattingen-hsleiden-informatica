//
// This piece of javascript automatically generates a markdown
// table of contents, based on the h2..h6 nodes in the DOM.
//
// H1 is reserved for the document title.
//
// It is intended to be run in the browser console. The logged output
// can be copied an pasted into your markdown document.
//

var text = '';
[].forEach.call($$('h2, h3, h4, h5, h6'), function(n) {
        var nodeName = n.nodeName.toLowerCase();
        var indent;
        switch(nodeName) {
            case 'h3':
                indent = '	'; break;
            case 'h4':
                indent = '		'; break;
            case 'h5':
                indent = '			'; break;
            case 'h6':
                indent = '				'; break;
            default:
                indent = '';
        }
	text += indent + "* [" + n.innerHTML + "](#" + n.getAttribute('id') + ")" + "\n";
});
console.log(text);
