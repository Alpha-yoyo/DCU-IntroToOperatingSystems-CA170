#!/bin/sh         

symbol=$1 #assign 1st command-line argument to a variable

wget -q -O - "https://bigcharts.marketwatch.com/quickchart/quickchart.asp?symb=$symbol" | tr -d '\t\n\r' | grep -o 'Last:.*</div></td><td class="change">' | sed 's/[^0-9,.]*//g'

#Download the URL using the given stock symbol from command-line, quiet, output to command-line. 
#Then send the output as an input of 'tr', it delete all newline, tab and carriage return characters.
#The output that we got from 'tr' are then piped into grep. The grep search for strings that only match the first part 'Last:' and the last part "</div></td><td class="change">".
#It is then piped into 'sed' it extract from a string that contains only numbers from 0 to 9 and commas: ',' and decimal points: '.'
