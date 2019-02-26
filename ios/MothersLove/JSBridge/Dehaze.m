#import "Dehaze.h"
#import "MTLDehaze.h"

@implementation Dehaze {
    MTLDehaze *_dehazeInterface;
}

RCT_EXPORT_MODULE();

RCT_REMAP_METHOD(run,
                 uri:(NSString *)uri
                 media:(NSString *)media
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
    _dehazeInterface = [MTLDehaze create];
    NSString *response = [_dehazeInterface dehaze:uri media:media];
    if (response) {
        resolve(response);
    } else {
        reject(@"get_error", @"Error with Dehaze", nil);
    }
}

@end
