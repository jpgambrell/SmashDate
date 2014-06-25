//
//  DateContactFormTableViewController.m
//  SmashDate
//
//  Created by Gambrell, John on 6/17/14.
//  Copyright (c) 2014 Gambrell, John. All rights reserved.
//

#import "DateContactFormTableViewController.h"
#import "JGAppDelegate.h"

@interface DateContactFormTableViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic)  UITextField *selectedTextField;
- (IBAction)saveButtonClick:(id)sender;

@end

@implementation DateContactFormTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    JGAppDelegate *appDelegate = (JGAppDelegate *)[[UIApplication sharedApplication] delegate];
    self.managedObjectContext = appDelegate.managedObjectContext;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidAppear:(BOOL)animated{
    if (self.existingContact){

        self.lastName.text = self.existingContact.lastName;
        self.firstName.text = self.existingContact.firstName;
      //  self.birthday.text = self.existingContact.birthday;
        self.email.text = self.existingContact.email;
     //   self.facebook.text = self.existingContact.facebook;
        self.address.text = self.existingContact.address;
        //newDateContact.interests = [[dcForm.interests valueForKey:@"description"] componentsJoinedByString:@""];
    //    self.notes.text = self.existingContact.notes;
    //    self.phone.text = self.existingContact.phone;
    //    self.twitter.text = self.existingContact.twitter;
        //  dcForm.avatar = [UIImage imageWithData:self.existingContact.avatar];
        
        UIImage *image = [UIImage imageWithData:self.existingContact.avatar];
        if (image){
            self.avatar.image = image;
        }
        else {
            self.avatar.image = [UIImage imageNamed:@"user_female3-75.png"];
        }
        
        
    }
    else{
        if (self.avatar.image == nil){
            self.avatar.image = [UIImage imageNamed:@"user_female3-75.png"];
        }
    }
    
}

//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}
//
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    //super hack
    if (indexPath.section == 1 && indexPath.row == 0){
        NSLog(@"Photo Row Selected IndexPath: %i row %i", indexPath.section, indexPath.row);
    }
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

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    if ([self.selectedTextField isFirstResponder]){
        [self.selectedTextField resignFirstResponder];
    }
}

#pragma mark - TextField Delegates Methods
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.selectedTextField = textField;
    [textField selectAll:nil];
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
  //  [textField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.returnKeyType == UIReturnKeyNext)
    {
        if ([textField isEqual:self.firstName]){
            [self.lastName becomeFirstResponder];
        }
        
    }
    else
    {
        [textField resignFirstResponder];
    }
    return NO;
}

#pragma mark - Save Contact

- (IBAction)saveButtonClick:(id)sender {
  //  DateContactForm * dcForm = self.formController.form;
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
    
    
    modifiedDateContact.sectionTitle = [[NSString stringWithString:self.lastName.text] substringToIndex:1];
    modifiedDateContact.lastName = self.lastName.text;
    modifiedDateContact.firstName = self.firstName.text;
    modifiedDateContact.address = self.address.text;
  //  modifiedDateContact.birthday = dcForm.birthday;
    modifiedDateContact.email = self.email.text;
   // modifiedDateContact.facebook = dcForm.facebook;
   // modifiedDateContact.interests = [[dcForm.interests valueForKey:@"description"] componentsJoinedByString:@""];
    //modifiedDateContact.notes = dcForm.notes;
    modifiedDateContact.phone = self.phone.text;
   // modifiedDateContact.twitter = dcForm.twitter;
    
    modifiedDateContact.avatar =  [NSData dataWithData:UIImagePNGRepresentation(self.avatar.image)];
    
    
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
