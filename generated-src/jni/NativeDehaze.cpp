// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from motherslove.djinni

#include "NativeDehaze.hpp"  // my header
#include "Marshal.hpp"

namespace djinni_generated {

NativeDehaze::NativeDehaze() : ::djinni::JniInterface<::motherslove::Dehaze, NativeDehaze>("com/motherslove/Dehaze$CppProxy") {}

NativeDehaze::~NativeDehaze() = default;


CJNIEXPORT void JNICALL Java_com_motherslove_Dehaze_00024CppProxy_nativeDestroy(JNIEnv* jniEnv, jobject /*this*/, jlong nativeRef)
{
    try {
        DJINNI_FUNCTION_PROLOGUE1(jniEnv, nativeRef);
        delete reinterpret_cast<::djinni::CppProxyHandle<::motherslove::Dehaze>*>(nativeRef);
    } JNI_TRANSLATE_EXCEPTIONS_RETURN(jniEnv, )
}

CJNIEXPORT jobject JNICALL Java_com_motherslove_Dehaze_00024CppProxy_create(JNIEnv* jniEnv, jobject /*this*/)
{
    try {
        DJINNI_FUNCTION_PROLOGUE0(jniEnv);
        auto r = ::motherslove::Dehaze::create();
        return ::djinni::release(::djinni_generated::NativeDehaze::fromCpp(jniEnv, r));
    } JNI_TRANSLATE_EXCEPTIONS_RETURN(jniEnv, 0 /* value doesn't matter */)
}

CJNIEXPORT jstring JNICALL Java_com_motherslove_Dehaze_00024CppProxy_native_1dehaze(JNIEnv* jniEnv, jobject /*this*/, jlong nativeRef, jstring j_uri, jstring j_media)
{
    try {
        DJINNI_FUNCTION_PROLOGUE1(jniEnv, nativeRef);
        const auto& ref = ::djinni::objectFromHandleAddress<::motherslove::Dehaze>(nativeRef);
        auto r = ref->dehaze(::djinni::String::toCpp(jniEnv, j_uri),
                             ::djinni::String::toCpp(jniEnv, j_media));
        return ::djinni::release(::djinni::String::fromCpp(jniEnv, r));
    } JNI_TRANSLATE_EXCEPTIONS_RETURN(jniEnv, 0 /* value doesn't matter */)
}

}  // namespace djinni_generated
