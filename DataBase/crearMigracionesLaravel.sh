#!/bin/bash

##Cambiar la ruta para vuestro equipo
cd /mnt/c/Users/bakuk/Documents/Docker/appname

##Nombre de las tablas
declare -a tablas=('debitCard' 'customer' 'cities' 'bill' 'address' 'events'
 'creditCard' 'marathones' 'Halls' 'movies_trailers' 'movies' 
'paymentmethods' 'payments' 'PosterLink' 'posters' 'purchaseHistories'
 'Seats' 'stores' 'tickets' 'trailers');

##Bucle for para crear las migraciones
for i in "${tablas[@]}"
do
    php artisan make:model $i -mrc
done
