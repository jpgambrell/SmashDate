//
//  DateContact.h
//  SmashDate
//
//  Created by Gambrell, John on 6/12/14.
//  Copyright (c) 2014 Gambrell, John. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DateEvent;

@interface DateContact : NSManagedObject

@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSDate * birthday;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * facebook;
@property (nonatomic, retain) NSString * interests;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * notes;
@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) NSString * twitter;
@property (nonatomic, retain) NSData * avatar;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * sectionTitle;
@property (nonatomic, retain) NSSet *dateEvent;
@end

@interface DateContact (CoreDataGeneratedAccessors)

- (void)addDateEventObject:(DateEvent *)value;
- (void)removeDateEventObject:(DateEvent *)value;
- (void)addDateEvent:(NSSet *)values;
- (void)removeDateEvent:(NSSet *)values;

@end
