//
//  JGEventDataStore.h
//  SmashDate
//
//  Created by Gambrell, John on 6/5/14.
//  Copyright (c) 2014 Gambrell, John. All rights reserved.
//
#import <EventKit/EventKit.h>
#import <Foundation/Foundation.h>

@interface JGEventDataStore : NSObject
@property (nonatomic, strong) EKEventStore *eventStore;
@property (nonatomic, strong) EKCalendar *defaultCalendar;
@property (nonatomic, strong) NSMutableArray *eventsList;
@end
