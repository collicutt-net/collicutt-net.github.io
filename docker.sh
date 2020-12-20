#!/bin/bash

# Jekyll runs as Apache
docker run -it --rm --name jekyll \
  -v $PWD:/srv/jekyll:rw,slave,Z \
  --publish 4000:4000 \
  -e JEKYLL_UID=1000\
  -e JEKYLL_GID=1000 \
  docker.io/jekyll/jekyll:3.8.5 \
  jekyll serve --drafts