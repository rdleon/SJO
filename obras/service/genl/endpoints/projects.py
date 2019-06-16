import json

from flask import request
from flask_restplus import Resource

import dal.project
from genl.restplus import api
from misc.helper import get_search_params
from misc.helperpg import EmptySetError

ns = api.namespace("projects", description="Operations related to projects")


@ns.route("/")
class ProjectsCollection(Resource):
    @api.marshal_list_with(dal.project.model)
    @api.param("offset", "From which record to start recording, used for pagination")
    @api.param("limit", "How many records to return")
    @api.param("order_by", "Which field use to order the projects")
    @api.param("order", "ASC or DESC, which ordering to use")
    @api.param("title", "Terms to filter in the title for")
    @api.param("description", "Terms to filter in the description")
    def get(self):
        """
        Returns list of projects.
        """
        offset = request.args.get("offset", 0)
        limit = request.args.get("limit", 10)
        order_by = request.args.get("order_by", "id")
        order = request.args.get("order", "ASC")

        search_params = get_search_params(request.args, ["title", "description"])

        return dal.project.paged(offset, limit, order_by, order, search_params)

    @api.response(201, "Provider successfully created.")
    @api.expect(dal.project.model)
    @api.marshal_with(dal.project.model)
    def post(self):
        """
        Creates a new provider.
        """
        project = json.loads(request.data)
        dal.project.create(**project)

        return project, 201


@ns.route("/count")
class ProjectCount(Resource):
    @api.param("title", "Terms to filter in the title for")
    @api.param("description", "Terms to filter in the description")
    def get(self):
        search_params = get_search_params(request.args, ["title", "description"])
        try:
            count = dal.project.count(search_params)
        except EmptySetError:
            count = 0

        return {"count": count}


@ns.route("/with_follow_up")
class ProjectsWithFollowUpCollection(Resource):
    @api.param("offset", "From which record to start recording, used for pagination")
    @api.param("limit", "How many records to return")
    def get(self):
        offset = request.args.get("offset", 0)
        limit = request.args.get("limit", 0)

        return dal.project.paged_with_follow_ups(offset, limit)


@ns.route("/with_follow_up/count")
class ProjectsWithFollowUpCount(Resource):
    def get(self):
        return dal.project.paged_with_follow_ups_count()


@ns.route("/<int:project_id>")
@api.response(404, "Project not found.")
class ProjectItem(Resource):
    @api.marshal_with(dal.project.model)
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
    @api.expect(dal.project.model)
    def put(self, project_id):
        """
        Updates a project.
        """
        project = json.loads(request.data)
        project["id"] = project_id
        dal.project.edit(**project)

        return None, 204

    @api.response(204, "Project successfully deleted.")
    def delete(self, project_id):
        """
        Deletes a project.
        """
        dal.project.block(project_id)

        return None, 204
