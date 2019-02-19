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

    def _meta_provider(self, cname):
        return dal.ADBCache._get_meta(cname, _FAKE_CACHE_DIR)

    def test_find_mechanism(self):
        cname00 = 'cars'
        dal.ADBCache.load(cname00, self._meta_provider)
        record = dal.ADBCache.find(cname00)
        self.assertTrue(record.data['Volvo 142E']['cyl'] == '4')

        with self.assertRaises(FatalError):
            cname01 = 'girls'
            dal.ADBCache.load(cname01, self._meta_provider)
