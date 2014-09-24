# Samenvattingen

Summaries for computer-science related courses at [Hogeschool Leiden](http://www.hsleiden.nl/informatica/).

## Generating HTML, EPUB, etc.

The build and watch scripts require [Pandoc](http://johnmacfarlane.net/pandoc/) and [Kicker](https://github.com/alloy/kicker) to be installed, respectively.

Run `script/build <format>` to output to a desired format. For instance, `script/build docx` wil convert all summaries to docx. When called with no arguments, the script defaults to HTML.

`script/epub` generates EPUB books for your e-reader and dumps them in a `./epub` folder.

To watch a single summary for changes, run `script/watch <course>`. (Example: `script/watch ISMI`)

## License

2013-2014, Mathijs Bernson and contributors.

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons-Licentie" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />Dit <span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/Text" rel="dct:type">werk</span> valt onder een <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Naamsvermelding-NietCommercieel-GelijkDelen 4.0 Internationaal-licentie</a>.