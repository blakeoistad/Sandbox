//
//  FirstViewController.m
//  MPCTest1
//
//  Created by Blake Oistad on 1/24/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (nonatomic, strong) AppDelegate *appDelegate;

- (void)sendMyMessage;
- (void)didReceiveDataWithNotification:(NSNotification *)notification;

@end

@implementation FirstViewController

#pragma mark - Messaging Methods

- (void)sendMyMessage {
    NSData *dataToSend = [_messageInputTextField.text dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *allPeers = _appDelegate.mcManager.session.connectedPeers;
    NSError *error;
    
    [_appDelegate.mcManager.session sendData:dataToSend toPeers:allPeers withMode:MCSessionSendDataReliable error:&error];
    
    if (error) {
        NSLog(@"Error: %@", [error localizedDescription]);
    }
    
    [_chatTextView setText:[_chatTextView.text stringByAppendingString:[NSString stringWithFormat:@"I wrote:\n%@\n\n", _messageInputTextField.text]]];
    [_messageInputTextField setText:@""];
    [_messageInputTextField resignFirstResponder];
}

- (void)didReceiveDataWithNotification:(NSNotification *)notification {
    MCPeerID *peerID = [[notification userInfo] objectForKey:@"peerID"];
    NSString *peerDisplayName = peerID.displayName;
    
    NSData *receivedData = [[notification userInfo] objectForKey:@"data"];
    NSString *receivedText = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
    
    [_chatTextView performSelectorOnMainThread:@selector(setText:) withObject:[_chatTextView.text stringByAppendingString:[NSString stringWithFormat:@"%@ wrote:\n%@\n\n", peerDisplayName, receivedText]] waitUntilDone:NO];
    
}


#pragma mark - Interactivity Methods

- (void)sendMessage:(id)sender {
    NSLog(@"Send Button Pressed");
    [self sendMyMessage];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self sendMyMessage];
    return true;
}

- (void)cancelMessage:(id)sender {
    NSLog(@"Cancel Button Pressed");
    [_messageInputTextField resignFirstResponder];
}

#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    _messageInputTextField.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveDataWithNotification:) name:@"MCDidReceiveDataNotification" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
