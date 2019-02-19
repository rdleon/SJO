import dal
from .geographical import DistState


@dal.authoritative('obra_categorias')
class OCategorias(DistState):
    """
    """
    def __init__(self):
        super().__init__()
