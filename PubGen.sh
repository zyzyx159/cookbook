#!/bin/bash

# For new installs:
# 1) yay -S asciidoctor calibre
# 2) gem install asciidoctor-html5s

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

# ${PWD} = current working directory
HTML="${PWD}/HTML"
PUB="${PWD}/publish"
BOOK="Daniel's Cookbook"

# if the HTML folder does not exist make one
mkdir -p $HTML
mkdir -p $PUB

# delete every thing in it
rm $HTML/*
rm $PUB/*

# generate HTML
find . -name "*.adoc" -print0 | while read -d $'\0' file
do
    asciidoctor -r asciidoctor-html5s -b html5s -a no-header -a no-footer -a linkcss -D $HTML $file
done

# generate the rest
ebook-convert $HTML/index.html "$PUB/$BOOK".epub""
ebook-convert $HTML/index.html "$PUB/$BOOK".azw3""
ebook-convert $HTML/index.html "$PUB/$BOOK".zip""