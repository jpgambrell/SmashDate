//
//  EventDetailForm.m
//  SmashDate
//
//  Created by Gambrell, John on 6/10/14.
//  Copyright (c) 2014 Gambrell, John. All rights reserved.
//

#import "EventDetailForm.h"

@implementation EventDetailForm


- (NSDictionary *)eventActivityField
{
   return @{FXFormFieldInline: @NO, FXFormFieldHeader: @"Add Activities"};
    //return @{FXFormFieldHeader: @"Not Registered?"};
}


- (NSArray *)extraFields
{
    return @[
             
             //this field doesn't correspond to any property of the form
             //it's just an action button. the action will be called on first
             //object in the responder chain that implements the submitForm
             //method, which in this case would be the AppDelegate
             
             @{FXFormFieldTitle: @"Add Contacts", FXFormFieldHeader: @"", FXFormFieldAction: @"pickContactsForEvent"},
             
             ];
}



@end

