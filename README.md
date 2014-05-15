# Samenvattingen

Om de HTML-versie te genereren, typ:

`pandoc Samenvatting.md -o samenvatting.html -c base.css`

Of het automatisch te doen:

```
$ gem install kicker
$ cd <samenvatting>
$ kicker -e "pandoc Samenvatting.md -o samenvatting.html -c base.css" Samenvatting.md
```
