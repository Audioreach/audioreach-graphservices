#!/bin/bash
set +x

# Clone meta-ar repo
# Check if the directory already exists
cd ..
if [ -d "meta-ar" ]; then
    echo "Directory meta-ar already exists. Pulling latest changes."
    cd meta-ar
    git reset --hard origin/main
    git pull origin main
else
    echo "Directory meta-ar does not exist. Cloning repository."
    git clone https://github.com/Audioreach/meta-ar.git
fi
cd -

# Apply patch
git apply ../meta-ar/recipes/audio/audioreach-graphservices/0001-ar_osal-update-msm_audio.h-header-include-path.patch

# Build/Compile audioreach-graphservices
source ./install/environment-setup-armv8-2a-poky-linux
autoreconf -Wcross --verbose --install --force --exclude=autopoint
autoconf --force

# Run the configure script with the specified arguments
./configure CFLAGS=\"-Wno-int-conversion\" \${BUILD_ARGS} --with-sanitized-headers=\${GITHUB_WORKSPACE}/install/sysroots/armv8-2a-poky-linux/usr/lib/modules/\$KERNEL_VERSION/build/include/uapi/sound/qcom
# make
make DESTDIR=\${GITHUB_WORKSPACE}/build install