FROM python:3.7-alpine

ENV APP_DIR=/app

COPY service/ $APP_DIR
WORKDIR $APP_DIR

RUN pip3 install -r requirements.txt

EXPOSE 80 443

CMD ["/app/docker-entrypoint.sh"]
