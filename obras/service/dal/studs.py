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
    hits = _update_steady(q)

    # Expecting just one hit
    if hits > 1:
        msg = "Why did this update hit {} entities !!".format(hits)
        raise Exception(msg)


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
    """Calls sp in charge of create and edit a project"""
    sql = """select alter_project from alter_project(
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
    return _run_sp_ra(sql)


def edit_project(**kwargs):
    """Edits the allowed properties of a project entity"""
    return _alter_project(**kwargs)


def create_project(**kwargs):
    """Creates a project entity"""
    kwargs['id'] = 0
    return _alter_project(**kwargs)


def _alter_contract(**kwargs):
    """Calls sp in charge of create and edit a contract"""
    sql = """select alter_contract from alter_contract(
        {}::integer,
        {}::character varying,
        {}::character varying,
        {}::text,
        {}::integer,
        {}::integer,
        {}::double precision,
        {}::date,
        {}::date,
        {}::date,
        {}::double precision,
        {}::date,
        {}::double precision,
        {}::double precision,
        {}::double precision,
        {}::double precision
    """.format(
            kwargs['id'],
            kwargs['number'],
            kwargs['title'],
            kwargs['description'],
            kwargs['provider'],
            kwargs['delivery_stage'],
            kwargs['initial_contracted_amount'],
            kwargs['kickoff'],
            kwargs['ending'],
            kwargs['down_payment'],
            kwargs['down_payment_amount'],
            kwargs['ext_agreement date'],
            kwargs['ext_agreement_amount'],
            kwargs['final_contracted_amount'],
            kwargs['total_amount_paid'],
            kwargs['outstanding_down_payment'])
    return _run_sp_ra(sql)

def edit_contract(**kwargs):
    """Edits the allowed properties of a contract entity"""
    return _alter_contract(**kwargs)


def create_contract(**kwargs):
    """Creates a contract entity"""
    kwargs['id'] = 0
    return _alter_contract(**kwargs)
