//
//  DateContactPickerTableViewController.m
//  SmashDate
//
//  Created by Gambrell, John on 6/11/14.
//  Copyright (c) 2014 Gambrell, John. All rights reserved.
//

#import "DateContactPickerTableViewController.h"
#import "JGAppDelegate.h"
#import "DateContact.h"
#import "DateContactViewController.h"
#import "DateContactsTableViewCell.h"

@interface DateContactPickerTableViewController ()


@end

@implementation DateContactPickerTableViewController

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

-(void) viewDidDisappear:(BOOL)animated{
   // self.fetchedResultsController = nil;
   // [NSFetchedResultsController deleteCacheWithName:@"FetchCache"];
    
}
-(void)viewWillAppear:(BOOL)animated{
  //  NSError *error;
    
   // [self.fetchedResultsController performFetch:&error];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return self.fetchedResultsController.sections.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    id  sectionInfo =[self.fetchedResultsController.sections objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}
-(void) configureCell:(DateContactsTableViewCell *)cell atIndexPath:(NSIndexPath *) indexPath{
    DateContact *contact = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.nameTextLabel.text = [NSString stringWithFormat:@"%@ %@",contact.firstName, contact.lastName];
   
    UIImage *image = [UIImage imageWithData:contact.avatar];
    if (image){
        cell.avatarImageView.image = image;
    }
    else {
        cell.avatarImageView.image = [UIImage imageNamed:@"user_female3-75.png"];
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DateContactsTableViewCell *cell = (DateContactsTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"ContactPickerCell" forIndexPath:indexPath];
    
    // Configure the cell...
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.fetchedResultsController.sectionIndexTitles objectAtIndex:section];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.fetchedResultsController.sectionIndexTitles;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    [self  performSegueWithIdentifier:@"DateContactVC" sender:self];
}
- (IBAction)addNewContactClick:(id)sender {
    [self  performSegueWithIdentifier:@"DateContactVC" sender:sender];
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.managedObjectContext deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
        
        NSError *anyError;
        BOOL savedSuccessfully = [self.managedObjectContext save:&anyError];
        if( !savedSuccessfully ) { /* do something with anyError */
            NSLog(@"Error saving ");
            
        }

      //  [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([sender isKindOfClass:[DateContactPickerTableViewController class]]) {
        DateContactViewController *dVC = (DateContactViewController*)[segue destinationViewController];
        dVC.existingContact = (DateContact*)[self.fetchedResultsController objectAtIndexPath:self.tableView.indexPathForSelectedRow];
        
    }
   
}


#pragma mark NSFetchController setup and delgate methods
//-(NSFetchedResultsController *) fetchedResultsController{

//-(NSFetchedResultsController *) setupFetchController{
- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil){
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"DateContact" inManagedObjectContext:self.managedObjectContext];
    fetchRequest.entity = entity;
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
    fetchRequest.sortDescriptors = [NSArray arrayWithObject:sort];
    fetchRequest.fetchBatchSize = 20;
    
    NSFetchedResultsController *theFetchedRuquestController = [[NSFetchedResultsController alloc]
                                                               initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:@"sectionTitle" cacheName:@"FetchCache2"  ];

    
    self.fetchedResultsController = theFetchedRuquestController;
    self.fetchedResultsController.delegate = self;
    
    NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    
    
    return _fetchedResultsController;

}
- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    // The fetch controller is about to start sending change notifications, so prepare the table view for updates.
    [self.tableView beginUpdates];
}


- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
    UITableView *tableView = self.tableView;
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:(DateContactsTableViewCell*)[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray
                                               arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray
                                               arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id )sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    // The fetch controller has sent all current change notifications, so tell the table view to process all updates.
    [self.tableView endUpdates];
}

@end
