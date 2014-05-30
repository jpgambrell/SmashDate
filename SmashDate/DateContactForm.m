//
//  UserProfileForm.m
//  SmashDate
//
//  Created by Gambrell, John on 5/29/14.
//  Copyright (c) 2014 Gambrell, John. All rights reserved.
//

#import "DateContactForm.h"


@implementation DateContactForm


- (NSArray *)fields
{
    return @[
             
              @{FXFormFieldKey: @"name", FXFormFieldHeader: @"Details"},
              @{FXFormFieldKey: @"address", FXFormFieldType: FXFormFieldTypeLongText},
              @"email",
              @"phone",
             @{FXFormFieldKey: @"twitter", FXFormFieldHeader: @"Socal Media"},
              @"facebook",
             
                @{FXFormFieldKey: @"birthday", FXFormFieldHeader: @"Additional Info"},
              @"interests",
              @{FXFormFieldKey: @"notes", FXFormFieldType: FXFormFieldTypeLongText},
            ];
}






/*- (NSDictionary *)emailField
{
    return @{@"textLabel.color": [UIColor redColor]};
}
*/
//we're happy with the layout and properties of our login form, but we
//want to add an additional button field at the end, so
//we've used the extraFields method

- (NSArray *)extraFields
{
    return @[
             
             //this field doesn't correspond to any property of the form
             //it's just an action button. the action will be called on first
             //object in the responder chain that implements the submitForm
             //method, which in this case would be the AppDelegate
             
             @{FXFormFieldTitle: @"Submit", FXFormFieldHeader: @"", FXFormFieldAction: @"submitLoginForm"},
             
             ];
}




@end
