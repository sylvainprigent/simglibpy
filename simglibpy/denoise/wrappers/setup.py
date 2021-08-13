import os
from os.path import join
import numpy


def configuration(parent_package='', top_path=None):
    from numpy.distutils.misc_util import Configuration

    config = Configuration('wrappers', parent_package, top_path)

    libraries = []
    if os.name == 'posix':
        libraries.append('m')

    config.add_extension('_spitfire_denoise',
                         sources=['_spitfire_denoise.pyx', 
                                  'SMath.cpp',
                                  'SObserver.cpp', 'SObservable.cpp', 'SObserverConsole.cpp',
                                  'spitfire2d.cpp', 'spitfire3d.cpp', 'spitfire4d.cpp'],
                         include_dirs=[numpy.get_include()],
                         libraries=[] + libraries,
                         language='c++',
                         extra_link_args=['-lstdc++'],
                         extra_compile_args=['-std=c++11', '-v']
                         )

    return config


if __name__ == '__main__':
    from numpy.distutils.core import setup
    setup(**configuration(top_path='').todict())
