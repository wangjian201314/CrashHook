//
//  NSDictionary+Hook.m
//  Demo
//
//  Created by wangjian on 2021/6/18.
//

#import "NSDictionary+Hook.h"
#import <objc/runtime.h>
#import "SwizzledHelper.h"

@implementation NSDictionary (Hook)


+ (void)load {
    
    [SwizzledHelper SwizzledMethod:objc_getClass("__NSPlaceholderDictionary") OriginalSelector:@selector(setObject:forKey:) newSelector:@selector(hook_setObject:forKey:)];
    [SwizzledHelper SwizzledMethod:objc_getClass("__NSPlaceholderDictionary") OriginalSelector:@selector(setObject:forKeyedSubscript:) newSelector:@selector(hook_setObject:forKeyedSubscript:)];
}

- (void)hook_setObject:(id)object forKey:(id)key {
    if (object && key) {
        [self hook_setObject:object forKey:key];
    }
}

- (void)hook_setObject:(id)object forKeyedSubscript:(id)key {
    if (object && key) {
        [self hook_setObject:object forKeyedSubscript:key];
    }
}


@end
