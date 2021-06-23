//
//  NSString+Hook.m
//  Demo
//
//  Created by wangjian on 2021/6/18.
//

#import "NSString+Hook.h"
#import <objc/runtime.h>
#import "SwizzledHelper.h"

@implementation NSString (Hook)


+ (void)load {
    
    [SwizzledHelper SwizzledMethod:objc_getClass("__NSCFString") OriginalSelector:@selector(substringFromIndex:) newSelector:@selector(hook_substringFromIndex:)];
    [SwizzledHelper SwizzledMethod:objc_getClass("__NSCFString") OriginalSelector:@selector(substringToIndex:) newSelector:@selector(hook_substringToIndex:)];
    [SwizzledHelper SwizzledMethod:objc_getClass("__NSCFString") OriginalSelector:@selector(substringWithRange:) newSelector:@selector(hook_substringWithRange:)];
}

- (NSString *)hook_substringFromIndex:(NSUInteger)from {
    if (from > self.length) {
        from = self.length;
    }
    return [self hook_substringFromIndex:from];
}

- (NSString *)hook_substringToIndex:(NSUInteger)to {
    if (to > self.length) {
        to = self.length;
    }
    return [self hook_substringToIndex:to];
}

- (NSString *)hook_substringWithRange:(NSRange)range {
    if (range.location > self.length) {
        range.location = self.length;
    }
    if (range.length > self.length) {
        range.length = self.length;
    }
    if (range.location + range.length > self.length) {
        range.length = self.length - range.location;
    }
    return [self hook_substringWithRange:range];
}

@end
