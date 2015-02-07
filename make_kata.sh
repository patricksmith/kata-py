#!/usr/bin/env bash
set -e

if [ -z "$1" ]
  then
    echo "Usage: `basename $0` <kata_name>"
    exit 1
fi

kata_name=$1

if [ -e $kata_name ]
  then
    echo "File \"$kata_name\" already exists!"
    exit 1
fi

class_name=`echo ${kata_name:0:1} | tr  '[a-z]' '[A-Z]'`${kata_name:1}
sample_py="\
class ${class_name}:
    pass

"
sample_test="\
import unittest

from ${kata_name} import ${class_name}


class ExampleTest(unittest.TestCase):

    def tests_should_pass(self):
        pass

"
requirements="\
git+git://github.com/lacostej/nosyd.git@291ef6a
nose
rednose
"

mkdir ${kata_name}
cd ${kata_name}
mkdir tests
touch tests/__init__.py
echo "$sample_py" > ${kata_name}.py
echo "$sample_test" > tests/test_${kata_name}.py
echo "$requirements" > requirements.pip


if [ -e /usr/local/bin/virtualenvwrapper.sh ]
  then
    bash -c "\
      source /usr/local/bin/virtualenvwrapper.sh
      mkvirtualenv ${kata_name}
      pip install -r requirements.pip"
fi
