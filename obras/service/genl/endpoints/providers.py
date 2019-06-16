from flask import json, request
from flask_restplus import Resource

import dal.provider
from genl.restplus import api
from misc.helper import get_search_params
from misc.helperpg import EmptySetError

ns = api.namespace("providers", description="Operations related to providers")


@ns.route("/")
class ProviderCollection(Resource):
    @api.marshal_list_with(dal.provider.model)
    @api.param("offset", "From which record to start recording, used for pagination")
    @api.param("limit", "How many records to return")
    @api.param("order_by", "Which field use to order the providers")
    @api.param("order", "ASC or DESC, which ordering to use")
    @api.param("title", "Terms to filter in the title for")
    @api.param("description", "Terms to filter in the description")
    def get(self):
        """
        Returns list of providers.
        """
        offset = request.args.get("offset", 0)
        limit = request.args.get("limit", 10)
        order_by = request.args.get("order_by", "id")
        order = request.args.get("order", "ASC")

        search_params = get_search_params(request.args, ["title", "description"])

        return dal.provider.paged(offset, limit, order_by, order, search_params)

    @api.response(201, "Provider successfully created.")
    @api.expect(dal.provider.model)
    def post(self):
        """
        Creates a new provider.
        """
        provider = json.loads(request.data)
        dal.provider.create(**provider)

        return provider, 201


@ns.route("/count")
class ProvidersCount(Resource):
    @api.param("title", "Terms to filter in the title for")
    @api.param("description", "Terms to filter in the description")
    def get(self):
        search_params = get_search_params(request.args, ["title", "description"])

        try:
            count = dal.provider.count(search_params)
        except EmptySetError:
            count = 0

        return {"count": count}


@ns.route("/<int:provider_id>")
@api.response(404, "Provider not found.")
class ProviderItem(Resource):
    @api.marshal_with(dal.provider.model)
    def get(self, provider_id):
        """
        Returns a provider.
        """
        try:
            provider = dal.provider.find(provider_id)
        except EmptySetError:
            return {"message": "Provider not found"}, 404

        return provider

    @api.response(204, "Provider successfully updated.")
    @api.expect(dal.provider.model)
    def put(self, provider_id):
        """
        Updates a provider.
        """
        provider = json.loads(request.data)
        provider["id"] = provider_id
        dal.provider.edit(**provider)

        return None, 204

    @api.response(204, "Provider successfully deleted.")
    def delete(self, provider_id):
        """
        Deletes a provider.
        """
        dal.provider.block(provider_id)

        return None, 204
