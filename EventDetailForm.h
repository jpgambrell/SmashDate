//
//  EventDetailForm.h
//  SmashDate
//
//  Created by Gambrell, John on 6/10/14.
//  Copyright (c) 2014 Gambrell, John. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FXForms.h"
#import "EventActivityForm.h"

@interface EventDetailForm : NSObject<FXForm>

@property (nonatomic, copy) NSString * title;
@property (nonatomic, retain) NSDate * startDate;
@property (nonatomic, assign) NSDate * endDate;
@property (nonatomic, copy) NSString * notes;
@property (nonatomic, strong) EventActivityForm *eventActivity;

//@property (nonatomic, retain) NSSet *dateActivity;  //make a new form
//@property (nonatomic, retain) NSSet *dateContact;   //make a new form


@end
