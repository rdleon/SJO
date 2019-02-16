import misc


@misc.authoritative('geographical')
class DistState(misc.ADBCache):
    """
    """

    _SPLIT_CHAR = ';'

    def __init__(self):
        super().__init__()

    def __packer(self, l):
        k, v = l.strip().split(self._SPLIT_CHAR)
        return (k, v)

    def _load(self, mdata):
        """
        """
        self.name = mdata.name
        self.attrs = mdata.attrs
        with open(mdata.source, 'r') as s:
            self.data = dict(map(self.__packer, s.readlines()))
