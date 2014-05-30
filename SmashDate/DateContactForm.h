//
//  UserProfileForm.h
//  SmashDate
//
//  Created by Gambrell, John on 5/29/14.
//  Copyright (c) 2014 Gambrell, John. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FXForms.h"

@interface DateContactForm : NSObject<FXForm>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *twitter;
@property (nonatomic, copy) NSString *facebook;
@property (nonatomic, copy) NSDate *birthday;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSArray *interests;
@property (nonatomic, copy) NSString *notes;


@end