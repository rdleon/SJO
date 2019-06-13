from flask_restplus import fields

from genl.restplus import api

from .entity import count_entities, delete_entity, find_entity, page_entities
from .helper import run_store_procedure

model = api.model(
    "Provider Model",
    {
        "id": fields.Integer(description="The unique identifier"),
        "title": fields.String(required=True, description="Name of provider"),
        "description": fields.String(required=True, description="Desc of provider"),
        "inceptor_uuid": fields.String(required=True, description="uuid creator"),
    },
)


def _alter_provider(**kwargs):
    """Calls sp in charge of create and edit a provider"""
    sql = """SELECT * FROM alter_provider(
        {}::integer,
        '{}'::character varying,
        '{}'::character varying,
        '{}'::character varying)
        AS result( rc integer, msg text )""".format(
        kwargs["id"], kwargs["title"], kwargs["description"], kwargs["inceptor_uuid"]
    )
    return run_store_procedure(sql)


def block(provider_id):
    """Logical deletion of a provider entity"""
    delete_entity("providers", provider_id)


def find(provider_id):
    """Find a provider as per id"""
    ent = find_entity("providers", provider_id)
    attributes = set(["id", "title", "description", "inceptor_uuid"])
    return {attr: ent[attr] for attr in attributes}


def count(search_params):
    """Number of non logical deleted providers"""
    return count_entities("providers", search_params)


def paged(offset, limit, order_by, order, search_params):
    return page_entities("providers", offset, limit, order_by, order, search_params)


def edit(**kwargs):
    """Edits the allowed properties of a provider entity"""
    return _alter_provider(**kwargs)


def create(**kwargs):
    """Creates a provider entity"""
    kwargs["id"] = 0
    return _alter_provider(**kwargs)
