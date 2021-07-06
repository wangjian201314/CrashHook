//
//  NSObject+Hook.m
//  CrashHook
//
//  Created by wangjian on 2021/7/6.
//

#import "NSObject+Hook.h"
#import <objc/runtime.h>
#import "SwizzledHelper.h"

@implementation NSObject (Hook)

+ (void)load {
    
    [SwizzledHelper SwizzledMethod:objc_getClass("NSObject") OriginalSelector:@selector(methodSignatureForSelector:) newSelector:@selector(hook_methodSignatureForSelector:)];
    [SwizzledHelper SwizzledMethod:objc_getClass("NSObject") OriginalSelector:@selector(forwardInvocation:) newSelector:@selector(hook_forwardInvocation:)];
}

- (NSMethodSignature *)hook_methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature* signature = [self hook_methodSignatureForSelector:aSelector];
    if (signature) {
        return signature;
    }
    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}

- (void)hook_forwardInvocation:(NSInvocation *)anInvocation {
    NSString *message = [NSString
        stringWithFormat:@"Unrecognized instance class:%@ and selector:%@", NSStringFromClass(self.class), NSStringFromSelector(anInvocation.selector)];
    NSLog(@"%@",message);
}

@end
