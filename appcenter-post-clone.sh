#!/bin/sh

echo "Running post clone script..."
 
echo "Downloading OpenCV"
mkdir $APPCENTER_SOURCE_DIRECTORY/deps
curl -L https://s3.amazonaws.com/build.hellosivi.com/opencv.zip --output $APPCENTER_SOURCE_DIRECTORY/deps/opencv.zip


echo "unzipping OpenCV"
unzip $APPCENTER_SOURCE_DIRECTORY/deps/opencv.zip


echo "Linking JNI directory"

rm $APPCENTER_SOURCE_DIRECTORY/android/app/src/main/jniLibs
ln -s $APPCENTER_SOURCE_DIRECTORY/deps/opencv/sdk/native/libs $APPCENTER_SOURCE_DIRECTORY/android/app/src/main/jniLibs

#Listing JNI
echo "Listing android directory"
cd $APPCENTER_SOURCE_DIRECTORY/android
find . -maxdepth 3 -type d -ls

echo "Listing source directory"
cd $APPCENTER_SOURCE_DIRECTORY
find . -maxdepth 2 -type d -ls


# cd 
# ls $APPCENTER_SOURCE_DIRECTORY/android/app
# ls $APPCENTER_SOURCE_DIRECTORY/android/app/src/main/jniLibs

echo "Post clone script. Done."