cijoe-pkg-pblk: cijoe testcases and testplans for pblk
======================================================

.. image:: https://img.shields.io/pypi/v/cijoe-pkg-pblk.svg
   :target: https://pypi.org/project/cijoe-pkg-pblk
   :alt: PyPI

.. image:: https://travis-ci.com/refenv/cijoe-pkg-pblk.svg?branch=master
   :target: https://travis-ci.com/refenv/cijoe-pkg-pblk
   :alt: Build Status

Install
=======

The package is distributed via PyPi, run the following to command to install:

Install ``cijoe-pkg-pblk`` system-wide via the pip:

.. code-block:: bash

  sudo pip install cijoe-pkg-pblk

Or install it user-level:

.. code-block:: bash

  pip install --user cijoe-pkg-pblk

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

Running tests
=============

Start the test-runner and view the report:

.. code-block:: bash

  # Create directory to store results
  RESULTS=$(mktemp -d trun.XXXXXX -p /tmp)

  # Run e.g. the pblk smoketest
  cij_runner \
      $CIJ_TESTPLANS/pblk_smoketest.plan \
      target_env.sh \
      --output $RESULTS

  # Create test report
  cij_reporter $RESULTS

  # Inspect the test-report
  xdg-open $RESULTS/report.html

If you find bugs or need help then feel free to submit an `Issue`_. If you want
to get involved head over to the `GitHub page`_ to get the source code and
submit a `Pull request`_ with your changes.

.. _Quickstart Guide: https://cijoe-pkg-pblk.readthedocs.io/en/latest/quickstart.html
.. _Installation: https://cijoe-pkg-pblk.readthedocs.io/
.. _Usage: https://cijoe-pkg-pblk.readthedocs.io/
.. _GitHub page: https://github.com/refenv/cijoe-pkg-pblk
.. _Pull request: https://github.com/refenv/cijoe-pkg-pblk/pulls
.. _Issue: https://github.com/refenv/cijoe-pkg-pblk/issues
