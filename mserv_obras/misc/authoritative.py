import os
import yaml
import custom
import calendar
import time
import collections
from .factory import Factory


def authoritative(si):
    def wrapper(cls):
        Factory.subscribe(si, cls)
        return cls
    return wrapper


ACacheMeta = collections.namedtuple('ACacheMeta', 'name sources attrs')


class ADBCache(object):
    """
    Authoritative database cache's administrator
    """
    __slots__ =  ['name', 'data', 'attrs', 'latter_update']

    # Database for the several authoritative caches
    _caches = {}

    _METADATA_FILE = 'config.yml'

    @staticmethod
    def _get_meta(cname):
        """
        Gets metadata as per cache name
        """
        c_dir = os.path.join(custom.CACHE_DIR, cname)
        with open(os.path.join(c_dir, ADBCache._METADATA_FILE), 'r') as s:
            try:
                d_cache = yaml.load(s)
                srcs = [os.path.join(c_dir, s) for s in d_cache['sources']]
                return ACacheMeta(d_cache['name'], srcs, d_cache['attrs'])
            except yaml.YAMLError as e:
                pass
            except KeyError as e:
                pass

    @staticmethod
    def load(cname):
        """
        Loads cache instance into the database
        """
        mdata = ADBCache._get_meta(cname)
        ci = Factory.incept(cname)
        ADBCache._caches[cname] = ci
        ci.name = mdata.name
        ci.attrs = mdata.attrs
        ci._load(mdata.sources)
        ci.latter_update = calendar.timegm(time.gmtime())

    @staticmethod
    def flush(cname):
        """
        Flushes cache instance from the database
        """
        del ADBCache._caches[cname]

    @staticmethod
    def _reload(cname):
        """
        Reloads cache instance into the database
        """
        ADBCache.flush(cname)
        ADBCache.load(cname)

    @staticmethod
    def count():
        """
        Number of cache instances available within the database
        """
        return len(ADBCache._caches)

    @staticmethod
    def find(cname):
        """
        Search a cache instance within the database
        """
        if a_str in ADBCache._caches:
            return ADBCache._caches[cname]
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

    def _load(self, sources):
        """
        """
        msg = '_load() must be implemented in derived class'
        raise NotImplementedError(msg)
