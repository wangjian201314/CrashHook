//
//  SwizzledHelper.m
//  Demo
//
//  Created by wangjian on 2021/6/18.
//

#import "SwizzledHelper.h"
#import <objc/runtime.h>

@implementation SwizzledHelper


+ (void)SwizzledMethod:(Class)class OriginalSelector:(SEL)originalSelector newSelector:(SEL)newSelector {
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method newMethod = class_getInstanceMethod(class, newSelector);
//    if (originMethod && newMethod) {
//        method_exchangeImplementations(originMethod, newMethod);
//    }
    
    //class_addMethod 添加的SEL是 originalSelector ，IMP 是 method_getImplementation(originalMethod)，我称他们为原配，
       //如果本类中，已经有 originalSelector，再添加 originalSelector， 肯定返回NO，添加失败，那就直接交换了，跟第一版hook流程一模一样了,
       //如果本类中，没有此SEL，那就会去父类里找，返回的就是父类里的信息，然后将父类的信息，添加到本类中，就相当于，本类完全的继承了父类的方法，
       BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
       if (didAddMethod) {
           //添加成功后，本类中，已经有一个originalSelector方法了
           //我们第一次获得originalMethod是返回父类的originalMethod
           //我们需要再重新获得一下originalMethod，这次返回的不是父类的originalMethod
           //而是我们刚刚class_addMethod添加的到本类的originalMethod
           
           originalMethod = class_getInstanceMethod(class, originalSelector);
       }
       
       //走到这，就证明了，本类中肯定已经有这两个方法了，那就这样直接交换吧。
       method_exchangeImplementations(newMethod, originalMethod);
}

void shfhds(Class class, NSString *shdj) {
    
}

@end
