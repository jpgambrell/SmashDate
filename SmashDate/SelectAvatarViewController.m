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
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
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
    
    NSURL *feedURL = [NSURL URLWithString:@"https://api.twitter.com/1.1/users/show.json"];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:self.contactTwitter, @"screen_name", nil];
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
                             NSDictionary *tweetDict = (NSDictionary*)feedData;
            
                NSString *imgURL = (NSString*)[tweetDict valueForKeyPath:@"profile_image_url"];
                imgURL = [imgURL stringByReplacingOccurrencesOfString:@"_normal" withString:@""];
                NSLog(@"Twitter return: %@", imgURL);
//
                NSURLRequest * urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:imgURL]];
             
               [NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                    if (connectionError == nil)
                    {
                        // Parse data here
                        self.avatarImageView.image = [UIImage imageWithData:data];
                        [self.delegate avatarPhotoSelected:[NSData dataWithData:UIImagePNGRepresentation(self.avatarImageView.image)]];
                    }
                    else{
                        NSLog(@"error loading twitter image");
                        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Unable to get Image from Twitter" delegate:nil
                                                                  cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        [alertView show];
                    }
                }];
             
                
                
                
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
-(void) viewWillAppear:(BOOL)animated   {
    self.avatarImageView.image = self.avImage;
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
