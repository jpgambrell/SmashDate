//
//  DateActivity.h
//  SmashDate
//
//  Created by Gambrell, John on 6/3/14.
//  Copyright (c) 2014 Gambrell, John. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DateActivity : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * notes;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSDecimalNumber * moneySpent;
@property (nonatomic, retain) NSManagedObject *dateEvent;

@end
