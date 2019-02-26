#!/bin/sh

echo "Running post clone script..."

echo "Android setup..."
echo "Downloading OpenCV"
mkdir "$APPCENTER_SOURCE_DIRECTORY/deps"
curl -L "https://s3.amazonaws.com/build.hellosivi.com/opencv.zip" --output "$APPCENTER_SOURCE_DIRECTORY/deps/opencv.zip"
echo "unzipping OpenCV"
unzip "$APPCENTER_SOURCE_DIRECTORY/deps/opencv.zip"
# echo "moving the JNI directory"
# mv "$APPCENTER_SOURCE_DIRECTORY/opencv/" "$APPCENTER_SOURCE_DIRECTORY/deps/opencv/"
# ls "$APPCENTER_SOURCE_DIRECTORY/deps/opencv/x86"
rm "$APPCENTER_SOURCE_DIRECTORY/android/app/src/main/jniLibs"
ln -s "$APPCENTER_SOURCE_DIRECTORY/deps/opencv/sdk/native/libs" "$APPCENTER_SOURCE_DIRECTORY/android/app/src/main/jniLibs"


echo "Post clone script. Done."