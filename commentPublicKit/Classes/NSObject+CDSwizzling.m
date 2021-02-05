//
//  NSObject+CDSwizzling.m
//  RunTimeDemo_Example
//
//  Created by chen dong on 2021/1/28.
//  Copyright © 2021 3397838812@qq.com. All rights reserved.
//

#import "NSObject+CDSwizzling.h"
#import <objc/runtime.h>
@implementation NSObject (CDSwizzling)
- (void)swizzleSEL:(SEL)originSEL withSEL:(SEL)swizzlingSEL{
    
    Class class = [self class];
    
    Method originMethod = class_getInstanceMethod(class, originSEL);
    
    Method currentMethod = class_getInstanceMethod(class, swizzlingSEL);
    
    
    BOOL didAddMethod = class_addMethod(class, originSEL, method_getImplementation(currentMethod), method_getTypeEncoding(currentMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizzlingSEL, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    }else{
        method_exchangeImplementations(originMethod, currentMethod);
    }
}
@end
