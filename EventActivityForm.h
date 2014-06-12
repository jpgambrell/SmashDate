//
//  DateActivityForm.h
//  SmashDate
//
//  Created by Gambrell, John on 6/10/14.
//  Copyright (c) 2014 Gambrell, John. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FXForms.h"

@interface EventActivityForm : NSObject<FXForm>

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * locationName;
@property (nonatomic, retain) NSString * locationAddress;
@property (nonatomic, retain) NSString * locationPhone;
@property (nonatomic, retain) NSNumber * moneySpent;
@property (nonatomic, retain) NSString * notes;
@property (nonatomic, retain) NSString * type;
//@property (nonatomic, retain) DateEvent *dateEvent;

@end
