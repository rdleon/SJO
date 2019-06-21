from flask import current_app, send_from_directory
from flask_restplus import Resource

from genl.restplus import api

ns = api.namespace("attachments", description="Get saved static files")


@ns.route("/<path:filename>")
@api.response(404, "Attachment not found.")
class FileItem(Resource):
    def get(self, filename):
        return send_from_directory(current_app.config["FILE_STORAGE"], filename)
