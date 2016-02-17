//
//  FirstViewController.h
//  MPCTest1
//
//  Created by Blake Oistad on 1/24/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface FirstViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *messageInputTextField;
@property (nonatomic, weak) IBOutlet UITextView *chatTextView;

- (IBAction)sendMessage:(id)sender;
- (IBAction)cancelMessage:(id)sender;

@end

