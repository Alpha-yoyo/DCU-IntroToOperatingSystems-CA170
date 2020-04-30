#!/bin/sh

img=$1 #assign 1st command-line argument to a variable "img"

wget -q -O - "https://api.flickr.com/services/feeds/photos_public.gne?format=json&tags=$img" | grep "description" | sed -e 's/\<description\>//g' | tr -d '\\' | grep -o '<p>.*</p>' > $HOME/public_html/flickr.html

#Download URL, quiet, output to command-line
#Then send the output to grep, it searches everything that contains the word "description"
#It is then piped into sed, were "-e" is to add the script to the commands to be executed, removing the word "description"
#The output that we got from sed is then piped to tr, were it deletes everything that contains this special characters: "\"
#Finally the output is piped into grep. The grep search for strings that only match the first part "<p>" and the last part "</p>"
#Then I send the output into $HOME/public_html/flickr.html
