// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from motherslove.djinni

#import "MTLDehaze+Private.h"
#import "MTLDehaze.h"
#import "DJICppWrapperCache+Private.h"
#import "DJIError.h"
#import "DJIMarshal+Private.h"
#include <exception>
#include <stdexcept>
#include <utility>

static_assert(__has_feature(objc_arc), "Djinni requires ARC to be enabled for this file");

@interface MTLDehaze ()

- (id)initWithCpp:(const std::shared_ptr<::motherslove::Dehaze>&)cppRef;

@end

@implementation MTLDehaze {
    ::djinni::CppProxyCache::Handle<std::shared_ptr<::motherslove::Dehaze>> _cppRefHandle;
}

- (id)initWithCpp:(const std::shared_ptr<::motherslove::Dehaze>&)cppRef
{
    if (self = [super init]) {
        _cppRefHandle.assign(cppRef);
    }
    return self;
}

+ (nullable MTLDehaze *)create {
    try {
        auto objcpp_result_ = ::motherslove::Dehaze::create();
        return ::djinni_generated::Dehaze::fromCpp(objcpp_result_);
    } DJINNI_TRANSLATE_EXCEPTIONS()
}

- (nonnull NSString *)dehaze:(nonnull NSString *)uri
                       media:(nonnull NSString *)media {
    try {
        auto objcpp_result_ = _cppRefHandle.get()->dehaze(::djinni::String::toCpp(uri),
                                                          ::djinni::String::toCpp(media));
        return ::djinni::String::fromCpp(objcpp_result_);
    } DJINNI_TRANSLATE_EXCEPTIONS()
}

namespace djinni_generated {

auto Dehaze::toCpp(ObjcType objc) -> CppType
{
    if (!objc) {
        return nullptr;
    }
    return objc->_cppRefHandle.get();
}

auto Dehaze::fromCppOpt(const CppOptType& cpp) -> ObjcType
{
    if (!cpp) {
        return nil;
    }
    return ::djinni::get_cpp_proxy<MTLDehaze>(cpp);
}

}  // namespace djinni_generated

@end
