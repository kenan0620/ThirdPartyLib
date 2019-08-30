//
//  UIViewController+Swizzling.m
//  ThirdPartyLib
//
//  Created by conan on 2019/8/30.
//  Copyright © 2019年 conan. All rights reserved.
//

#import "UIViewController+Swizzling.h"
#import <objc/runtime.h>
@implementation UIViewController (Swizzling)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method fromMethod = class_getInstanceMethod([self class], @selector(viewWillAppear:));
        Method toMethod = class_getInstanceMethod([self class], @selector(viewWillAppearSwizzling));
        
        BOOL isAddMethod = class_addMethod([self class], method_getName(fromMethod), method_getImplementation(fromMethod), method_getTypeEncoding(fromMethod));
        
        if (isAddMethod) {
            class_replaceMethod([self class], method_getName(fromMethod), method_getImplementation(toMethod), method_getTypeEncoding(toMethod));
        }else{
            method_exchangeImplementations(fromMethod, toMethod);
        }
    });

}


- (void)viewWillAppearSwizzling{
    self.title = NSStringFromClass(self.class);
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]
                                             initWithTitle:@""
                                             style:UIBarButtonItemStylePlain
                                             target:self
                                             action:nil];
    [self viewWillAppearSwizzling];
}
@end
