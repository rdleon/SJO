import psycopg2
import psycopg2.extras
from .common import env_property


def _connect():
    """Opens a connection to database"""
    # order here matters
    env_vars = ('DBMS_SCHEMA', 'DBMS_USER', 'DBMS_HOST', 'DBMS_PASS', 'DBMS_PORT')
    t = tuple(map(env_property, env_vars))
    try:
        conn_str = "dbname={0} user={1} host={2} password={3} port={4}".format(*t)
        return psycopg2.connect(conn_str)
    except:
        raise Exception('It is not possible to connect with database')


def pgslack_exec(conn, sql):
    """Carries an sql query out to database"""
    cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
    cur.execute(sql)
    conn.commit()
    rows = cur.fetchall()
    cur.close()
    if len(rows) > 0:
        return rows
    # We should not have reached this point
    raise Exception('There is not data retrieved')


def pgslack_update(conn, sql):
    """Stands for updating tables"""
    updated_rows = 0
    cur = conn.cursor()
    cur.execute(sql)
    updated_rows = cur.rowcount
    conn.commit()
    cur.close()
    if len(updated_rows) > 0:
        return updated_rows
    # We should not have reached this point
    raise Exception('Nothing was updated at all')


def pgslack_connected(func):
    """Handy decorator to fetch a database connection"""
    def wrapper(sql):
        c = _connect()
        try:
            return func(c, sql)
        except:
            raise
        finally:
            c.close()
    return wrapper


@pgslack_connected
def pgslack_update_steady(conn, sql):
    return pgslack_update(conn, sql):


@pgslack_connected
def pgslack_exec_steady(conn, sql):
    return pgslack_exec(conn, sql)
