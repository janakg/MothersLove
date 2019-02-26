//
//  HelloWorld.m
//  ReactNativeWithCppBoilerplate
//
//  Created by Ken Steiner on 02.01.18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "HelloWorld.h"
#import "MTLHelloWorld.h"
#import "React/RCTLog.h"
#import "React/RCTConvert.h"

@implementation HelloWorld {
  MTLHelloWorld *_cppApi;
  NSString *message;
}

// This exposes the current module to Javascript
RCT_EXPORT_MODULE();

// Explicitly expose methods to JavaScript
RCT_REMAP_METHOD(getHelloWorld,
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
  [self setCppApiIfNotSet];
  
  message = [_cppApi getHelloWorld];
  RCTLogInfo(@"The greeting message is: %@", message);
  if (message) {
    resolve(message);
  } else {
    reject(@"get_error", @"Error getting message", nil);
  }
}

RCT_REMAP_METHOD(add,
                 a:(nonnull NSNumber *)a
                 b:(nonnull NSNumber *)b
                 resolver2:(RCTPromiseResolveBlock)resolve
                 rejecter2:(RCTPromiseRejectBlock)reject)
{
  [self setCppApiIfNotSet];
  
  int32_t aInt = (int32_t)a.intValue;
  int32_t bInt = (int32_t)b.intValue;
  int32_t sum = [_cppApi add:aInt b:bInt];
  NSNumber *sumInteger = [NSNumber numberWithInt:sum];

  RCTLogInfo(@"The sum is: %@", sumInteger);
  if (sumInteger) {
    resolve(sumInteger);
  } else {
    reject(@"get_error", @"Error getting sum", nil);
  }
}

- (void)setCppApiIfNotSet
{
  if (!_cppApi) {
    _cppApi = [MTLHelloWorld create];
  }
}

@end
