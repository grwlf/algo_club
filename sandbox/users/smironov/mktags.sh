#!/bin/sh


(
find . -name '*py'
IFS=':'
for d in $PYTHONPATH ; do
  find $d -name '*.py'
done
) | grep -E '^./src/|pandas|tensorflow|numpy|scipy|matplotlib|scikit-learn' >flist

ctags --python-kinds=-i `cat flist`
