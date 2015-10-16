//
// This piece of javascript automatically generates a markdown
// table of contents, based on the headers in the (Pandoc generated)
// HTML-document.
//
// H1 is reserved for the document title, so it isn't used.
//
// It is intended to be run in the browser console. The logged output
// can be copied an pasted into your markdown document.
//

function generate_toc(depth) {

    if(!depth) depth = 4;

    var nodes = [],
        text = '';

    for(var i = 2; i <= depth + 2; i++) {
        nodes.push('h' + i);
    }
    console.log(nodes);

    [].forEach.call(document.querySelectorAll(nodes.join(',')), function(n) {
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

    return text;

}
console.log(generate_toc());
