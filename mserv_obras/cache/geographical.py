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
        with open(mdata.source, 'r') as s:
            return (dict(map(self.__packer, s.readlines())),
                    mdata.attrs.get('formato', 'unknown'),
                    mdata.attrs.get('estado', 'unknown'),
                    mdata.attrs.get('comentarios', 'no comments'))
