//
//  DateContactPickerTableViewController.h
//  SmashDate
//
//  Created by Gambrell, John on 6/11/14.
//  Copyright (c) 2014 Gambrell, John. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DateContactPickerTableViewController : UITableViewController<NSFetchedResultsControllerDelegate>
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@end
