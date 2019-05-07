import misc.helperpg


@misc.helperpg.pgslack_connected
def _update_steady(conn, sql):
    return misc.helperpg.pgslack_update(conn, sql)


@misc.helperpg.pgslack_connected
def _exec_steady(conn, sql):
    return misc.helperpg.pgslack_exec(conn, sql)


def block_contract(contract_id):
    """Logical deletion of a contract entity"""
    q = """UPDATE contracts set locked = true
           WHERE id = {}""".format(contract_id)
    _update_steady(q)
