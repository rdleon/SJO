

for mv in set(['GLOBAL_RESOURCES_DIR',
               'CACHE_DIR',
               'APP_NAME',
               'APP_RESOURCES_DIR']):
    exec('from .profile import {}'.format(mv))
