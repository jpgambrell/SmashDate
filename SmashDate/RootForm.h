//
//  RootForm.h
//  BasicExample
//
//  Created by Nick Lockwood on 04/03/2014.
//  Copyright (c) 2014 Charcoal Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FXForms.h"
#import "EventDetailForm.h"
#import "DateContactForm.h"
//#import "RegistrationForm.h"


@interface RootForm : NSObject <FXForm>

@property (nonatomic, strong) EventDetailForm *eventDetail;
@property (nonatomic, strong) DateContactForm *dateContact;

@end
