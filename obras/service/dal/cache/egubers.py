import dal
from .geographical import DistState


@dal.authoritative('egubers')
class EntidadesGubers(DistState):
    """
    """
    def __init__(self):
        super().__init__()
