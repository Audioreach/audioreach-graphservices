#!/bin/bash
set -ex

# Build/Compile audioreach-graphservices
source ./install/environment-setup-armv8-2a-poky-linux
autoreconf -Wcross --verbose --install --force --exclude=autopoint
autoconf --force

# Run the configure script with the specified arguments
./configure CFLAGS=\"-Wno-int-conversion\" \${BUILD_ARGS} --with-sanitized-headers=\${GITHUB_WORKSPACE}/install/sysroots/armv8-2a-poky-linux/usr/lib/modules/\$KERNEL_VERSION/build/include/uapi/sound/qcom
# make
make DESTDIR=\${GITHUB_WORKSPACE}/build install
