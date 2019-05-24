from .entity import count_entities, delete_entity, find_entity
from .helper import run_store_procedure


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
        kwargs["id"],
        kwargs["number"],
        kwargs["title"],
        kwargs["description"],
        kwargs["provider"],
        kwargs["delivery_stage"],
        kwargs["initial_contracted_amount"],
        kwargs["kickoff"],
        kwargs["ending"],
        kwargs["down_payment"],
        kwargs["down_payment_amount"],
        kwargs["ext_agreement"],
        kwargs["ext_agreement_amount"],
        kwargs["final_contracted_amount"],
        kwargs["total_amount_paid"],
        kwargs["outstanding_down_payment"],
        kwargs["inceptor_uuid"],
    )
    return run_store_procedure(sql)


def edit_contract(**kwargs):
    """Edits the allowed properties of a contract entity"""
    return _alter_contract(**kwargs)


def create_contract(**kwargs):
    """Creates a contract entity"""
    kwargs["id"] = 0
    return _alter_contract(**kwargs)


def count_contracts():
    """Number of non logical deleted contracts"""
    return count_entities("contracts")


def block_contract(contract_id):
    """Logical deletion of a contract entity"""
    delete_entity("contracts", contract_id)


def find_contract(contract_id):
    """Find a contract as per id"""
    ent = find_entity("contracts", contract_id)
    attributes = set(
        [
            "id",
            "number",
            "title",
            "description",
            "provider",
            "delivery_stage",
            "initial_contracted_amount",
            "kickoff",
            "ending",
            "down_payment",
            "down_payment_amount",
            "ext_agreement",
            "ext_agreement_amount",
            "final_contracted_amount",
            "total_amount_paid",
            "outstanding_down_payment",
            "inceptor_uuid",
        ]
    )
    return {attr: ent[attr] for attr in attributes}
