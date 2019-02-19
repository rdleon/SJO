import sys
from .helperstr import UMT


class WarningError(Exception):
    """
    Warning error exception class.
    """

    def __init__(self, msg=None):

        highlight = ''
        normal    = ''

        if sys.stderr.isatty():
            highlight = UMT.YELLOW + UMT.BOLD
            normal    = UMT.NORMAL

        self.message = '%sWARNING%s: %s\n' % (highlight, normal, msg)

    def __str__(self):
        return self.message


class FatalError(Exception):
    """
    Fatal error exception class.
    """

    def __init__(self, msg=None):

        highlight = ''
        normal    = ''

        if sys.stderr.isatty():
            highlight = UMT.RED + UMT.BOLD
            normal    = UMT.NORMAL

        self.message = '%sFATAL%s: %s\n' % (highlight, normal, msg)

    def __str__(self):
        return self.message


def debug(msg):
    """
    Issue debug message to stderr
    """

    highlight = ''
    normal    = ''

    if sys.stderr.isatty():
        highlight = UMT.BLUE + UMT.BOLD
        normal    = UMT.NORMAL

    end = '' if msg.endswith('\n') else '\n'
    sys.stderr.write('\n%sDEBUG%s: %s' % (highlight, normal, msg + end))
