#!/bin/sh

echo "Running post clone script..."

# set -ex
# brew uninstall node@6

# Required Node.js version
# NODE_VERSION=8.11.3
# curl "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}.pkg" > "$HOME/Downloads/node-installer.pkg"
# sudo installer -store -pkg "$HOME/Downloads/node-installer.pkg" -target "/"


# echo "Android setup..."
# echo "Downloading OpenCV"
# curl -L "https://github.com/opencv/opencv/releases/download/3.4.5/opencv-3.4.5-android-sdk.zip" --output "$APPCENTER_SOURCE_DIRECTORY/opencv.zip"
# echo "unzipping OpenCV"
# unzip "$APPCENTER_SOURCE_DIRECTORY/opencv.zip"
# echo "moving the JNI directory"
# mv "$APPCENTER_SOURCE_DIRECTORY/OpenCV-android-sdk" "$APPCENTER_SOURCE_DIRECTORY/deps/"
# ln -s "$APPCENTER_SOURCE_DIRECTORY/deps/OpenCV-android-sdk/sdk/native/libs" "$APPCENTER_SOURCE_DIRECTORY/android/app/src/main/jniLibs"
# ln -s "$APPCENTER_SOURCE_DIRECTORY/deps/OpenCV-android-sdk/sdk/native/staticlibs" "$APPCENTER_SOURCE_DIRECTORY/android/app/src/main/staticLibs"

# brew install node@8
# echo 'export PATH="/usr/local/opt/node@8/bin:$PATH"' >> ~/.bash_profile
# . ~/.bashrc

# npm config delete prefix
# nvm install "$NODE_VERSION"
# nvm alias default "$NODE_VERSION"

echo "Post clone script. Done."