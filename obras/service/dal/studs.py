from .entity import count_entities, delete_entity, find_entity, page_entities
from .helper import exec_steady, run_store_procedure


def fetch_providers():
    """Fetches the overall of non blocked providers"""
    entity_table = "providers"
    attributes = set(["id", "title", "description", "inceptor_uuid"])
    q = """SELECT *
           FROM {}
           WHERE blocked = false""".format(
        entity_table
    )

    rs = exec_steady(q)

    if len(rs) == 0:
        raise Exception("Paging an empty set of entities")

    return [{attr: row[attr] for attr in attributes} for row in rs]


def count_providers():
    """Number of non logical deleted providers"""
    return count_entities("providers")


def count_projects():
    """Number of non logical deleted projects"""
    return count_entities("projects")


def block_provider(provider_id):
    """Logical deletion of a provider entity"""
    delete_entity("providers", provider_id)


def block_project(project_id):
    """Logical deletion of a project entity"""
    delete_entity("projects", project_id)


def find_provider(provider_id):
    """Find a provider as per id"""
    ent = find_entity("providers", provider_id)
    attributes = set(["id", "title", "description", "inceptor_uuid"])
    return {attr: ent[attr] for attr in attributes}


def find_project(project_id):
    """Find a project as per id"""
    return find_entity("projects", project_id)


def page_projects(page_number, page_size, order_by, asc):
    return page_entities("projects", page_size, order_by, asc)


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


def edit_provider(**kwargs):
    """Edits the allowed properties of a provider entity"""
    return _alter_provider(**kwargs)


def create_provider(**kwargs):
    """Creates a provider entity"""
    kwargs["id"] = 0
    return _alter_provider(**kwargs)


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


def edit_project(**kwargs):
    """Edits the allowed properties of a project entity"""
    return _alter_project(**kwargs)


def create_project(**kwargs):
    """Creates a project entity"""
    kwargs["id"] = 0
    return _alter_project(**kwargs)
