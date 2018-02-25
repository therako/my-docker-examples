#!/bin/bash -e

# setup output folder
mkdir -p tensorflow_pkg

docker build . -t tensorflow-builder
docker stop tensorflow-builder | true
docker rm tensorflow-builder | true
docker run -d -v $(pwd)/tensorflow_pkg:/code/tensorflow_pkg -d --privileged --name tensorflow-builder tensorflow-builder ./generate_packages_script.sh

docker logs -f tensorflow-builder
