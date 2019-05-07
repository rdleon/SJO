import misc.helperpg


@misc.helperpg.pgslack_connected
def _update_steady(conn, sql):
    return misc.helperpg.pgslack_update(conn, sql)


@misc.helperpg.pgslack_connected
def _exec_steady(conn, sql):
    return misc.helperpg.pgslack_exec(conn, sql)


def _delete_entity(entity_table, entity_id):
    """Logical deletion of whichever entity"""
    q = """UPDATE {}
           SET blocked = true,
           touch_latter_time = now()
           WHERE id = {}""".format(entity_table, entity_id)
    _update_steady(q)


def block_provider(provider_id):
    """Logical deletion of a provider entity"""
    _delete_entity('providers', provider_id)


def block_contract(contract_id):
    """Logical deletion of a contract entity"""
    _delete_entity('contracts', contract_id)


def block_project(project_id):
    """Logical deletion of a project entity"""
    _delete_entity('projects', project_id)
