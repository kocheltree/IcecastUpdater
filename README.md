I wanted to know how I could pull an artist name and number of listeners from an Icecast server to update a website with. I don't know any PHP so I basically wrote this script to pull a JSON query from the Icecast server and update a static HTML page with the values. This is my first python script.

The only challenge I really ran into was the filesystem permissions. I thought if www-data had permissions over the files, I could write to the /var/www/html/radio.html without any issues, which worked. But, I had trouble getting the cron jobs to run the python script (every 5 minutes). Im 100% the issue is between the keyboard and the chair. 
