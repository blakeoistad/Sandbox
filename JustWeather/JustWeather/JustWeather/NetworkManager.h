//
//  NetworkManager.h
//  JustWeather
//
//  Created by Blake Oistad on 12/29/15.
//  Copyright © 2015 Blake Oistad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

@interface NetworkManager : NSObject

@property (nonatomic, strong)       NSString *hostName;
@property (nonatomic)               BOOL     *internetAvailable;
@property (nonatomic)               BOOL     *serverAvailable;

+ (NetworkManager *)sharedInstance;

- (void)updateReachabilityStatus: (Reachability *)currReach;
- (void)reachabilityChanged:(NSNotification *)note;

- (id)init;

@end
