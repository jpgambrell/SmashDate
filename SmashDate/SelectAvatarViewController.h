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

@property (nonatomic, retain) NSString *contactTwitter;
@property(nonatomic,assign)id delegate;
@property (nonatomic, weak) UIImage *avImage;
@end
