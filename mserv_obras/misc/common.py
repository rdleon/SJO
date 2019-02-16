import os
import sys
import contextlib
from .error import FatalError


@contextlib.contextmanager
def smart_open(filename=None):
    """
    Simplyfies to switch between file
    or display as output choice
    """

    if filename and filename != '-':
        fh = open(filename, 'w')
    else:
        fh = sys.stdout

    try:
        yield fh
    finally:
        if fh is not sys.stdout:
            fh.close()


def env_property(prop, caster=None):
    """
    Read env variables for microservice's sake
    """

    val = os.environ.get(prop)
    if val is None:
        raise FatalError("Enviroment variable {} has not been set !!".format(prop))

    if caster is None:
       return val

    try:
        return caster(val)
    except:
        raise FatalError("Enviroment variable {} could not be casted !!".format(prop))
