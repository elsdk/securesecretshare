#!/usr/bin/env bash

npm list | grep heroku || npm install -g heroku
heroku login -i
heroku container:login
heroku container:push web -a secretsmanager
heroku container:release web -a secretsmanager
