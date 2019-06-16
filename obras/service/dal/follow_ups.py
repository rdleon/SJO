from flask_restplus import fields

from genl.restplus import api

from .entity import count_entities, delete_entity, find_entity, page_entities
from .helper import run_store_procedure

model = api.model(
    "Follow Up Model",
    {
        "id": fields.Integer(description="The unique db identifier"),
        "project": fields.Integer(required=True, description="Id of project"),
        "verified_progress": fields.Integer(),
        "financial_advance": fields.Integer(),
        "img_paths": fields.String(),
        "check_stage": fields.Integer(),
        "check_date": fields.Date(),
        "inceptor_uuid": fields.String(required=True, description="UUID of creator"),
    },
)


def _alter_follow_ups(**kwargs):
    """Calls a store procedure to create or edit a follow up record"""
    sql = """SELECT * FROM alter_follow_ups(
    {}::integer,
    {}::integer,
    {}::smallint,
    {}::smallint,
    '{}'::text,
    {}::integer,
    '{}'::date,
    '{}'::character varying
    )
    AS result(rc integer, msg text)""".format(
        kwargs["id"],
        kwargs["project"],
        kwargs["verified_progress"],
        kwargs["financial_advance"],
        kwargs["img_paths"],
        kwargs["check_stage"],
        kwargs["check_date"],
        kwargs["inceptor_uuid"],
    )

    return run_store_procedure(sql)


def create(**kwargs):
    """Creates follow up entity"""
    kwargs["id"] = 0
    return _alter_follow_ups(**kwargs)


def edit(**kwargs):
    return _alter_follow_ups(**kwargs)


def block(follow_up_id):
    """Logical deletion of a follow up"""
    delete_entity("follow_ups", follow_up_id)


def find(follow_up_id):
    return find_entity("follow_ups", follow_up_id)


def count(search_params=None):
    """Returns the number of non-logically deleted follow-ups"""
    return count_entities("follow_ups", search_params)


def paged(page, size, order_by, asc, search_params=None):
    return page_entities("follow_ups", page, size, order_by, asc, search_params)
