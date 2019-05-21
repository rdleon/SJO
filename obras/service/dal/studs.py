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
    if rcode < 0:
        # FIXME
        # We should feature a better exception that also catches the rcode
        raise Exception(rmsg)
    return (rcode, rmsg)


def fetch_providers():
    """Fetches the overall of non blocked providers"""
    entity_table = 'providers'
    attributes = set(['id', 'title', 'description', 'inceptor_uuid'])
    q = """SELECT *
           FROM {}
           WHERE blocked = false""".format(entity_table)

    rs = _exec_steady(q)

    if len(rs) == 0:
        raise Exception('Paging an empty set of entities')

    return [{attr: row[attr] for attr in attributes} for row in rs]


def _page_entities(entity_table, page_number, page_size, order_by, asc):
    q = """SELECT *
           FROM {}
           WHERE blocked = false
           ORDER BY {} {}
           LIMIT {} OFFSET {}""".format(entity_table,
                                        order_by,
                                        asc,
                                        page_size,
                                        page_number)
    r = _exec_steady(q)

    if len(r) == 0:
        raise Exception('Paging an empty set of entities')

    return r


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


def _find_entity(entity_table, entity_id):
    """Finds an entity non blocked by id"""
    q = """SELECT *
           FROM {}
           WHERE id = {} and blocked = false""".format(entity_table, entity_id)
    r = _exec_steady(q)

    # For this case we are just expecting one row
    if len(r) != 1:
        raise Exception('Just expecting one entity')

    return r.pop()


def _count_entities(entity_table):
    """Counts the entities non blocked"""
    q = """SELECT count(id)::int as total
           FROM {}
           WHERE blocked = false""".format(entity_table)
    r = _exec_steady(q)

    # For this case we are just expecting one row
    if len(r) != 1:
        raise Exception('Just expecting one total as a result')

    return r.pop()['total']


def count_providers():
    """Number of non logical deleted providers"""
    return _count_entities('providers')


def count_contracts():
    """Number of non logical deleted contracts"""
    return _count_entities('contracts')


def count_projects():
    """Number of non logical deleted projects"""
    return _count_entities('projects')


def block_provider(provider_id):
    """Logical deletion of a provider entity"""
    _delete_entity('providers', provider_id)


def block_contract(contract_id):
    """Logical deletion of a contract entity"""
    _delete_entity('contracts', contract_id)


def block_project(project_id):
    """Logical deletion of a project entity"""
    _delete_entity('projects', project_id)


def find_provider(provider_id):
    """Find a provider as per id"""
    ent = _find_entity('providers', provider_id)
    attributes = set(['id', 'title', 'description', 'inceptor_uuid'])
    return {attr: ent[attr] for attr in attributes}


def find_contract(contract_id):
    """Find a contract as per id"""
    ent = _find_entity('contracts', contract_id)
    attributes = set(['id', 'number', 'title', 'description',
                      'provider', 'delivery_stage',
                      'initial_contracted_amount',
                      'kickoff', 'ending', 'down_payment',
                      'down_payment_amount', 'ext_agreement',
                      'ext_agreement_amount',
                      'final_contracted_amount',
                      'total_amount_paid',
                      'outstanding_down_payment',
                      'inceptor_uuid'])
    return {attr: ent[attr] for attr in attributes}



def find_project(project_id):
    """Find a project as per id"""
    return _find_entity('projects', project_id)


def page_contracts(page_number, page_size, order_by, asc):
    return _page_entities('contracts', page_number, page_size, order_by, asc)


def page_projects(page_number, page_size, order_by, asc):
    return _page_entities('projects', page_size, order_by, asc)


def _alter_provider(**kwargs):
    """Calls sp in charge of create and edit a provider"""
    sql = """SELECT * FROM alter_provider(
        {}::integer,
        '{}'::character varying,
        '{}'::character varying,
        '{}'::character varying)
        AS result( rc integer, msg text )""".format(
            kwargs['id'],
            kwargs['title'],
            kwargs['description'],
            kwargs['inceptor_uuid'])
    return _run_sp_ra(sql)


def edit_provider(**kwargs):
    """Edits the allowed properties of a provider entity"""
    return _alter_provider(**kwargs)


def create_provider(**kwargs):
    """Creates a provider entity"""
    kwargs['id'] = 0
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
            kwargs['id'],
            kwargs['title'],
            kwargs['description'],
            kwargs['city'],
            kwargs['category'],
            kwargs['department'],
            kwargs['contract'],
            kwargs['budget'],
            kwargs['planed_kickoff'],
            kwargs['planed_ending'],
            kwargs['inceptor_uuid'])
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
    sql = """select * from alter_contract(
        {}::integer,
        '{}'::character varying,
        '{}'::character varying,
        '{}'::text,
        {}::integer,
        {}::integer,
        {}::double precision,
        '{}'::date,
        '{}'::date,
        '{}'::date,
        {}::double precision,
        '{}'::date,
        {}::double precision,
        {}::double precision,
        {}::double precision,
        {}::double precision,
        '{}'::character varying)
        AS result( rc integer, msg text )""".format(
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
            kwargs['ext_agreement'],
            kwargs['ext_agreement_amount'],
            kwargs['final_contracted_amount'],
            kwargs['total_amount_paid'],
            kwargs['outstanding_down_payment'],
            kwargs['inceptor_uuid'])
    return _run_sp_ra(sql)


def edit_contract(**kwargs):
    """Edits the allowed properties of a contract entity"""
    return _alter_contract(**kwargs)


def create_contract(**kwargs):
    """Creates a contract entity"""
    kwargs['id'] = 0
    return _alter_contract(**kwargs)
