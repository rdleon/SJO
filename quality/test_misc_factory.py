import unittest
from misc.factory import Factory


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
        fact = Factory()
        fact.subscribe('Hugo', _Dummy0)
        fact.subscribe('Paco', _Dummy1)
        fact.subscribe('Luis', _Dummy2)

        # Positive cases
        self.assertTrue(type(fact.incept('Hugo')) == _Dummy0)
        self.assertTrue(type(fact.incept('Paco')) == _Dummy1)
        self.assertTrue(type(fact.incept('Luis')) == _Dummy2)

        # Negative cases
        self.assertFalse(type(fact.incept('Hugo')) == _Dummy1)
        self.assertFalse(type(fact.incept('Paco')) == _Dummy2)
        self.assertFalse(type(fact.incept('Luis')) == _Dummy0)

    def test_tuple_as_index(self):
        """
        Warranties that any hashable object features
        a usage as an slot index
        """
        fact = Factory()
        fact.subscribe((45,'Hugo'), _Dummy0)
        fact.subscribe((30,'Paco'), _Dummy1)
        fact.subscribe((10,'Luis'), _Dummy2)

        # Positive Cases
        # Asking if it is supported
        self.assertTrue(fact.is_supported((45, 'Hugo')))
        self.assertTrue(fact.is_supported((30, 'Paco')))
        self.assertTrue(fact.is_supported((10, 'Luis')))

        # Positive Cases
        # Asking if the instance incepted
        # contains the expected value.
        self.assertEqual(fact.incept((45, 'Hugo')).id, 0)
        self.assertEqual(fact.incept((30, 'Paco')).id, 1)
        self.assertEqual(fact.incept((10, 'Luis')).id, 2)

        # Negative Cases
        self.assertFalse(fact.is_supported((60, 'Willow')))
        self.assertFalse(fact.is_supported((44, 'Batman')))
        self.assertFalse(fact.is_supported((14, 'Joker')))

        # Negative Cases
        # Asking if the instance incepted
        # contains the expected value.
        self.assertEqual(fact.incept((47, 'Hugo')), None)
        self.assertEqual(fact.incept((34, 'Paco')), None)
        self.assertEqual(fact.incept((14, 'Luis')), None)
