from . import AuthoritativeCache


class DistState(AuthoritativeCache):
    """
    """

    _SPLIT_CHAR = ';'

    def __init__(self):
        super().__init__()

    def _load(self, source, **attrs):
        """
        """
        packer = lambda l: l.strip().split(self._SPLIT_CHAR),
        with open(source, 'r') as s:
            return (dict(map(packer, s.readlines())),
                    attrs.get('estado', 'unknown'),
                    attrs.get('comentarios', 'no comments'))
