import os
from os.path import expanduser


GLOBAL_RESOURCES_DIR = os.path.join(expanduser("~"), 'resources')
CACHE_DIR = os.path.join(GLOBAL_RESOURCES_DIR, 'cache')
_LOCAL_RESOURCE_DIR = os.path.join(GLOBAL_RESOURCES_DIR, 'local')


MSERV_NAME = 'SJO'
MSERV_RESOURCES_DIR = os.path.join(_LOCAL_RESOURCE_DIR, MSERV_NAME)
