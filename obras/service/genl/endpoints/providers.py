from flask import json, request
from flask_restplus import Resource, fields

import dal.provider
from genl.restplus import api

provider_model = api.model(
    "Provider Model",
    {
        "id": fields.Integer(description="The unique identifier"),
        "title": fields.String(required=True, description="Name of provider"),
        "description": fields.String(required=True, description="Desc of provider"),
        "inceptor_uuid": fields.String(required=True, description="uuid creator"),
    },
)


ns = api.namespace("providers", description="Operations related to providers")


@ns.route("/")
class ProviderCollection(Resource):
    @api.marshal_list_with(provider_model)
    def get(self):
        """
        Returns list of providers.
        """
        offset = request.args.get("offset", 0)
        limit = request.args.get("limit", 10)
        order_by = request.args.get("order_by", "id")
        order = request.args.get("order", "ASC")

        return dal.provider.paged(offset, limit, order_by, order)

    @api.response(201, "Provider successfully created.")
    @api.expect(provider_model)
    def post(self):
        """
        Creates a new provider.
        """
        provider = json.loads(request.data)
        dal.provider.create(**provider)

        return provider, 201


@ns.route("/<int:provider_id>")
@api.response(404, "Provider not found.")
class ProviderItem(Resource):
    def get(self, provider_id):
        """
        Returns a provider.
        """
        return dal.provider.find(provider_id)

    @api.response(204, "Provider successfully updated.")
    @api.expect(provider_model)
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
