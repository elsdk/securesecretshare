#!/usr/bin/env bash

# Usage:
# ./deploy/heroku.sh <heroku-app-name>

APP_NAME=$1

npm list | grep heroku || npm install -g heroku
heroku login -i
heroku container:login
heroku container:push web -a "${APP_NAME}"
heroku container:release web -a "${APP_NAME}"
