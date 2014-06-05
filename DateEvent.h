//
//  DateEvent.h
//  SmashDate
//
//  Created by Gambrell, John on 6/5/14.
//  Copyright (c) 2014 Gambrell, John. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DateActivity, DateContact;

@interface DateEvent : NSManagedObject

@property (nonatomic, retain) NSDate * endDate;
@property (nonatomic, retain) NSString * notes;
@property (nonatomic, retain) NSDate * startDate;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSSet *dateActivity;
@property (nonatomic, retain) NSSet *dateContact;
@end

@interface DateEvent (CoreDataGeneratedAccessors)

- (void)addDateActivityObject:(DateActivity *)value;
- (void)removeDateActivityObject:(DateActivity *)value;
- (void)addDateActivity:(NSSet *)values;
- (void)removeDateActivity:(NSSet *)values;

- (void)addDateContactObject:(DateContact *)value;
- (void)removeDateContactObject:(DateContact *)value;
- (void)addDateContact:(NSSet *)values;
- (void)removeDateContact:(NSSet *)values;

@end
