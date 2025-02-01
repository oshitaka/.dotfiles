#!/bin/bash

# script template called from ld's nvim config

# Declare colors
red='\033[0;31m'
nc='\033[0m'
yellow='\033[1;33m'

# URL of the webpage
URL="https://altl.io/"

QUOTE="This is a very long string that is greater than 100 characters in length and will cause the loop to continue executing until it is shortened to 100 characters or less."

while [ ${#QUOTE} -gt 100 ]; do
	# Use curl to fetch the webpage content
	CONTENT=$(curl -s "$URL")
	# Use grep to extract the quote text and author
	QUOTE=$(echo "$CONTENT" | xmllint --html --xpath "//div[@class='quote' and @id='quoteText']/text()" - 2>/dev/null)
	# Remove whitespace characters from the output
	QUOTE=$(echo "$QUOTE" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
done

# Print the quote and author
echo $QUOTE



