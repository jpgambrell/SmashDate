//
//  DateEvent.h
//  SmashDate
//
//  Created by Gambrell, John on 6/3/14.
//  Copyright (c) 2014 Gambrell, John. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DateActivity, DateContact;

@interface DateEvent : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSDate * startDate;
@property (nonatomic, retain) NSDate * startTime;
@property (nonatomic, retain) NSSet *dateContact;
@property (nonatomic, retain) NSSet *dateActivity;
@end

@interface DateEvent (CoreDataGeneratedAccessors)

- (void)addDateContactObject:(DateContact *)value;
- (void)removeDateContactObject:(DateContact *)value;
- (void)addDateContact:(NSSet *)values;
- (void)removeDateContact:(NSSet *)values;

- (void)addDateActivityObject:(DateActivity *)value;
- (void)removeDateActivityObject:(DateActivity *)value;
- (void)addDateActivity:(NSSet *)values;
- (void)removeDateActivity:(NSSet *)values;

@end
