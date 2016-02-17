//
//  ConnectivityViewController.h
//  MPCTest1
//
//  Created by Blake Oistad on 1/24/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface ConnectivityViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, MCBrowserViewControllerDelegate, UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *displayNameTextField;
@property (nonatomic, weak) IBOutlet UISwitch *visibilitySwitch;
@property (nonatomic, weak) IBOutlet UITableView *connectionsTableView;
@property (nonatomic, weak) IBOutlet UIButton *disconnectButton;

@end
