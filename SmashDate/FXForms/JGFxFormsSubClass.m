//
//  JGFxFormsSubClass.m
//  SmashDate
//
//  Created by Gambrell, John on 6/16/14.
//  Copyright (c) 2014 Gambrell, John. All rights reserved.
//

#import "JGFxFormsSubClass.h"

@implementation JGSubFXFormTextFieldCell
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    NSLog(@"ding ding ding");
    return YES;
}

@end

