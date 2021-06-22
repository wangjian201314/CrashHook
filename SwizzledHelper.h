//
//  SwizzledHelper.h
//  Demo
//
//  Created by wangjian on 2021/6/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SwizzledHelper : NSObject


+ (void)SwizzledMethod:(Class)class OriginalSelector:(SEL)originalSelector newSelector:(SEL)newSelector;

@end

NS_ASSUME_NONNULL_END
