//
//  JGViewController.m
//  SmashDate
//
//  Created by Gambrell, John on 5/29/14.
//  Copyright (c) 2014 Gambrell, John. All rights reserved.
//

#import "DateContactViewController.h"
#import "DateContactForm.h"
#import "DateContact.h"
#import "JGAppDelegate.h"


@interface DateContactViewController ()

@end

@implementation DateContactViewController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        self.formController.form = [[DateContactForm alloc]init];
//    }
//    return self;
//}
- (void) setUpDateContactForm{
    if (self.formController.form){
        self.formController.form = nil;
    }
     self.formController.form = [[DateContactForm alloc]init];
    [self.tableView reloadData];
}

- (id)initWithCoder:(NSCoder*)aDecoder
{
    if(self = [super initWithCoder:aDecoder])
    {
        if (self) {
            //self.formController.form = [[DateContactForm alloc]init];
            [self setUpDateContactForm];
        }
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated{
    
    if (self.existingContact){
        
        DateContactForm *dcForm = self.formController.form;
        
        dcForm.lastName = self.existingContact.lastName;
        dcForm.firstName = self.existingContact.firstName;
        dcForm.birthday = self.existingContact.birthday;
        dcForm.email = self.existingContact.email;
        dcForm.facebook = self.existingContact.facebook;
        dcForm.address = self.existingContact.address;
        //newDateContact.interests = [[dcForm.interests valueForKey:@"description"] componentsJoinedByString:@""];
        dcForm.notes = self.existingContact.notes;
        dcForm.phone = self.existingContact.phone;
        dcForm.twitter = self.existingContact.twitter;
      //  dcForm.avatar = [UIImage imageWithData:self.existingContact.avatar];
       
        UIImage *image = [UIImage imageWithData:self.existingContact.avatar];
        if (image){
            dcForm.avatar = image;
        }
        else {
            dcForm.avatar = [UIImage imageNamed:@"user_female3-75.png"];
        }

        
    }
    
}

-(void) viewDidDisappear:(BOOL)animated{
    self.existingContact = nil;
    
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
    DateContact* modifiedDateContact;
    BOOL isNewContact;
    
    
    //now we can display a form value in our alert
   // DateContact *newDateContact = [NSEntityDescription insertNewObjectForEntityForName:@"DateContact" inManagedObjectContext:self.managedObjectContext];
   
    if(self.existingContact){
        modifiedDateContact = self.existingContact;
        isNewContact = NO;
    }
    else{
        modifiedDateContact = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([DateContact class]) inManagedObjectContext:self.managedObjectContext];
        isNewContact = YES;
    }
   // DateContact* newDateContact = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([DateContact class]) inManagedObjectContext:self.managedObjectContext];
    
    
    modifiedDateContact.sectionTitle = [[NSString stringWithString:dcForm.lastName] substringToIndex:1];
    modifiedDateContact.lastName = dcForm.lastName;
    modifiedDateContact.firstName = dcForm.firstName;
    modifiedDateContact.address = dcForm.address;
    modifiedDateContact.birthday = dcForm.birthday;
    modifiedDateContact.email = dcForm.email;
    modifiedDateContact.facebook = dcForm.facebook;
    modifiedDateContact.interests = [[dcForm.interests valueForKey:@"description"] componentsJoinedByString:@""];
    modifiedDateContact.notes = dcForm.notes;
    modifiedDateContact.phone = dcForm.phone;
    modifiedDateContact.twitter = dcForm.twitter;
    
    modifiedDateContact.avatar =  [NSData dataWithData:UIImagePNGRepresentation(dcForm.avatar)];
  
    
    NSError *anyError = nil;
    BOOL savedSuccessfully = [self.managedObjectContext save:&anyError];
    if( !savedSuccessfully ) { /* do something with anyError */
        NSLog(@"Error saving ");
    
    }   else {
        
    if(isNewContact){
        [[[UIAlertView alloc] initWithTitle:@"New Contact Saved." message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil] show];
        self.existingContact = modifiedDateContact;
    }
    else{
    [[[UIAlertView alloc] initWithTitle:@"Contact Updated." message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil] show];
    }
    [self.tableView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
    }
}

@end
