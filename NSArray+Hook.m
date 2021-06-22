//
//  NSArray+Hook.m
//  Demo
//
//  Created by wangjian on 2021/6/17.
//

#import "NSArray+Hook.h"
#import <objc/runtime.h>
#import "SwizzledHelper.h"


@implementation NSArray (Hook)

+ (void)load {
    //__NSArrayI:不可变,2个或2以上元素  __NSArray0:空数组  __NSArrayM:可变  __NSSingleObjectArrayI:只有单个元素
//    [array objectAtIndex:8]
    [SwizzledHelper SwizzledMethod:objc_getClass("__NSArrayI") OriginalSelector:@selector(objectAtIndex:) newSelector:@selector(array_objectAtIndex:)];
    [SwizzledHelper SwizzledMethod:objc_getClass("__NSArray0") OriginalSelector:@selector(objectAtIndex:) newSelector:@selector(empty_objectAtIndex:)];
    [SwizzledHelper SwizzledMethod:objc_getClass("__NSArrayM") OriginalSelector:@selector(objectAtIndex:) newSelector:@selector(arrayM_objectAtIndex:)];
    [SwizzledHelper SwizzledMethod:objc_getClass("__NSSingleObjectArrayI") OriginalSelector:@selector(objectAtIndex:) newSelector:@selector(singleArray_objectAtIndex:)];

    //array[8]
    [SwizzledHelper SwizzledMethod:objc_getClass("__NSArrayI") OriginalSelector:@selector(objectAtIndexedSubscript:) newSelector:@selector(array_objectAtIndexedSubscript:)];
    [SwizzledHelper SwizzledMethod:objc_getClass("__NSArray0") OriginalSelector:@selector(objectAtIndexedSubscript:) newSelector:@selector(empty_objectAtIndexedSubscript:)];
    [SwizzledHelper SwizzledMethod:objc_getClass("__NSArrayM") OriginalSelector:@selector(objectAtIndexedSubscript:) newSelector:@selector(arrayM_objectAtIndexedSubscript:)];
    [SwizzledHelper SwizzledMethod:objc_getClass("__NSSingleObjectArrayI") OriginalSelector:@selector(objectAtIndexedSubscript:) newSelector:@selector(singleArray_objectAtIndexedSubscript:)];

    [SwizzledHelper SwizzledMethod:objc_getClass("__NSArrayM") OriginalSelector:@selector(removeObjectAtIndex:) newSelector:@selector(arrayM_removeObjectAtIndex:)];
    [SwizzledHelper SwizzledMethod:objc_getClass("__NSArrayM") OriginalSelector:@selector(replaceObjectAtIndex:withObject:) newSelector:@selector(arrayM_replaceObjectAtIndex:withObject:)];
    [SwizzledHelper SwizzledMethod:objc_getClass("__NSArrayM") OriginalSelector:@selector(insertObject:atIndex:) newSelector:@selector(arrayM_insertObject:atIndex:)];
}

- (id)array_objectAtIndex:(NSUInteger)index {
    if (index < self.count) {
        return [self array_objectAtIndex:index];
    } else {
        return nil;
    }
}

- (id)empty_objectAtIndex:(NSUInteger)index {
    if (index < self.count) {
        return [self empty_objectAtIndex:index];
    } else {
        return nil;
    }
}

- (id)arrayM_objectAtIndex:(NSUInteger)index {
    if (index < self.count) {
        return [self arrayM_objectAtIndex:index];
    } else {
        return nil;
    }
}

- (id)singleArray_objectAtIndex:(NSUInteger)index {
    if (index < self.count) {
        return [self singleArray_objectAtIndex:index];
    } else {
        return nil;
    }
}

- (id)array_objectAtIndexedSubscript:(NSUInteger)index {
    if (index < self.count) {
        return [self array_objectAtIndexedSubscript:index];
    } else {
        return nil;
    }
}

- (id)empty_objectAtIndexedSubscript:(NSUInteger)index {
    if (index < self.count) {
        return [self empty_objectAtIndexedSubscript:index];
    } else {
        return nil;
    }
}

- (id)arrayM_objectAtIndexedSubscript:(NSUInteger)index {
    if (index < self.count) {
        return [self arrayM_objectAtIndexedSubscript:index];
    } else {
        return nil;
    }
}

- (id)singleArray_objectAtIndexedSubscript:(NSUInteger)index {
    if (index < self.count) {
        return [self singleArray_objectAtIndexedSubscript:index];
    } else {
        return nil;
    }
}

- (void)arrayM_insertObject:(id)object atIndex:(NSUInteger)index {
    if (object && index <= self.count) {
        [self arrayM_insertObject:object atIndex:index];
    }
}

- (void)arrayM_removeObjectAtIndex:(NSUInteger)index {
    if (index < self.count) {
         [self arrayM_removeObjectAtIndex:index];
    }
}

- (void)arrayM_replaceObjectAtIndex:(NSUInteger)index withObject:(id)object {
    if (object && index < self.count) {
         [self arrayM_replaceObjectAtIndex:index withObject:object];
    }
}


@end
