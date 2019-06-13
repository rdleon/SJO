from flask_restplus import fields

from genl.restplus import api

from .entity import count_entities, delete_entity, find_entity, page_entities
from .helper import run_store_procedure

model = api.model(
    "Project Model",
    {
        "id": fields.Integer(required=True, description="Unique identifier"),
        "title": fields.String(required=True, description="Project name"),
        "description": fields.String(
            required=True, description="Short description of the project"
        ),
        "city": fields.Integer(required=True, description="DB id of the city"),
        "category": fields.Integer(required=True, description="DB id of the category"),
        "department": fields.Integer(
            required=True, description="DB id of the department"
        ),
        "budget": fields.Integer(required=True, description="DB id of the budget"),
        "contract": fields.Integer(required=True, description="DB id of the contract"),
        "planed_kickoff": fields.Date(
            required=True, description="When the project is planned to start"
        ),
        "planed_ending": fields.Date(
            required=True, description="When the project is planned to end"
        ),
        "inceptor_uuid": fields.String(
            required=True, description="UUID of the user who created the project"
        ),
    },
)


def _alter_project(**kwargs):
    """Calls sp in charge of create and edit a project"""
    sql = """select * from alter_project(
        {}::integer,
        '{}'::character varying,
        '{}'::text,
        {}::integer,
        {}::integer,
        {}::integer,
        {}::integer,
        {}::double precision,
        '{}'::date,
        '{}'::date,
        '{}'::character varying)
    AS result( rc integer, msg text )""".format(
        kwargs["id"],
        kwargs["title"],
        kwargs["description"],
        kwargs["city"],
        kwargs["category"],
        kwargs["department"],
        kwargs["contract"],
        kwargs["budget"],
        kwargs["planed_kickoff"],
        kwargs["planed_ending"],
        kwargs["inceptor_uuid"],
    )
    return run_store_procedure(sql)


def create(**kwargs):
    """Creates a project entity"""
    kwargs["id"] = 0
    return _alter_project(**kwargs)


def edit(**kwargs):
    """Edits the allowed properties of a project entity"""
    return _alter_project(**kwargs)


def block(project_id):
    """Logical deletion of a project entity"""
    delete_entity("projects", project_id)


def find(project_id):
    """Find a project as per id"""
    return find_entity("projects", project_id)


def count(search_params=None):
    """Number of non logical deleted projects"""
    return count_entities("projects", search_params)


def paged(page, size, order_by, asc, search_params=None):
    return page_entities("projects", page, size, order_by, asc, search_params)
