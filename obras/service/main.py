import logging
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    app.logger.debug('HELLO!!!!!!!!!!')
    return "<h1 style='color:blue'>Hello There!</h1>"

if __name__ == "__main__":
    app.run(host='0.0.0.0')
else:
    gunicorn_logger = logging.getLogger("gunicorn.error")
    app.logger.handlers = gunicorn_logger.handlers
    app.logger.setLevel(gunicorn_logger.level)

