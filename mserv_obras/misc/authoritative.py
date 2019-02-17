import os
import yaml
import custom
import calendar
import time
from .factory import Factory
from .error import FatalError


def authoritative(si):
    def wrapper(cls):
        Factory.subscribe(si, cls)
        return cls
    return wrapper


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
        Fetches metadata as per cache record identifier,
        this is our meta provider handler by default.

        Args:
            cname (str): identifier of a cache record

        Returns:
            tuple: the metadata elements
        """
        c_dir = os.path.join(custom.CACHE_DIR, cname)
        with open(os.path.join(c_dir, ADBCache._METADATA_FILE), 'r') as s:
            try:
                d_cache = yaml.load(s)
                return (d_cache['name'],
                        [os.path.join(c_dir, s) for s in d_cache['origins']],
                        d_cache['attrs'])
            except yaml.YAMLError as e:
                msg = 'Issues parsing {0}: {1}'.format(_METADATA_FILE, e)
                FatalError(msg)
            except KeyError as e:
                msg = 'An element not found in {}'.format(_METADATA_FILE, e)
                FatalError(msg)

    @staticmethod
    def load(cname, meta_provider=None):
        """
        Loads cache record into the database

        Args:
            cname (str): identifier to address cache record
            meta_provider (handler): fetches metadata as per implementation

        Returns:
            Nothing (None)
        """
        ci = Factory.incept(cname)
        ADBCache._caches[cname] = ci
        if meta_provider is None:
            meta_provider=ADBCache._get_meta
        ci.name, origins, ci.attrs = meta_provider(cname)
        ci._load(origins)
        ci.latter_update = calendar.timegm(time.gmtime())

    @staticmethod
    def flush(cname):
        """
        Flushes cache record from the database

        Args:
            cname (str): identifier to address cache record

        Returns:
            Nothing (None)
        """
        del ADBCache._caches[cname]

    @staticmethod
    def _reload(cname, meta_provider=None):
        """
        Reloads cache record into the database

        Args:
            cname (str): identifier to address cache record
            meta_provider (handler): fetches metadata as per implementation

        Returns:
            Nothing (None)
        """
        ADBCache.flush(cname)
        ADBCache.load(cname, meta_provider)

    @staticmethod
    def count():
        """
        Number of cache records available within the database

        Returns:
            int: the available quantity of records
        """
        return len(ADBCache._caches)

    @staticmethod
    def find(cname):
        """
        Searches a cache record within the database

        Args:
            cname (str): identifier to address cache record

        Returns:
            A cache record reference otherwise nothing (None)
        """
        if a_str in ADBCache._caches:
            return ADBCache._caches[cname]
        return None

    def __init__(self):
        pass

    def __str__(self):
        """
        Representation of a cache record as a string

        Returns:
            str: representation of a cache record
        """
        return  'CACHE(%s)' % str(self.name)

    def __repr__(self):
        """
        Representation of a cache record as an official string

        Returns:
            str: representation of a cache record
        """
        return self.__str__()

    def details(self):
        """
        Dumps all the member values of a cache record

        Returns:
            dict: member values of a cache record
        """
        return { s: getattr(self, s, "<NOTHING>")
                 for s in self.__class__.__slots__ }

    def _load(self, origins):
        """
        As per implementation renders a cache record from origins

        Args:
            origins (list): files along with its absolute path

        Returns:
            Nothing (None)
        """
        msg = '_load() must be implemented in derived class'
        raise NotImplementedError(msg)
