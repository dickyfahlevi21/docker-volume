# Dockerhub link BE
https://hub.docker.com/repository/docker/dickyfahlevi21/be-simplewms
```bash
tag 1.1.0
```

## Step:

***Cara buat Docker Image, Docker container, Tag, dan push***
\
[Docker Documentataion](https://github.com/dickyfahlevi21/docker-doc)

***Cara pull mysql, akses mysql dari docker, buat db, buat network, dan connect network***
\
[Mysql Documentataion](https://github.com/dickyfahlevi21/mysql-doc)


***Install Docker-compose***
[Documentation Install Docker-compose](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04)

lalu buat ***docker-compose.yml***, dan import code berikut
```docker-compose.yml
version: "3.7"
services:
    mysql:
        container_name: mysql-compose
        image: mysql:latest
        environment: 
            - MYSQL_ROOT_PASSWORD=password
            - MYSQL_DATABASE=database_development
        ports:
            - 4444:3306
        networks:
            - network1
    be-simplewms:
        container_name: "be-simplewms"
        image: dickyfahlevi21/be-simplewms:1.0.0
        ports:
            - 5555:3000
        depends_on: 
            - mysql
        networks: 
            - network1

networks: 
    network1:
        name: network1
```

lalu run docker-compose tersebut dengan command berikut
```bash
docker-compose up --build
```

tetapi apabila mau run tanpa melihat log tersebut, jalankan command berikut
```bash
docker-compose up -d
```

langkah untuk masuk dan migrate secara manual 
```bash
docker exec -it [container id] bash
```

setelah masuk ke ***root@1753e3ba629c:/usr/src/app#***
\
lalu jalankan command berikut untuk migrate databasenya yang sudah dibuat
```bash
npx sequelize-cli db:migrate
```

# Backend Simple WMS

## Mockups Design: [FIGMA](https://www.figma.com/file/xZU0wwbhsbLdGLpCO6QFCP/Vuex?node-id=19%3A48)

## Api Documentation

-
-
-

### Sign Up

![SIGN UP](./asset/img/signup.jpeg)

### Login

![LOGIN](./asset/img/login.jpeg)

-
-
-

# GET

## Note: Untuk Endpoint dibawah ini, butuh 'token' Authorization dari login

-

### Get All Products

![Get All Products](./asset/img/get-all-products.jpeg)

### Get All Products IN

![Get All Products IN](./asset/img/get-all-products-in.jpeg)

### Get All Products OUT

![Get All Products OUT](./asset/img/get-all-products-out.jpeg)

### Get User By id

![Get User By id](./asset/img/get-user-by-id.jpeg)

### Get Products By id

![Get Products By id](./asset/img/get-product-by-id.jpeg)

### Get Products IN By id

![Get Products IN By id](./asset/img/get-product-in-by-id.jpeg)

### Get Products OUT By id

![Get Products OUT By id](./asset/img/get-product-out-by-id.jpeg)

-
-
-

# POST

### POST User

![POST User](./asset/img/post-user.jpeg)

### POST Product

![POST Product](./asset/img/post-product.jpeg)

### POST Product IN

![POST Product IN](./asset/img/post-product-in.jpeg)

### POST Product OUT

![POST Product OUT](./asset/img/post-product-out.jpeg)

-
-
-

# PUT

### PUT - Update User By Id

![PUT - Update User By Id](./asset/img/put-user-by-id.jpeg)

### PUT - Update Product By Id

![PUT - Update Product By Id](./asset/img/put-product-by-id.jpeg)

### PUT - Update Product IN By Id

![PUT - Update Product IN By Id](./asset/img/put-product-in-by-id.jpeg)

### PUT - Update Product OUT By Id

![PUT - Update Product OUT By Id](./asset/img/put-product-out-by-id.jpeg)

-
-
-

# DELETE

### DELETE User By id

![DELETE User By id](./asset/img/delete-user-by-id.jpeg)

### DELETE Product By id

![DELETE Product By id](./asset/img/delete-product-by-id.jpeg)

### DELETE Product IN By id

![DELETE Product IN By id](./asset/img/delete-product-in-by-id.jpeg)

### DELETE Product OUT By id

![DELETE Product OUT By id](./asset/img/delete-product-out-by-id.jpeg)

-
-
-

# HIT Endpoint for Download

### Download Laporan Product IN

![Download Laporan Product IN](./asset/img/laporan-product-in.jpeg)

### Download Laporan Product OUT

![Download Laporan Product OUT](./asset/img/laporan-product-out.jpeg)

### Download Laporan Product ALL

![Download Laporan Product ALL](./asset/img/laporan-product-all.jpeg)
