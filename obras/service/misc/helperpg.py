import psycopg2
import psycopg2.extras
from .common import env_property


class HelperPg(object):
    """
    """

    @staticmethod
    def connect():
        """opens a connection to database"""

        # order here matters
        env_vars = ('DBMS_SCHEMA', 'DBMS_USER', 'DBMS_HOST', 'DBMS_PASS', 'DBMS_PORT')
        t = tuple(map(env_property, env_vars))

        try:
            conn_str = "dbname={0} user={1} host={2} password={3} port={4}".format(*t)
            return psycopg2.connect(conn_str)
        except:
            raise Exception('It is not possible to connect with database')
