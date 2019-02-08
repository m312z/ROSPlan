#!/usr/bin/env python

from distutils.core import setup
from catkin_pkg.python_setup import generate_distutils_setup


setup_args  = generate_distutils_setup(
    packages=['rosplan_planning_system'],
    package_dir={'rosplan_planning_system': 'common/rosplan_planning_system'}
)

setup(**setup_args)
