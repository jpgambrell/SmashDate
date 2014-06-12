//
//  EventsTableViewCell.h
//  SmashDate
//
//  Created by Gambrell, John on 6/10/14.
//  Copyright (c) 2014 Gambrell, John. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *eventDateView;
@property (weak, nonatomic) IBOutlet UIView *eventDescView;
@property (weak, nonatomic) IBOutlet UILabel *monthLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayofWeekLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventTitle;
@end
