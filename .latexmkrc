#!/usr/bin/env perl

$latex='platex -interaction=nonstopmode -kanji=utf-8 -synctex=1 -halt-on-error %O %S';
$dvipdf='dvipdfmx %O -o %D %S';
$bibtex='pbibtex %B';
$makeindex = 'mendex %O -U -o %D %S';
$pdf_previewer = 'evince %O %S';
$pdf_mode = 3;                  #  3 = create pdf file by dvipdf
$pdf_update_method = 0;         #  0 =  auto update
