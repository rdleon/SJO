from flask_restplus import Resource

from dal.entity import page_entities
from genl.restplus import api

ns = api.namespace("catalogues", description="Read-only catalogues of data")


def _get_100_entities(table_name):
    offset = 0
    limit = 100
    order_by = "id"
    order = "asc"

    search_params = None

    return page_entities(table_name, offset, limit, order_by, order, search_params)


@ns.route("/delivery_stages")
class DeliveryStagesCollection(Resource):
    def get(self):
        return _get_100_entities("delivery_stages")


@ns.route("/categories")
class CategoriesCollection(Resource):
    def get(self):
        return _get_100_entities("categories")


@ns.route("/departments")
class DepartmentsCollection(Resource):
    def get(self):
        return _get_100_entities("departments")


@ns.route("/check_stages")
class CheckStagesCollection(Resource):
    def get(self):
        return _get_100_entities("check_stages")
