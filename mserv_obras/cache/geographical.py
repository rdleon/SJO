import os
import misc
from misc.error import FatalError


@misc.authoritative('geographical')
class DistState(misc.ADBCache):
    """
    """

    _SPLIT_CHAR = ';'

    _EXPECTED_ORIGINS = 1
    _IDX_ORIGIN = 0

    def __init__(self):
        super().__init__()

    def __packer(self, l):
        k, v = l.strip().split(self._SPLIT_CHAR)
        return (k, v)

    def _load(self, origins):
        """
        """
        self.__expectations(origins)
        with open(origins[self._IDX_ORIGIN], 'r') as s:
            self.data = dict(map(self.__packer, s.readlines()))

    def __expectations(self, origins):
        """
        """
        if len(origins) == self._EXPECTED_ORIGINS:
            pass
        else:
            msg = "Expecting {0} files to load".format(self._EXPECTED_ORIGINS)
            raise FatalError(msg)

        if not os.path.isfile(origins[self._IDX_ORIGIN]):
            msg = "Cache file {0} not found".format(source[self._IDX_ORIGIN])
            raise FatalError(msg)
