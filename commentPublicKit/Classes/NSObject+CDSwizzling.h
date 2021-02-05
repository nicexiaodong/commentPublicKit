//
//  NSObject+CDSwizzling.h
//  RunTimeDemo_Example
//
//  Created by chen dong on 2021/1/28.
//  Copyright © 2021 3397838812@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (CDSwizzling)
- (void)swizzleSEL:(SEL)originSEL withSEL:(SEL)swizzlingSEL;
@end

NS_ASSUME_NONNULL_END
