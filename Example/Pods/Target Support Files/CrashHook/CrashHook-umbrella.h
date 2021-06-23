#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "NSArray+Hook.h"
#import "NSDictionary+Hook.h"
#import "NSString+Hook.h"
#import "SwizzledHelper.h"

FOUNDATION_EXPORT double CrashHookVersionNumber;
FOUNDATION_EXPORT const unsigned char CrashHookVersionString[];

