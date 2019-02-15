import os
import sys
import contextlib
from typing import Tuple


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
