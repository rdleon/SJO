import dal
from .geographical import DistState


@dal.authoritative('obra_status')
class OStatus(DistState):
    """
    """
    def __init__(self):
        super().__init__()
