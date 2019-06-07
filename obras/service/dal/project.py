from .entity import count_entities, delete_entity, find_entity, page_entities
from .helper import run_store_procedure


def _marshall(entity):
    """Gets the database entity into a more usable object"""
    return entity


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
    entity = _alter_project(**kwargs)

    return _marshall(entity)


def edit(**kwargs):
    """Edits the allowed properties of a project entity"""
    return _alter_project(**kwargs)


def block(project_id):
    """Logical deletion of a project entity"""
    delete_entity("projects", project_id)


def find(project_id):
    """Find a project as per id"""
    entity = find_entity("projects", project_id)

    return _marshall(entity)


def count(search_params=None):
    """Number of non logical deleted projects"""
    return count_entities("projects", search_params)


def paged(page, size, order_by, asc, search_params=None):
    return page_entities("projects", page, size, order_by, asc, search_params)
