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


## License

The scripts and Dockerfile are licensed under the GPL-3.0 license.

The Dockerfile was made with refrences from :

[tomsik68/docker-xampp](https://github.com/tomsik68/docker-xampp) unlicensed and [fuyuanli/Dockerfile-XAMPP](https://github.com/fuyuanli/Dockerfile-XAMPP) which is licensed under GPL v3.0.
