from flask import json, request
from flask_restplus import Resource, fields

import dal.contract
from genl.restplus import api

contract_model = api.model(
    "Contract Model",
    {
        "id": fields.Integer(description="The unique identifier"),
        "number": fields.String(required=True, description="Number of contract"),
        "title": fields.String(required=True, description="Name of contract"),
        "description": fields.String(required=True, description="Desc of contract"),
        "provider": fields.Integer(required=True, description="Id of privider"),
        "delivery_stage": fields.Integer(
            required=True, description="Delivery stage of contract"
        ),
        "initial_contracted_amount": fields.Float(
            required=True, description="Initial contracted amount of contract"
        ),
        "kickoff": fields.Date(
            required=True, description="Start date of project according to contract"
        ),
        "ending": fields.Date(
            required=True, description="End date of project according to contract"
        ),
        "down_payment": fields.DateTime(required=True, description="Down payment date"),
        "down_payment_amount": fields.Float(
            required=True, description="Down payment amount"
        ),
        "ext_agreement": fields.Date(
            required=True, description="Date of the economic expansion agreement"
        ),
        "ext_agreement_amount": fields.Float(
            required=True, description="Amount of the economic expansion agreement"
        ),
        "final_contracted_amount": fields.Float(
            required=True, description="Final contracted amount"
        ),
        "total_amount_paid": fields.Float(
            required=True, description="Total amount paid"
        ),
        "outstanding_down_payment": fields.Float(
            required=True, description="Outstanding down payment"
        ),
        "inceptor_uuid": fields.String(required=True, description="uuid creator"),
    },
)


ns = api.namespace("contracts", description="Operations related to contracts")


@ns.route("/")
class ContractCollection(Resource):
    @api.marshal_list_with(contract_model)
    def get(self):
        """
        Returns list of contracts.
        """
        offset = request.args.get("offset", 0)
        limit = request.args.get("limit", 10)
        order_by = request.args.get("order_by", "id")
        order = request.args.get("order", "ASC")

        contractList = dal.contract.page(offset, limit, order_by, order)

        return contractList

    @api.response(201, "Contract successfully created.")
    @api.expect(contract_model)
    @api.marshal_with(contract_model)
    def post(self):
        """
        Creates a new contract.
        """
        contract = json.loads(request.data)
        dal.contract.create(**contract)

        return contract, 201


@ns.route("/<int:contract_id>")
@api.response(404, "Contract not found.")
class ContractItem(Resource):
    @api.marshal_with(contract_model)
    def get(self, contract_id):
        """
        Returns a contract.
        """
        entity = dal.contract.find(contract_id)

        return entity

    @api.response(200, "Contract successfully updated.")
    @api.expect(contract_model)
    @api.marshal_with(contract_model)
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
