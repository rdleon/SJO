import sys
from misc.helperstr import UMT


class FatalError(Exception):
    """ Fatal error exception class. """

    def __init__(self, msg=None):

        highlight = ''
        normal    = ''

        if sys.stderr.isatty():
            highlight = UMT.RED + UMT.BOLD
            normal    = UMT.NORMAL

        self.message = '%sFATAL%s: %s\n' % (highlight, normal, msg)

    def __str__(self):
        return self.message
