#!/bin/bash -e
image_name=gcr.io/voxsrc-2020-dev-1/trainer
image_tag=latest
full_image_name=${image_name}:${image_tag}

# copy project src to local temp dir
mkdir -p ./build/
# copy in component-specific source
cp -r ./src ./build/src
# copy in common source code
cp -r ../../common/src ./build/src/common

# move into container's dir
cd "$(dirname "$0")"

# build it
docker build -t "${full_image_name}" .
# upload it
docker push "$full_image_name"

# Output the strict image name (which contains the sha256 image digest)
docker inspect --format="{{index .RepoDigests 0}}" "${full_image_name}"

# delete temp copy of src
rm -rf ./build
