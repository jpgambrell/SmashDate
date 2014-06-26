//
//  SelectAvatarViewController.h
//  SmashDate
//
//  Created by Gambrell, John on 6/25/14.
//  Copyright (c) 2014 Gambrell, John. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateContact.h"
@protocol SelectAvatarPhotoDelegate
-(void) avatarPhotoSelected:(NSData*)imageData;
@end
    

@interface SelectAvatarViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property(nonatomic,assign)id delegate;
@end
