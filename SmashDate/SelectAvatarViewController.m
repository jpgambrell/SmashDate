//
//  SelectAvatarViewController.m
//  SmashDate
//
//  Created by Gambrell, John on 6/25/14.
//  Copyright (c) 2014 Gambrell, John. All rights reserved.
//

#import <Social/Social.h>
#import "SelectAvatarViewController.h"
#import "JGAppDelegate.h"

@interface SelectAvatarViewController ()
- (IBAction)selectPhotoFromTwitterClick:(id)sender;

@end

@implementation SelectAvatarViewController
- (IBAction)PhotoLibaryClick:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) getTwitterUserProfile{
    
    NSURL *feedURL = [NSURL URLWithString:@"https://api.twitter.com/1.1/statuses/user_timeline.json"];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"jpgdallas", @"screen_name",@"1", @"count",@"true", @"include_rts", nil];
    SLRequest *twitterFeed =
    [SLRequest requestForServiceType:SLServiceTypeTwitter
                       requestMethod:SLRequestMethodGET
                                 URL:feedURL
                          parameters:parameters];
    
    //3. Get and pass in the account
    JGAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    twitterFeed.account = appDelegate.userAccount;
    //4. Set activity indicator
    UIApplication *sharedApplication = [UIApplication sharedApplication];
    sharedApplication.networkActivityIndicatorVisible = YES;
    //5. Get the actual feed and json serialize it
    [twitterFeed performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
        if (!error) {
            NSError *jsonError = nil;
            NSJSONSerialization *feedData = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&jsonError];
            
            
            if (!jsonError) {
                NSArray *tweetArr = (NSArray*)feedData;
                NSDictionary *tweetDict = [tweetArr objectAtIndex:0];
             //   [tweetDict valueForKeyPath:@"user.profile_image_url"];
                NSString *imgURL = (NSString*)[tweetDict valueForKeyPath:@"user.profile_image_url"];
                NSLog(@"Twitter return: %@", imgURL);
                // Send a synchronous request
                NSURLRequest * urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:imgURL]];
                NSURLResponse * response = nil;
                NSError * error = nil;
                NSData * data = [NSURLConnection sendSynchronousRequest:urlRequest
                                                      returningResponse:&response
                                                                  error:&error];
                
                if (error == nil)
                {
                    // Parse data here
                    self.avatarImageView.image = [UIImage imageWithData:data];
                }
                else{
                    NSLog(@"error loading twitter image");
                }
                
                
            } else {
                // Show an Alert View
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:[jsonError localizedDescription] delegate:nil
                                                          cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alertView show];
            }
        } else {
            // Show an Alert View
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil
                                                      cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
        }
        sharedApplication.networkActivityIndicatorVisible = NO; }];
    
    
    
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

/*
#pragma mark - Navigation


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Image Picker Delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.avatarImageView.image = chosenImage;
    
  //  self.existingContact.avatar = [NSData dataWithData:UIImagePNGRepresentation(self.avatarImageView.image)];
    [self.delegate avatarPhotoSelected:[NSData dataWithData:UIImagePNGRepresentation(chosenImage)]];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (IBAction)selectPhotoFromTwitterClick:(id)sender {
    JGAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    if (appDelegate.userAccount)
    {
        
        [self getTwitterUserProfile];
    }
    else {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Twitter Account Error" message:@"Please add your Twitter credentials in the iOS Settings App."                                                     delegate:nil     cancelButtonTitle:@"OK"  otherButtonTitles:nil];
        [message show];
    }

    
}
@end
