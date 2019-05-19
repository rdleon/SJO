import dal.studs
from flask import request
from flask_restplus import Resource
from genl.restplus import api


ns = api.namespace('contracts',
                    description='Operations related to contracts')


@ns.route('/<int:contract_id>')
@api.response(404, 'Contract not found.')
class ContractItem(Resource):

    def get(self, contract_id):
        """
        Returns a contract.
        """
        entity = dal.studs.find_contract(contract_id)
        return entity

    @api.response(204, 'Contract successfully updated.')
    def put(self, contract_id):
        """
        Updates a contract.
        """
        req = request.data
        dic_req = json.loads(req)
        dic_req['contract_id'] = contract_id
        dal.studs.edit_contract(**dic_req)
        return None, 204

    @api.response(204, 'Contract successfully deleted.')
    def delete(self, contract_id):
        """
        Deletes a contract.
        """
        dal.studs.block_contract(contract_id)
        return None, 204
