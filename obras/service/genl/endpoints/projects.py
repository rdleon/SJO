import json

from flask import request
from flask_restplus import Resource, fields

import dal.project
from genl.restplus import api
from misc.helperpg import EmptySetError

ns = api.namespace("projects", description="Operations related to projects")

project_model = api.model(
    "Project Model",
    {
        "id": fields.Integer(required=True, description="Unique identifier"),
        "title": fields.String(required=True, description="Project name"),
        "description": fields.String(
            required=True, description="Short description of the project"
        ),
        "city": fields.Integer(required=True, description="DB id of the city"),
        "category": fields.Integer(required=True, description="DB id of the category"),
        "department": fields.Integer(
            required=True, description="DB id of the department"
        ),
        "budget": fields.Integer(required=True, description="DB id of the budget"),
        "contract": fields.Integer(required=True, description="DB id of the contract"),
        "planed_kickoff": fields.Date(
            required=True, description="When the project is planned to start"
        ),
        "planed_ending": fields.Date(
            required=True, description="When the project is planned to end"
        ),
        "inceptor_uuid": fields.String(
            required=True, description="UUID of the user who created the project"
        ),
    },
)


@ns.route("/")
class ProjectsCollection(Resource):
    @api.marshal_list_with(project_model)
    @api.param("offset", "From which record to start recording, used for pagination")
    @api.param("limit", "How many records to return")
    @api.param("order_by", "Which field use to order the providers")
    @api.param("order", "ASC or DESC, which ordering to use")
    def get(self):
        """
        Returns list of providers.
        """
        offset = request.args.get("offset", 0)
        limit = request.args.get("limit", 10)
        order_by = request.args.get("order_by", "id")
        order = request.args.get("order", "ASC")

        return dal.project.paged(offset, limit, order_by, order)

    @api.response(201, "Provider successfully created.")
    @api.expect(project_model)
    @api.marshal_with(project_model)
    def post(self):
        """
        Creates a new provider.
        """
        project = json.loads(request.data)
        dal.project.create(**project)

        return project, 201


@ns.route("/count")
class ProjectCount(Resource):
    def get(self):
        try:
            count = dal.project.count()
        except EmptySetError:
            count = 0

        return {"count": count}


@ns.route("/<int:project_id>")
@api.response(404, "Project not found.")
class ProjectItem(Resource):
    @api.marshal_with(project_model)
    def get(self, project_id):
        """
        Returns a project.
        """
        try:
            project = dal.project.find(project_id)
        except EmptySetError:
            return {"message": "Project not found"}, 404

        return project

    @api.response(204, "Project successfully updated.")
    @api.expect(project_model)
    def put(self, project_id):
        """
        Updates a project.
        """
        project = json.loads(request.data)
        project["project_id"] = project_id
        dal.project.edit(**project)

        return None, 204

    @api.response(204, "Project successfully deleted.")
    def delete(self, project_id):
        """
        Deletes a project.
        """
        dal.project.block(project_id)

        return None, 204
