#!/bin/sh -e

echo "Creating database..."

DATABASE=postgres://$POSTGRES_USER:$POSTGRES_PASSWORD@pg:$POSTGRES_PORT
echo "CREATE DATABASE $POSTGRES_DB "| psql $DATABASE?sslmode=disable
migrate --path=/migrations/ \
--database $DATABASE/$POSTGRES_DB?sslmode=disable up
