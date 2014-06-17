//
//  UITextField+Multicast.h
//  MulticastDelegateDemo
//
//  Created by Colin Eberhardt on 16/11/2012.
//  Copyright (c) 2012 Colin Eberhardt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHCMulticastDelegate.h"

@interface UITextField (Multicast)

@property (readonly) SHCMulticastDelegate* multicastDelegate;

@end
