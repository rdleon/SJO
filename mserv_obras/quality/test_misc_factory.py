import unittest
from dal.adbcache import _AFactory as Factory


class _Dummy0(object):
    __slots__ = ['id']

    def __init__(self):
        self.id = 0

class _Dummy1(object):
    __slots__ = ['id']

    def __init__(self):
        self.id = 1

class _Dummy2(object):
    __slots__ = ['id']

    def __init__(self):
        self.id = 2


class TestFactory(unittest.TestCase):

    def test_correct_type(self):
        """
        Ensures that the right instance type
        has been fetched from factory
        """
        Factory.subscribe('Hugo', _Dummy0)
        Factory.subscribe('Paco', _Dummy1)
        Factory.subscribe('Luis', _Dummy2)

        # Positive cases
        self.assertTrue(type(Factory.incept('Hugo')) == _Dummy0)
        self.assertTrue(type(Factory.incept('Paco')) == _Dummy1)
        self.assertTrue(type(Factory.incept('Luis')) == _Dummy2)

        # Negative cases
        self.assertFalse(type(Factory.incept('Hugo')) == _Dummy1)
        self.assertFalse(type(Factory.incept('Paco')) == _Dummy2)
        self.assertFalse(type(Factory.incept('Luis')) == _Dummy0)

    def test_tuple_as_index(self):
        """
        Warranties that any hashable object features
        a usage as an slot index
        """
        Factory.subscribe((45,'Hugo'), _Dummy0)
        Factory.subscribe((30,'Paco'), _Dummy1)
        Factory.subscribe((10,'Luis'), _Dummy2)

        # Positive Cases
        # Asking if it is supported
        self.assertTrue(Factory.is_supported((45, 'Hugo')))
        self.assertTrue(Factory.is_supported((30, 'Paco')))
        self.assertTrue(Factory.is_supported((10, 'Luis')))

        # Positive Cases
        # Asking if the instance incepted
        # contains the expected value.
        self.assertEqual(Factory.incept((45, 'Hugo')).id, 0)
        self.assertEqual(Factory.incept((30, 'Paco')).id, 1)
        self.assertEqual(Factory.incept((10, 'Luis')).id, 2)

        # Negative Cases
        self.assertFalse(Factory.is_supported((60, 'Willow')))
        self.assertFalse(Factory.is_supported((44, 'Batman')))
        self.assertFalse(Factory.is_supported((14, 'Joker')))

        # Negative Cases
        # Asking if the instance incepted
        # contains the expected value.
        self.assertEqual(Factory.incept((47, 'Hugo')), None)
        self.assertEqual(Factory.incept((34, 'Paco')), None)
        self.assertEqual(Factory.incept((14, 'Luis')), None)
