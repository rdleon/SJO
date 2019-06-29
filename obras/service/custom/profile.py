import os
from os.path import expanduser

GLOBAL_RESOURCES_DIR = os.path.join(expanduser("~"), "resources")
CACHE_DIR = os.path.join(GLOBAL_RESOURCES_DIR, "cache")
FILE_STORAGE = os.path.join(GLOBAL_RESOURCES_DIR, "files")
_LOCAL_RESOURCE_DIR = os.path.join(GLOBAL_RESOURCES_DIR, "local")


MSERV_NAME = "SJO"
MSERV_DESC = "Microservicio API Obras"
MSERV_RESOURCES_DIR = os.path.join(_LOCAL_RESOURCE_DIR, MSERV_NAME)
