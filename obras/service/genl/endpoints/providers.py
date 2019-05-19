import dal.studs
from flask import request, json
from flask_restplus import Resource, fields
from genl.restplus import api


provider_model = api.model('Provider Model', {
    'id': fields.Integer(description='The unique identifier'),
    'title': fields.String(required=True, description='Name of provider'),
    'description': fields.String(required=True, description='Desc of provider'),
    'inceptor_uuid': fields.String(required=True, description='uuid creator')
})


ns = api.namespace('providers',
                    description='Operations related to providers')


@ns.route('/')
class ProviderCollection(Resource):

    @api.response(201, 'Provider successfully created.')
    @api.expect(provider_model)
    def post(self):
        """
        Creates a new provider.
        """
        req = request.data
        dic_req = json.loads(req)
        dal.studs.create_provider(**dic_req)
        return None, 201

    @api.marshal_list_with(provider_model)
    def get(self):
        """
        Returns list of providers.
        """
        entities = dal.studs.fetch_providers()
        return entities


@ns.route('/<int:provider_id>')
@api.response(404, 'Provider not found.')
class ProviderItem(Resource):

    def get(self, provider_id):
        """
        Returns a provider.
        """
        entity = dal.studs.find_provider(provider_id)
        return entity

    @api.response(204, 'Provider successfully updated.')
    @api.expect(provider_model)
    def put(self, provider_id):
        """
        Updates a provider.
        """
        req = request.data
        dic_req = json.loads(req)
        dic_req['id'] = provider_id
        dal.studs.edit_provider(**dic_req)
        return None, 204

    @api.response(204, 'Provider successfully deleted.')
    def delete(self, provider_id):
        """
        Deletes a provider.
        """
        dal.studs.block_provider(provider_id)
        return None, 204
