//
//  EventDetailViewController.m
//  SmashDate
//
//  Created by Gambrell, John on 6/10/14.
//  Copyright (c) 2014 Gambrell, John. All rights reserved.
//

#import "EventDetailViewController.h"
#import "DateContactPickerTableViewController.h"

@interface EventDetailViewController ()

@end

@implementation EventDetailViewController

- (id)initWithCoder:(NSCoder*)aDecoder
{
    if(self = [super initWithCoder:aDecoder])
    {
        if (self) {
            
        }
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) pickContactsForEvent{
    
    NSLog(@"clicked to add contacts");
    //RootForm *rForm = self.formController.form;
  //  NSLog(@"activity name %@- date name %@",rForm.eventDetail.eventActivity.name, rForm.dateContact.name);
 //   [[self navigationController] performSegueWithIdentifier:@"contactpicker" sender:self];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    DateContactPickerTableViewController *contactPicker = (DateContactPickerTableViewController *)[storyboard instantiateViewControllerWithIdentifier:@"contactpicker"];
    [self.navigationController pushViewController:contactPicker animated:YES];
    
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

@end
