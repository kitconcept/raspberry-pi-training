# Simple HTTP Server

Start a simple webserver on the Raspberry Pi:

```
python3 -m http.server
```

Type the IP address with the Port 8000 into your browser:

`````
192.168.0.1:8000
`````

You should see the file system of the Raspberry Pi in your webbrowser.

# Server a simple Hello World HTML page

Create a folder you want to serve:

````
mkdir /srv/
````

Create an HTML file "index.html" with the following content within the "srv" directory:

````
<h1>Hello World</h1>
````

Safe the file and start the Python webserver in that directory.

Go to your browser and you will see a "Hello World" web page.
