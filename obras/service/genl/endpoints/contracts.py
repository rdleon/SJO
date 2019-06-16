from flask import json, request
from flask_restplus import Resource

import dal.contract
from genl.restplus import api
from misc.helper import get_search_params
from misc.helperpg import EmptySetError

ns = api.namespace("contracts", description="Operations related to contracts")


@ns.route("/")
class ContractCollection(Resource):
    @api.marshal_list_with(dal.contract.model)
    @api.param("offset", "From which record to start recording, used for pagination")
    @api.param("limit", "How many records to return")
    @api.param("order_by", "Which field use to order the providers")
    @api.param("order", "ASC or DESC, which ordering to use")
    @api.param("title", "Terms to filter in the title for")
    @api.param("description", "Terms to filter in the description")
    @api.param("number", "The number of the contract")
    def get(self):
        """
        Returns list of contracts.
        """
        offset = request.args.get("offset", 0)
        limit = request.args.get("limit", 10)
        order_by = request.args.get("order_by", "id")
        order = request.args.get("order", "ASC")

        search_params = get_search_params(
            request.args, ["title", "description", "number"]
        )

        contractList = dal.contract.page(offset, limit, order_by, order, search_params)

        return contractList

    @api.response(201, "Contract successfully created.")
    @api.expect(dal.contract.model)
    @api.marshal_with(dal.contract.model)
    def post(self):
        """
        Creates a new contract.
        """
        contract = json.loads(request.data)
        dal.contract.create(**contract)

        return contract, 201


@ns.route("/count")
class ContractCount(Resource):
    @api.param("title", "Terms to filter in the title for")
    @api.param("description", "Terms to filter in the description")
    @api.param("number", "The number of the contract")
    def get(self):
        search_params = get_search_params(
            request.args, ["title", "description", "number"]
        )
        try:
            count = dal.contract.count(search_params)
        except EmptySetError:
            count = 0

        return {"count": count}


@ns.route("/<int:contract_id>")
@api.response(404, "Contract not found.")
class ContractItem(Resource):
    @api.marshal_with(dal.contract.model)
    def get(self, contract_id):
        """
        Returns a contract.
        """
        try:
            contract = dal.contract.find(contract_id)
        except EmptySetError:
            return {"message": "Contract not found"}, 404

        return contract

    @api.response(200, "Contract successfully updated.")
    @api.expect(dal.contract.model)
    @api.marshal_with(dal.contract.model)
    def put(self, contract_id):
        """
        Updates a contract.
        """
        contract = json.loads(request.data)
        contract["id"] = contract_id
        dal.contract.edit(**contract)

        return contract, 200

    @api.response(204, "Contract successfully deleted.")
    def delete(self, contract_id):
        """
        Deletes a contract.
        """
        dal.contract.block(contract_id)

        return None, 204
