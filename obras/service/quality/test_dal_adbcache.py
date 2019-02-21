import unittest
import os
import dal
import csv
from misc.error import FatalError


_FAKE_CACHE_DIR = os.path.abspath(
    os.path.join(os.path.dirname(__file__), "fake_cache"))


@dal.authoritative('cars')
class _CarModels(dal.ADBCache):
    """
    """
    _SPLIT_CHAR = ','
    _IDX_ORIGIN = 0

    def __init__(self):
        super().__init__()

    def _load(self, origins):
        """
        """
        with open(origins[self._IDX_ORIGIN], 'r') as s:
            csv_reader = csv.DictReader(s, delimiter=self._SPLIT_CHAR)
            self.data = {row['model'] : dict(row) for row in csv_reader}



class TestADBCache(unittest.TestCase):
    """
    Plays with the features of ADBCache
    """

    def _meta_provider(self, cname):
        return dal.ADBCache._get_meta(cname, _FAKE_CACHE_DIR)

    def test_find_flush_mechanism(self):

        # Getting the number of cylinders of a wonderful volvo
        cname00 = 'cars'
        self.assertTrue(dal.ADBCache.count() == 0)
        record = dal.ADBCache.find('cars')
        self.assertTrue(record is None)
        dal.ADBCache.load(cname00, self._meta_provider)
        self.assertTrue(dal.ADBCache.count() == 1)
        record = dal.ADBCache.find(cname00)
        self.assertTrue(record.data['Volvo 142E']['cyl'] == '4')
        dal.ADBCache.flush(cname00)
        self.assertTrue(dal.ADBCache.count() == 0)

        # We are looking for a record that has been flushed
        record = dal.ADBCache.find('cars')
        self.assertTrue(record is None)

    def test_bad_usage_of_load(self):

        # We are loading a non supported authoritative cache
        self.assertTrue(dal.ADBCache.count() == 0)
        with self.assertRaises(FatalError) as cm:
            cname01 = 'girls'
            dal.ADBCache.load(cname01, self._meta_provider)
        self.assertTrue(dal.ADBCache.count() == 0)

    def test_bad_reload(self):

        # We are reloading a non supported authoritative cache
        self.assertTrue(dal.ADBCache.count() == 0)
        with self.assertRaises(FatalError) as cm:
            cname02 = 'pugs'
            dal.ADBCache.reload(cname02, self._meta_provider)
        self.assertTrue(dal.ADBCache.count() == 0)
