from .entity import delete_entity, find_entity, page_entities
from .helper import run_store_procedure


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


def count():
    """Number of non logical deleted providers"""
    return count_entities("providers")


def find(provider_id):
    """Find a provider as per id"""
    ent = find_entity("providers", provider_id)
    attributes = set(["id", "title", "description", "inceptor_uuid"])
    return {attr: ent[attr] for attr in attributes}


def paged(page, size, order_by, asc):
    return page_entities("providers", page, size, order_by, asc)


def edit(**kwargs):
    """Edits the allowed properties of a provider entity"""
    return _alter_provider(**kwargs)


def create(**kwargs):
    """Creates a provider entity"""
    kwargs["id"] = 0
    return _alter_provider(**kwargs)
