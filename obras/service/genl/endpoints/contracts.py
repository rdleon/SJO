import dal.studs
from flask import request, json
from flask_restplus import Resource, fields
from genl.restplus import api


contract_model = api.model('Contract Model', {
    'id':                       fields.Integer(description='The unique identifier'),
    'number':                   fields.String(required=True, description='Number of contract'),
    'title':                    fields.String(required=True, description='Name of contract'),
    'description':              fields.String(required=True, description='Desc of contract'),
    'provider':                 fields.Integer(required=True, description='Id of privider'),
    'delivery_stage':           fields.Integer(required=True, description='Delivery stage of contract'),
    'initial_contracted_amount':fields.Float(required=True, description='Initial contracted amount of contract'),
    'kickoff':                  fields.Date(required=True, description='Start date of project according to contract'),
    'ending':                   fields.Date(required=True, description='End date of project according to contract'),
    'down_payment':             fields.DateTime(required=True, description='Down payment date'),
    'down_payment_amount':      fields.Float(required=True, description='Down payment amount'),
    'ext_agreement':            fields.Date(required=True, description='Date of the economic expansion agreement'),
    'ext_agreement_amount':     fields.Float(required=True, description='Amount of the economic expansion agreement'),
    'final_contracted_amount':  fields.Float(required=True, description='Final contracted amount'),
    'total_amount_paid':        fields.Float(required=True, description='Total amount paid'),
    'outstanding_down_payment': fields.Float(required=True, description='Outstanding down payment'),
    'inceptor_uuid':            fields.String(required=True, description='uuid creator')
})


ns = api.namespace('contracts',
                    description='Operations related to contracts')


@ns.route('/')
class ContractCollection(Resource):

    @api.response(201, 'Contract successfully created.')
    @api.expect(contract_model)
    def post(self):
        """
        Creates a new contract.
        """
        req = request.data
        dic_req = json.loads(req)
        dal.studs.create_contract(**dic_req)
        return None, 201

    @api.marshal_list_with(contract_model)
    def get(self):
        """
        Returns list of contracts.
        """
        mask = request.headers.get('X-Fields')
        param = mask.split(',')
        
        contractList = dal.studs.page_contracts( param[0], param[1], param[2], param[3] )
        print(contractList)
        #Pending return
        return contractList



@ns.route('/<int:contract_id>')
@api.response(404, 'Contract not found.')
class ContractItem(Resource):

    def get(self, contract_id):
        """
        Returns a contract.
        """
        
        entity = dal.studs.find_contract(contract_id)

        entity["ext_agreement"] = entity["ext_agreement"].strftime("%Y-%m-%d")
        entity["kickoff"]       = entity["kickoff"].strftime("%Y-%m-%d")
        entity["down_payment"]  = entity["down_payment"].strftime("%Y-%m-%d")
        entity["ending"]        = entity["ending"].strftime("%Y-%m-%d")
        
        return entity

    @api.response(204, 'Contract successfully updated.')
    @api.expect(contract_model)
    def put(self, contract_id):
        """
        Updates a contract.
        """
        req = request.data
        dic_req = json.loads(req)
        dic_req['id'] = contract_id
        dal.studs.edit_contract(**dic_req)
        return None, 204

    @api.response(204, 'Contract successfully deleted.')
    def delete(self, contract_id):
        """
        Deletes a contract.
        """
        dal.studs.block_contract(contract_id)
        return None, 204

