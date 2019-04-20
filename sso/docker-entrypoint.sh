#!/bin/bash

echo "Starting the Single Sign On on port $PORT..."

exec $APP_DIR/src/sso/server
