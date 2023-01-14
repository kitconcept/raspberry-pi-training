# Using APT Package Management

## Install Package

```
apt install <package-name>
```

## List all installed packages


````
apt list --installed
````

## Search for an installed package

If you want to search if the package "nginx" is installed:

````
apt list --installed | grep nginx
````

## Remove Package


````
apt remove <package-name>
````
