#!/bin/bash

#######################################################################
# Thanks for checking out my Iceast update scripts. This is my first
# bash and python combo. These are quite primitive but they do the job.
# Just edit what you need. Most of it should be at the top.
#
# Packages to install
# sudo apt-get install python2
#
# pip install json
# pip install urllib2
#
# Hope you enjoy!
#
#######################################################################

# What directory is your web site in?
WebsiteDirectory='/var/sentora/hostdata/zadmin/public_html/distorted_io'

# What is the name of the HTML file to update?
WebsiteFilename='radio.html'

# What is the line number for the title?
TitleLineNumber=89s

# What is the line number for the number of listeners?
ListenersLineNumber=92s

#######################################################################
# You should not have to edit below this line.
#######################################################################

# Script Variables (WARNING: Do not edit!)
# HTMLtoUpdate=$("$WebsiteDirectory/$HTMLFilename")

# Collect data from Icecast server
# Declare Variables
python "$WebsiteDirectory/TitleExtract.py"

# Pull data from Python output
TitleImport=$(cat "$WebsiteDirectory/title.txt")
listenersImport=$(cat "$WebsiteDirectory/listeners.txt")

# Remask the output
title=$(echo "</h2>$TitleImport</h2>")
listeners=$(echo "There are currently $listenersImport listeners.")

# Insert into HTML
sed -i "$TitleLineNumber,.*,$title,g" "$WebsiteDirectory/$WebsiteFilename"
sed -i "$ListenersLineNumber,.*,$listeners,g" "$WebsiteDirectory/$WebsiteFilename"
