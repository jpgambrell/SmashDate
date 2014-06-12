//
//  DateActivity.h
//  SmashDate
//
//  Created by Gambrell, John on 6/5/14.
//  Copyright (c) 2014 Gambrell, John. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DateEvent;

@interface DateActivity : NSManagedObject

@property (nonatomic, retain) NSString * locationAddress;
@property (nonatomic, retain) NSString * locationName;
@property (nonatomic, retain) NSString * locationPhone;
@property (nonatomic, retain) NSDecimalNumber * moneySpent;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * notes;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) DateEvent *dateEvent;

@end
