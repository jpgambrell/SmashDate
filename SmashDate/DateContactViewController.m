//
//  JGViewController.m
//  SmashDate
//
//  Created by Gambrell, John on 5/29/14.
//  Copyright (c) 2014 Gambrell, John. All rights reserved.
//

#import "JGViewController.h"
#import "DateContactForm.h"
#import "DateContact.h"
#import "JGAppDelegate.h"


@interface JGViewController ()

@end

@implementation JGViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.formController.form = [[DateContactForm alloc]init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    JGAppDelegate *appDelegate = (JGAppDelegate *)[[UIApplication sharedApplication] delegate];
    self.managedObjectContext = appDelegate.managedObjectContext;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark FXForms Methods
- (void)submitLoginForm
{
    DateContactForm * dcForm = self.formController.form;
    
    
    
    //now we can display a form value in our alert
    DateContact *newDateContact = [NSEntityDescription insertNewObjectForEntityForName:@"DateContact" inManagedObjectContext:self.managedObjectContext];
    
    newDateContact.name = dcForm.name;
    newDateContact.birthday = dcForm.birthday;
    newDateContact.email = dcForm.email;
    newDateContact.facebook = dcForm.facebook;
    newDateContact.interests = [[dcForm.interests valueForKey:@"description"] componentsJoinedByString:@""];
    newDateContact.notes = dcForm.notes;
    newDateContact.phone = dcForm.phone;
    newDateContact.twitter = dcForm.twitter;
    

    
    NSError *anyError = nil;
    BOOL savedSuccessfully = [self.managedObjectContext save:&anyError];
    if( !savedSuccessfully ) { /* do something with anyError */
        NSLog(@"Error saving ");
    
    }   else {
        [[[UIAlertView alloc] initWithTitle:@"Login Form Submitted" message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil] show];}

    }

@end
