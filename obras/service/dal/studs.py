import misc.helperpg


@misc.helperpg.pgslack_connected
def _update_steady(conn, sql):
    return misc.helperpg.pgslack_update(conn, sql)


@misc.helperpg.pgslack_connected
def _exec_steady(conn, sql):
    return misc.helperpg.pgslack_exec(conn, sql)


@misc.helperpg.pgslack_connected
def _run_sp_ra(conn, sql):
    """Runs a store procedure with rich answer"""

    r = misc.helperpg.pgslack_exec(conn, sql)

    # For this case we are just expecting one row
    if len(r) != 1:
        raise Exception('unexpected result regarding execution of store')

    rcode, rmsg = r.pop()
    if rcode != 0:
        # FIXME
        # We should feature a better exception that also catches the rcode
        raise Exception(rmsg)
    return (rcode, rmsg)


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


def _alter_project(**kwargs):
    sql = """select project_edit from project_edit(
        {}::integer,
        {}::character varying,
        {}::text,
        {}::integer,
        {}::integer,
        {}::integer,
        {}::integer,
        {}::double precision,
        {}::date,
        {}::date
    )""".format(
        kwargs['id'],
        kwargs['title'],
        kwargs['description'],
        kwargs['city'],
        kwargs['category'],
        kwargs['department'],
        kwargs['contract'],
        kwargs['budget'],
        kwargs['planed_kickoff'],
        kwargs['planed_ending']
    )
    _run_sp_ra(sql)


def edit_project(**kwargs):
    """Edits the allowed properties of a project entity"""
    _alter_project(**kwargs)


def create_project(**kwargs):
    """Creates a project entity"""
    kwargs['id'] = 0
    _alter_project(**kwargs)
