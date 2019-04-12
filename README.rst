cijoe-pkg-lightnvm: cijoe package for the lightnvm subsystem, PBLK, and ZBLK
============================================================================

.. image:: https://img.shields.io/pypi/v/cijoe-pkg-lightnvm.svg
   :target: https://pypi.org/project/cijoe-pkg-lightnvm
   :alt: PyPI

.. image:: https://travis-ci.com/refenv/cijoe-pkg-lightnvm.svg?branch=master
   :target: https://travis-ci.com/refenv/cijoe-pkg-lightnvm
   :alt: Build Status

Install
=======

The package is distributed via PyPi, run the following to command to install:

Install ``cijoe-pkg-lightnvm`` system-wide via the pip:

.. code-block:: bash

  sudo pip install cijoe-pkg-lightnvm

Or install it user-level:

.. code-block:: bash

  pip install --user cijoe-pkg-lightnvm

.. note::

  When doing user-level install, then include the :code:`pip` binary install
  path in your :code:`PATH` definition. For example
  :code:`PATH="$PATH:$HOME/.local/bin"`

Create environment definition for CIJOE
=======================================

Run CIJOE interactively and define the target environment:

.. code-block:: bash

  # Start cijoe
  cijoe

  # Use refence definitions as a template for defining your environment
  cat $CIJ_ENVS/refenv-u1604.sh > target_env.sh
  tail -n +2 $CIJ_ENVS/refenv-pblk.sh >> target_env.sh

  # Open up your favorite editor and modify accordingly
  vim target_env.sh

This will create a environment definition for testing **PBLK**, if you want to
test **ZBLK** instead, then use the ``refenv-zblk.sh`` instead.

Create virtual environment definition for CIJOE
===============================================

Run CIJOE interactively and define the target environment:

.. code-block:: bash

  # Start cijoe
  cijoe

  # Use refence definitions as a template for defining your environment
  cat $CIJ_ENVS/refenv-u1604.sh > target_env.sh

  # The following is the qemu variables to define
  tail -n +2 $CIJ_ENVS/qemu.sh >> target_env.sh

  # Lastly, the variables used by pblk testcases
  tail -n +2 $CIJ_ENVS/refenv-pblk.sh >> target_env.sh

  # Open up your favorite editor and modify accordingly
  vim target_env.sh

This will create a environment definition for testing **PBLK**, if you want to
test **ZBLK** instead, then use the ``refenv-zblk.sh`` instead.

Running tests
=============

Start the test-runner and view the report:

.. code-block:: bash

  # Create directory to store results
  RESULTS=$(mktemp -d trun.XXXXXX -p /tmp)

  # Run e.g. the pblk smoketest
  cij_runner \
      $CIJ_TESTPLANS/pblk_000_smoketest.plan \
      target_env.sh \
      --output $RESULTS

  # Create test report
  cij_reporter $RESULTS

  # Inspect the test-report
  xdg-open $RESULTS/report.html

This will create a environment definition for testing **PBLK**, if you want to
test **ZBLK** instead, then use the ``zblk_000_smoketest.plan`` instead.

If you find bugs or need help then feel free to submit an `Issue`_. If you want
to get involved head over to the `GitHub page`_ to get the source code and
submit a `Pull request`_ with your changes.

.. _Quickstart Guide: https://cijoe-pkg-lightnvm.readthedocs.io/en/latest/quickstart.html
.. _Installation: https://cijoe-pkg-lightnvm.readthedocs.io/
.. _Usage: https://cijoe-pkg-lightnvm.readthedocs.io/
.. _GitHub page: https://github.com/refenv/cijoe-pkg-lightnvm
.. _Pull request: https://github.com/refenv/cijoe-pkg-lightnvm/pulls
.. _Issue: https://github.com/refenv/cijoe-pkg-lightnvm/issues
