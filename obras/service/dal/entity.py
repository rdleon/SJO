from .helper import exec_steady, update_steady


def count_entities(entity_table):
    """Counts the entities non blocked"""
    q = """SELECT count(id)::int as total
           FROM {}
           WHERE blocked = false""".format(
        entity_table
    )
    r = exec_steady(q)

    # For this case we are just expecting one row
    if len(r) != 1:
        raise Exception("Just expecting one total as a result")

    return r.pop()["total"]


def delete_entity(entity_table, entity_id):
    """Logical deletion of whichever entity"""
    q = """UPDATE {}
           SET blocked = true,
           touch_latter_time = now()
           WHERE id = {}""".format(
        entity_table, entity_id
    )
    hits = update_steady(q)

    # Expecting just one hit
    if hits > 1:
        msg = "Why did this update hit {} entities !!".format(hits)
        raise Exception(msg)


def find_entity(entity_table, entity_id):
    """Finds an entity non blocked by id"""
    q = """SELECT *
           FROM {}
           WHERE id = {} and blocked = false""".format(
        entity_table, entity_id
    )
    r = exec_steady(q)

    # For this case we are just expecting one row
    if len(r) != 1:
        raise Exception("Just expecting one entity")

    return r.pop()


def page_entities(entity_table, page_number, page_size, order_by, asc):
    q = """SELECT *
           FROM {}
           WHERE blocked = false
           ORDER BY {} {}
           LIMIT {} OFFSET {}""".format(
        entity_table, order_by, asc, page_size, page_number
    )
    r = exec_steady(q)

    if len(r) == 0:
        raise Exception("Paging an empty set of entities")

    return r
