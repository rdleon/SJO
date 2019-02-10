import os
from os.path import expanduser


GLOBAL_RESOURCES_DIR = os.path.join(expanduser("~"), 'resources')
CACHE_DIR = os.path.join(GLOBAL_RESOURCES_DIR, 'cache')
_LOCAL_RESOURCE_DIR = os.path.join(GLOBAL_RESOURCES_DIR, 'local')


APP_NAME = 'SJO'
APP_RESOURCES_DIR = os.path.join(_LOCAL_RESOURCE_DIR, APP_NAME)
