# Docker_Project

# Prérequis
# Assurez-vous que le port SQL de l'utilisateur soit configuré sur 3302:3302.

# Etape 1

# Création du Network
docker network create pont

# Création de l'image Serveur PHP
docker build -t image-php -f Dockerfile .

# Création de l'image MySQL (création de la base de données)
docker build -t image-mysql -f DockerfileSql .

# Exécution d'un conteneur à partir de l'image MySQL
docker run -d --name container-mysql --network pont -p 3302:3302 image-mysql

# Exécution d'un conteneur à partir de l'image PHP
docker run -d -p 8080:80 --name container-php --network pont --link gestion-produits-mysql:mysql image-php

# Etape 2

# Mise en place de Docker Compose
docker-compose -f docker-compose.yml up -d

# Etape 3

# Avant toute chose, coupez les premiers containers.

# Création de l'image PHP dev
docker build -t dev_image-php -f dev_Dockerfile .

# Création de l'image MySQL dev
docker build -t dev_image-sql -f dev_DockerfileSql .

# Exécution d'un conteneur à partir de l'image MySQL dev
docker run -d --name dev_container-mysql --network pont -p 3302:3302 dev_image-sql

# Exécution d'un conteneur à partir de l'image PHP dev
docker run -d -p 8080:80 --name dev_container-php --network pont --link gestion-produits-mysql:mysql dev_image-php

# Mise en place de Docker Compose
docker-compose -f dev_docker-compose.yml up -d
