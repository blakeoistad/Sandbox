//
//  NetworkManager.m
//  JustWeather
//
//  Created by Blake Oistad on 12/29/15.
//  Copyright © 2015 Blake Oistad. All rights reserved.
//

#import "NetworkManager.h"
#import "Reachability.h"

@implementation NetworkManager


#pragma mark - Properties

Reachability *hostReach;
Reachability *internetReach;
Reachability *wifiReach;



#pragma mark - Declaration

+ (NetworkManager *)sharedInstance {
    static NetworkManager* _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[NetworkManager alloc] init];
    });
    return _sharedInstance;
}

#pragma mark - Reachability Methods

- (void)updateReachabilityStatus: (Reachability *)currReach {
    NSParameterAssert([currReach isKindOfClass:[Reachability class]]);
    NetworkStatus netStatus = [currReach currentReachabilityStatus];
    if (currReach == hostReach) {
        switch (netStatus) {
            case NotReachable:
                NSLog(@"Server Not Reachable");
                _serverAvailable = false;
                break;
            case ReachableViaWiFi:
                NSLog(@"Server Reachable via WiFi");
                _serverAvailable = true;
                break;
            case ReachableViaWWAN:
                NSLog(@"Server Reachable via WWAN");
                _serverAvailable = true;
                
            default:
                break;
        }
    }
    if (currReach == internetReach) {
        switch (netStatus) {
            case NotReachable:
                NSLog(@"Internet Not Reachable");
                _serverAvailable = false;
                break;
            case ReachableViaWiFi:
                NSLog(@"Internet Reachable via WiFi");
                _serverAvailable = true;
                break;
            case ReachableViaWWAN:
                NSLog(@"Internet Reachable via WWAN");
                _serverAvailable = true;
            default:
                break;
        }
    }
}

- (void)reachabilityChanged:(NSNotification *)note {
    Reachability *currReach = [note object];
    [self updateReachabilityStatus:currReach];
}

#pragma mark - Initialization

- (id)init {
    self = [super init];
    if (self) {
        _hostName = @"itunes.apple.com";
        NSLog(@"Host Name: %@", _hostName);
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
        
        hostReach = [Reachability reachabilityWithHostName:_hostName];
        [hostReach startNotifier];
        [self updateReachabilityStatus:hostReach];
        
        internetReach = [Reachability reachabilityForInternetConnection];
        [internetReach startNotifier];
        [self updateReachabilityStatus:internetReach];
        
    }
    return self;
}


@end