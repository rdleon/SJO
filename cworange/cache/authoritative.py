import os
from misc.factory import Factory


class AuthoritativeCache(object):
    """
    """
    __slots__ =  ['name', 'author', 'latter_update']

    # Database for the several authoritative caches (readonly)
    _caches = {}

    @staticmethod
    def _get_meta(cname):
        """
        Gets metadata as per cache name
        """
        pass

    @staticmethod
    def load(cname):
        """
        Loads cache instance into the database
        """
        mdata = AuthoritativeCache._get_meta(cname)
        ci = Factory.incept(mdata.family)
        AuthoritativeCache._caches[cname] = ci._load(mdata.args)

    @staticmethod
    def flush(cname):
        """
        Flushes cache instance from the database
        """
        del AuthoritativeCache._caches[cname]

    @staticmethod
    def _reload(cname):
        """
        Reloads cache instance into the database
        """
        AuthoritativeCache.flush(cname)
        AuthoritativeCache.load(cname)

    @staticmethod
    def count():
        """
        Number of cache instances available within the database
        """
        return len(AuthoritativeCache._caches)

    @staticmethod
    def find(cname):
        """
        Search a cache instance within the database
        """
        if a_str in AuthoritativeCache._caches:
            return AuthoritativeCache._caches[cname]
        return None

    def __init__(self):
        pass

    def __str__(self):
        """
        Representation of a cache instance as a string
        """
        return  'CACHE(%s)' % str(self.name)

    def __repr__(self):
        """
        Representation of a cache instance as an official string
        """
        return self.__str__()

    def details(self):
        """
        Dumps all the member values of a cache instance
        """
        return { s: getattr(self, s, "<NOTHING>")
                 for s in self.__class__.__slots__ }

    def _load(self, cname, **kwargs):
        """
        """
        msg = '_load() must be implemented in derived class'
        raise NotImplementedError(msg)
