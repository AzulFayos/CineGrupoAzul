#!/bin/bash

php artisan db:wipe --drop-views --force

php artisan migrate
