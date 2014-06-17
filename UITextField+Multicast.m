//
//  UITextField+Multicast.m
//  MulticastDelegateDemo
//
//  Created by Colin Eberhardt on 16/11/2012.
//  Copyright (c) 2012 Colin Eberhardt. All rights reserved.
//

#import "UITextField+Multicast.h"
#import <objc/runtime.h>

@implementation UITextField (Multicast)

NSString* const UITextFieldMulticastDelegateKey = @"multicastDelegate";

- (SHCMulticastDelegate *)multicastDelegate
{
    id multicastDelegate = objc_getAssociatedObject(self, (__bridge const void *)(UITextFieldMulticastDelegateKey));
    if (multicastDelegate == nil) {
        multicastDelegate = [[SHCMulticastDelegate alloc] init];
        objc_setAssociatedObject(self, (__bridge const void *)(UITextFieldMulticastDelegateKey), multicastDelegate, OBJC_ASSOCIATION_RETAIN);
        
        self.delegate = multicastDelegate;
    }
    
    return multicastDelegate;
}

@end
