#!/bin/bash

echo "Starting the Single Sign On on port $PORT..."

echo -n "Waiting for database on :$POSTGRES_PORT"

while ! nc -z pg $POSTGRES_PORT; do
	echo -n "."
	sleep 0.5
done

exec $APP_DIR/bin/migrate -path migrations/\
   	-database postgresql://$POSTGRES_USER:$POSTGRES_PASSWORD@$POSTGRES_HOST:$POSTGRES_PORT/$POSTGRES_DB

exec $APP_DIR/src/sso/server
