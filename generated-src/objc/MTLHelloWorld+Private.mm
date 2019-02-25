// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from motherslove.djinni

#import "MTLHelloWorld+Private.h"
#import "MTLHelloWorld.h"
#import "DJICppWrapperCache+Private.h"
#import "DJIError.h"
#import "DJIMarshal+Private.h"
#include <exception>
#include <stdexcept>
#include <utility>

static_assert(__has_feature(objc_arc), "Djinni requires ARC to be enabled for this file");

@interface MTLHelloWorld ()

- (id)initWithCpp:(const std::shared_ptr<::motherslove::HelloWorld>&)cppRef;

@end

@implementation MTLHelloWorld {
    ::djinni::CppProxyCache::Handle<std::shared_ptr<::motherslove::HelloWorld>> _cppRefHandle;
}

- (id)initWithCpp:(const std::shared_ptr<::motherslove::HelloWorld>&)cppRef
{
    if (self = [super init]) {
        _cppRefHandle.assign(cppRef);
    }
    return self;
}

+ (nullable MTLHelloWorld *)create {
    try {
        auto objcpp_result_ = ::motherslove::HelloWorld::create();
        return ::djinni_generated::HelloWorld::fromCpp(objcpp_result_);
    } DJINNI_TRANSLATE_EXCEPTIONS()
}

- (nonnull NSString *)getHelloWorld {
    try {
        auto objcpp_result_ = _cppRefHandle.get()->get_hello_world();
        return ::djinni::String::fromCpp(objcpp_result_);
    } DJINNI_TRANSLATE_EXCEPTIONS()
}

- (int32_t)add:(int32_t)a
             b:(int32_t)b {
    try {
        auto objcpp_result_ = _cppRefHandle.get()->add(::djinni::I32::toCpp(a),
                                                       ::djinni::I32::toCpp(b));
        return ::djinni::I32::fromCpp(objcpp_result_);
    } DJINNI_TRANSLATE_EXCEPTIONS()
}

namespace djinni_generated {

auto HelloWorld::toCpp(ObjcType objc) -> CppType
{
    if (!objc) {
        return nullptr;
    }
    return objc->_cppRefHandle.get();
}

auto HelloWorld::fromCppOpt(const CppOptType& cpp) -> ObjcType
{
    if (!cpp) {
        return nil;
    }
    return ::djinni::get_cpp_proxy<MTLHelloWorld>(cpp);
}

}  // namespace djinni_generated

@end
