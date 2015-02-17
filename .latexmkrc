#!/usr/bin/env perl
$latex='platex -kanji=utf8 -guess-input-enc -synctex=1 -interaction=nonstopmode -halt-on-error %S';
$dvipdf='dvipdfmx %O -o %D %S';
$bibtex='pbibtex -kanji=utf8 %B';
