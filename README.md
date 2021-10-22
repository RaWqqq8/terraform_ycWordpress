# Подготовка облачной инфраструктуры для последующей установки Wordpress - YandexCloud

### Список манифестов

* 'db.tf',
* 'description',
* 'lb.tf',
* 'network.tf',
* 'output.tf',
* 'provider.tf',
* 'variables.tf',
* 'wp-app.tf',
* 'wp.auto.tfvars'


***

## Подключение
### В манифесте **provider.tf** укаазан провайдер для YandexCloud

### В манифесте  **variables.tf** указаны переменные для авторизации. Сами ~~пароли~~ указываем в **wp.auto.tfvars**

## Создание сети
### Манифест **network.tf** создает 3 подсети в разных зонах. (zone=A, zone=B, zone=C) 

## Создание VM
### Манифест **wp-app.tf** создает **две** VM Ubuntu 18.04

## Балансировщик трафика
###Манифест **lb.tf** создает два ресурса на 80 порту для направления трафика 


### Манифест  **db.tf создаст PostgresSQL и подключет кластер баз данных. 

