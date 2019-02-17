import os
import misc


@misc.authoritative('geographical')
class DistState(misc.ADBCache):
    """
    """

    _SPLIT_CHAR = ';'

    _EXPECTED_SOURCES = 1
    _IDX_SOURCE = 0

    def __init__(self):
        super().__init__()

    def __packer(self, l):
        k, v = l.strip().split(self._SPLIT_CHAR)
        return (k, v)

    def _load(self, sources):
        """
        """
        self.__expectations(sources)
        with open(sources[self._IDX_SOURCE], 'r') as s:
            self.data = dict(map(self.__packer, s.readlines()))

    def __expectations(self, sources):
        """
        """
        if len(sources) == self._EXPECTED_SOURCES:
            pass
        else:
            msg = "Expecting {0} files to load".format(self._EXPECTED_SOURCES)
            raise FatalError(msg)

        if not os.path.isfile(sources[self._IDX_SOURCE]):
            msg = "Cache file {0} not found".format(source[self._IDX_SOURCE])
            raise FatalError(msg)
