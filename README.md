This image is intended for **PHP+MySQL** development. 
**Both MySQL and phpmyadmin use default XAMPP password**.


## Running the image:

This image uses /www directory for your page files, so you need to mount it.

```
docker run --name myXampp -p 81:80 -p 3306:3306 -d -v ~/my_web_pages:/www cleberjsantos/docker-xampp
```
