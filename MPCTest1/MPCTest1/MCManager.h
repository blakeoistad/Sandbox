//
//  MCManager.h
//  MPCTest1
//
//  Created by Blake Oistad on 1/25/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface MCManager : NSObject <MCSessionDelegate>

@property (nonatomic, strong) MCPeerID *peerID;
@property (nonatomic, strong) MCSession *session;
@property (nonatomic, strong) MCBrowserViewController *browserVC;
@property (nonatomic, strong) MCAdvertiserAssistant *advertiserAssistant;


- (void)setupPeerAndSessionWithDisplayName:(NSString *)displayName;
- (void)setupMCBrowserVC;
- (void)advertiseSelf:(BOOL)shouldAdvertise;

@end
