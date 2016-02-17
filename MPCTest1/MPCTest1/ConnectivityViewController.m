//
//  ConnectivityViewController.m
//  MPCTest1
//
//  Created by Blake Oistad on 1/24/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

#import "ConnectivityViewController.h"
#import "AppDelegate.h"

@interface ConnectivityViewController ()

@property (nonatomic, strong) AppDelegate *appDelegate;
@property (nonatomic, strong) NSMutableArray *connectedDevicesArray;

- (void)peerDidChangeStateWithNotification:(NSNotification *)notification;

@end

@implementation ConnectivityViewController

#pragma mark - Table View Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_connectedDevicesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
//    }
    
    cell.textLabel.text = [_connectedDevicesArray objectAtIndex:indexPath.row];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterNoStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    NSDate *currentDate = [NSDate date];
    NSString *currentDateString = [formatter stringFromDate:currentDate];
    NSLog(@"%@", currentDateString);
    cell.detailTextLabel.text = (@"Connected at %@", currentDateString);
    return cell;
}


#pragma mark - Connectivity Methods

- (void)peerDidChangeStateWithNotification:(NSNotification *)notification {
    MCPeerID *peerID = [[notification userInfo] objectForKey:@"peerID"];
    NSString *peerDisplayName = peerID.displayName;
    MCSessionState state = [[[notification userInfo] objectForKey:@"state"] intValue];
    
    if (state != MCSessionStateConnecting) {
        if (state == MCSessionStateConnected) {
            [_connectedDevicesArray addObject:peerDisplayName];
        } else if (state == MCSessionStateNotConnected) {
            if ([_connectedDevicesArray count] > 0) {
                int indexOfPeer = [_connectedDevicesArray indexOfObject:peerDisplayName];
                [_connectedDevicesArray removeObjectAtIndex:indexOfPeer];
            }
            
            [_connectionsTableView reloadData];
            
            BOOL peersExist = ([[_appDelegate.mcManager.session connectedPeers] count] == 0);
            [_disconnectButton setEnabled:!peersExist];
            [_displayNameTextField setEnabled:peersExist];
        }
    }
}




#pragma mark - Interactivity Methods

- (IBAction)browseForDevices:(id)sender {
    NSLog(@"Browsing for Devices");
    [[_appDelegate mcManager] setupMCBrowserVC];
    [[[_appDelegate mcManager] browserVC] setDelegate:self];
    [self presentViewController:[[_appDelegate mcManager] browserVC] animated:true completion:nil];
}

- (void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController {
    [_appDelegate.mcManager.browserVC dismissViewControllerAnimated:true completion:nil];
}

- (void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController {
    [_appDelegate.mcManager.browserVC dismissViewControllerAnimated:true completion:nil];

}

- (IBAction)toggleVisibility:(id)sender {
    NSLog(@"Visibility Toggled");
    [_appDelegate.mcManager advertiseSelf:_visibilitySwitch.isOn];
}

- (IBAction)disconnectDevice:(id)sender {
    NSLog(@"Disconnected Device");
    [_appDelegate.mcManager.session disconnect];
    
    _displayNameTextField.enabled = YES;
    
    [_connectedDevicesArray removeAllObjects];
    [_connectionsTableView reloadData];
}




#pragma mark - Text Field Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_displayNameTextField resignFirstResponder];
    
    _appDelegate.mcManager.peerID = nil;
    _appDelegate.mcManager.session = nil;
    _appDelegate.mcManager.browserVC = nil;
    
    if ([_visibilitySwitch isOn]) {
        [_appDelegate.mcManager.advertiserAssistant stop];
    }
    _appDelegate.mcManager.advertiserAssistant = nil;
    
    [_appDelegate.mcManager setupPeerAndSessionWithDisplayName:_displayNameTextField.text];
    [_appDelegate.mcManager setupMCBrowserVC];
    [_appDelegate.mcManager advertiseSelf:_visibilitySwitch.isOn];
    
    return true;
}




#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [[_appDelegate mcManager] setupPeerAndSessionWithDisplayName:[UIDevice currentDevice].name];
    [[_appDelegate mcManager] advertiseSelf:_visibilitySwitch.isOn];
    [_displayNameTextField setDelegate:self];
    _connectedDevicesArray = [[NSMutableArray alloc] init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(peerDidChangeStateWithNotification:) name:@"MCDidChangeStateNotification" object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_connectionsTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
