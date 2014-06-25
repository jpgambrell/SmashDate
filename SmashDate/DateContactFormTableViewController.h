//
//  DateContactFormTableViewController.h
//  SmashDate
//
//  Created by Gambrell, John on 6/17/14.
//  Copyright (c) 2014 Gambrell, John. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateContact.h"

@interface DateContactFormTableViewController : UITableViewController
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) DateContact *existingContact;
@end
