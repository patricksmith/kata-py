kata-py
=======

A simple shell script to set up a quick environment for a Python kata.


Usage
-----

Execute the script and pass the name of the kata:

    $ ./make_kata.sh foo

The script will then create a new directory with the name of the kata and the following structure:

    $ tree foo
    foo
    ├── foo.py
    ├── requirements.pip
    └── tests
        ├── __init__.py
        └── test_foo.py

    1 directory, 4 files

If `virtualenvwrapper` is installed (more precisely, if it is installed at `/usr/local/bin/virtualenvwrapper.sh`), a virtual env with the kata's name will be created and some testing basics will be installed.

    $ workon foo && pip freeze
    Nosyd==0.0.5
    nose==1.3.4
    python-termstyle==0.1.10
    rednose==0.4.1
    wsgiref==0.1.2


Running Tests
-------------

If using a virtualenv, activate the env (`workon foo`). Otherwise, install the dependencies with `pip install -r requirements.pip`.

Tests can be run using `nosetests`. My favorite test command:

    $ nosetests --nocapture --rednose -v --stop
    tests_should_pass (tests.test_foo.ExampleTest) ... passed

    -----------------------------------------------------------------------------
    1 test run in 0.0 seconds (1 test passed)

`nosyd` can also be used and will run the tests every time a file is saved:

    $ nosyd -1
    Running command: nosetests --with-xunit
    .
    ----------------------------------------------------------------------
    Ran 1 test in 0.003s

    OK
