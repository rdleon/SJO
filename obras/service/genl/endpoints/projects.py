import json

from flask import request
from flask_restplus import Resource

import dal.project
from genl.restplus import api

ns = api.namespace("projects", description="Operations related to projects")


@ns.route("/<int:project_id>")
@api.response(404, "Project not found.")
class ProjectItem(Resource):
    def get(self, project_id):
        """
        Returns a project.
        """
        entity = dal.project.find(project_id)
        return entity

    @api.response(204, "Project successfully updated.")
    def put(self, project_id):
        """
        Updates a project.
        """
        req = request.data
        dic_req = json.loads(req)
        dic_req["project_id"] = project_id
        dal.project.edit(**dic_req)

        return None, 204

    @api.response(204, "Project successfully deleted.")
    def delete(self, project_id):
        """
        Deletes a project.
        """
        dal.project.block(project_id)
        return None, 204
