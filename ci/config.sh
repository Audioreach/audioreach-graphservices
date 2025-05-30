#!/bin/bash
# This file is part of the Audioreach CI configuration.
# It defines the repositories and patches used in the CI process.
REPOS=(
  "meta-ar|https://github.com/Audioreach/meta-ar.git"
)

PATCHES=(
  "meta-ar|recipes/audio/audioreach-graphservices/0001-ar_osal-update-msm_audio.h-header-include-path.patch"
)
