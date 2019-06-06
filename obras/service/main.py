import logging

from flask import Blueprint, Flask

from genl.endpoints import contracts, projects, providers
from genl.restplus import api


def setup_app(flask_app):
    """Setup flask app instance"""
    blueprint = Blueprint("api", __name__, url_prefix="/api/v1")
    api.init_app(blueprint)

    api.add_namespace(providers.ns)
    api.add_namespace(contracts.ns)
    api.add_namespace(projects.ns)

    flask_app.register_blueprint(blueprint)


def create_app():
    app = Flask(__name__)
    setup_app(app)

    return app


if __name__ == "__main__":
    # For the sake of faster development
    app = create_app()
    app.run(host="0.0.0.0")
else:
    # On production It is needed for WSGI
    app = create_app()
    gunicorn_logger = logging.getLogger("gunicorn.error")
    app.logger.handlers = gunicorn_logger.handlers
    app.logger.setLevel(gunicorn_logger.level)
