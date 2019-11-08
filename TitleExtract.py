# Import Modules
import json
import urllib2
import subprocess

# Collect and parse Icecast JSON array
data_file = urllib2.urlopen('http://radio.domain.com:8000/status-json.xsl')
parsed_json = json.load(data_file)
title = json.dumps(parsed_json["icestats"]["source"]["title"], indent=4)
listeners = json.dumps(parsed_json["icestats"]["source"]["listeners"], indent=4)

title = title.replace('"','')

t = open('title.txt','w')
t.write(title)
t.close()

l = open('listeners.txt','w')
l.write(listeners)
l.close()
