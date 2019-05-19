import dal.studs
from flask import request
from flask_restplus import Resource
from genl.restplus import api


ns = api.namespace('providers',
                    description='Operations related to providers')


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
    def put(self, provider_id):
        """
        Updates a provider.
        """
        req = request.data
        dic_req = json.loads(req)
        dic_req['provider_id'] = provider_id
        dal.studs.edit_provider(**dic_req)
        return None, 204

    @api.response(204, 'Provider successfully deleted.')
    def delete(self, provider_id):
        """
        Deletes a provider.
        """
        dal.studs.block_provider(provider_id)
        return None, 204
