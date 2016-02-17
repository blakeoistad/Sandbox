//
//  MCManager.m
//  MPCTest1
//
//  Created by Blake Oistad on 1/25/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

#import "MCManager.h"

@implementation MCManager



#pragma mark - Public Methods

-(void)setupPeerAndSessionWithDisplayName:(NSString *)displayName {
    _peerID = [[MCPeerID alloc] initWithDisplayName:displayName];
    
    _session = [[MCSession alloc] initWithPeer:_peerID];
    _session.delegate = self;
}

- (void)setupMCBrowserVC {
    _browserVC = [[MCBrowserViewController alloc] initWithServiceType:@"chat-files" session:_session];
}

- (void)advertiseSelf:(BOOL)shouldAdvertise {
    if (shouldAdvertise) {
        _advertiserAssistant = [[MCAdvertiserAssistant alloc] initWithServiceType:@"chat-files" discoveryInfo:nil session:_session];
        
        [_advertiserAssistant start];
    }
    else {
        [_advertiserAssistant stop];
        _advertiserAssistant = nil;
    }
}



#pragma mark - Multipeer Connectivity Methods

- (void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state {
    NSDictionary *dict = @{@"peerID": peerID, @"state": [NSNumber numberWithInt:state]};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"MCDidChangeStateNotification" object:nil userInfo:dict];
}

- (void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID {
    NSDictionary *dict = @{@"data": data, @"peerID": peerID};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"MCDidReceiveDataNotification" object:nil userInfo:dict];
}

- (void)session:(MCSession *)session didStartReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress {
    
}

- (void)session:(MCSession *)session didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error {
    
}

- (void)session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID {
    
}




#pragma mark - Class Initialization

- (id)init {
    self = [super init];
    
    if (self) {
        _peerID = nil;
        _session = nil;
        _browserVC = nil;
        _advertiserAssistant = nil;
    }
    return self;
}

@end
