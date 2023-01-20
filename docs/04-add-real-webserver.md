# 04 - Real Webserver (Nginx)

Install Nginx:

```
sudo apt install nginx
```

# Check hello world page

Type Raspberry Pi IP address into your browser window. You should see the default Nginx page.

todo -> add screenshot here

# Stop/Start/Status Nginx

Stop Nginx:

```
service nginx stop
```

Check Nginx Status:

```
service nginx status
```

Start Nginx:

```
service nginx start
```

# Create Nginx configuration for helloworld.de

Add a new config file "hello-world" to /etc/nginx/sites-available with the following content:

```
server {
	listen 80;
	listen [::]:80;

	server_name helloworld.de;

	root /srv/www;
	index index.html;

	location / {
		try_files $uri $uri/ =404;
	}
}
```

Enable the config in Nginx by creating a symlink to /etc/nginx/sites-enabled:

```
sudo su
cd /etc/nginx/sites-enabled
ln -s ../sites-available .
```

Reload Nginx Configuration:

```
service nginx reload
```

Check output and make sure there are no error traces.

If there is a problem check the Nginx error log with:

```
tail -f /var/log/nginx/error.log
```

Now we have to edit the hosts configuration file on our local machine (not the Raspberry Pi!). Add the following line to your /etc/hosts file:

```
192.168.178.160 helloworld.de
```

Type "helloworld.de" into your browser window.

You should see your hello world HTML page content.
