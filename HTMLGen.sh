#!/bin/bash
# asciidoctor = call the program
# -r asciidoctor-html5s -b html5s = use the custom conversion (seperate download) 
#   gem install asciidoctor-html5s
# -a no-header 
# -a no-footer
# -a linkcss = don't dump the css text into my HTML
# -a stylesheet=<stylesheet.css> = what CSS file to use
# -a stylesdir=<location> = folder where the CSS is stored
#	default is /usr/lib/ruby/gems/2.7.0/gems/asciidoctor-2.0.10/data/stylesheets
# -D output folder

OUT="${PWD}/HTML"
# ${PWD} = current working directory

mkdir -p $output
# if the HTML folder does not exist make one

rm $OUT/*
# delete every thing in it

find . -name "*.adoc" -print0 | while read -d $'\0' file
do
    asciidoctor -r asciidoctor-html5s -b html5s -a no-header -a no-footer -a linkcss -D $OUT $file
done