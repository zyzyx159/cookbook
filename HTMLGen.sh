#!/bin/bash

#for f in $PWD/*.adoc
#do
#    asciidoctor -a linkcss -a nofooter $f
#done

OUT="HTML"

rm $OUT/*

#echo $OUT/*

find . -name "*.adoc" -print0 | while read -d $'\0' file
do
    asciidoctor -a linkcss -a nofooter -D $OUT $file
done