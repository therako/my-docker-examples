#!/bin/bash

# configure tensorflow options
printf "/usr/bin/python3\n\ny\ny\nn\nn\nn\nn\nn\nn\nn\n" | ./configure

# Build tools
bazel build -c opt --copt=-msse4.1 --copt=-msse4.2 --copt=-mavx --copt=-mfma --copt=-mfpmath=both -k //tensorflow/tools/pip_package:build_pip_package

# Generate python whl package
bazel-bin/tensorflow/tools/pip_package/build_pip_package /code/tensorflow_pkg
