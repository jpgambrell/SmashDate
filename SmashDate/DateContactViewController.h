//
//  JGViewController.h
//  SmashDate
//
//  Created by Gambrell, John on 5/29/14.
//  Copyright (c) 2014 Gambrell, John. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FXForms.h"
#import "DateContact.h"


@interface DateContactViewController : FXFormViewController
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) DateContact *existingContact;

@end
