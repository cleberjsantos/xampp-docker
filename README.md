This image is intended for **PHP+MySQL** development, containg an image Ubuntu base 18.04 LTS and the latest XAMPP 7.3.11.
**Both MySQL and phpmyadmin use default XAMPP password**.

## Getting the image:
The image has been pushed to Dockerhub o you can just:

```
docker pull cleberjsantos/xampp
```

## Running the image:

This image uses /www directory for your page files, so you need to mount it.

```
docker run -d -t --name myXampp -p 81:80 -p 3306:3306 -d -v ~/my_web_pages:/www cleberjsantos/xampp
```

The command above will expose the HTTP server (Apache) on port 81 and the MySql (MariaDB) on port 3306.


## Tasting other versions

For tasting other version without have build a new image, you can pass an URL **(XAMPP_URI)** as environment variable.

```
docker run -d -t --name myXampp -p 81:80 -p 3306:3306 -d -v ~/my_web_pages:/www -e XAMPP_URI='https://downloadsapachefriends.global.ssl.fastly.net/7.2.12/xampp-linux-x64-7.2.12-0-installer.run?from_af=true' cleberjsantos/xampp
```

## Building the image from source.:

First, clone this project.

```
$ git clone https://github.com/cleberjsantos/xampp-docker.git
```

Second, change directory to the just now cloned repository.

```
$ docker build -t cleberjsantos/xampp .
```

Optionally, you can passing XAMPP version as argument.

```
$ docker build --build-arg XAMPP_VERSION=7.2.12 -t cleberjsantos/xampp .
```

## License

The scripts and Dockerfile are licensed under the GPL-3.0 license.

The Dockerfile was made with refrences from :

[tomsik68/docker-xampp](https://github.com/tomsik68/docker-xampp) unlicensed and [fuyuanli/Dockerfile-XAMPP](https://github.com/fuyuanli/Dockerfile-XAMPP) which is licensed under GPL v3.0.
