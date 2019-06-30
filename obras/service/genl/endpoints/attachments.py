from flask import send_from_directory
from flask_restplus import Resource

import custom
from genl.restplus import api

ns = api.namespace("attachments", description="Get saved static files")


@ns.route("/<path:filename>")
@api.response(404, "Attachment not found.")
class FileItem(Resource):
    def get(self, filename):
        return send_from_directory(custom.FILE_STORAGE, filename)
