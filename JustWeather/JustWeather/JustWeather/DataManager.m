//
//  DataManager.m
//  JustWeather
//
//  Created by Blake Oistad on 12/29/15.
//  Copyright © 2015 Blake Oistad. All rights reserved.
//

#import "DataManager.h"
#import "NetworkManager.h"

@implementation DataManager


#pragma mark - Declaration

+ (DataManager *)sharedInstance {
    static DataManager* _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[DataManager alloc] init];
    });
    return _sharedInstance;
}

#pragma mark - Data Methods

- (void)parseWeatherData:(NSData *)data {
    NetworkManager *networkManager = [[NetworkManager alloc] init];
    if (networkManager.serverAvailable) {
        NSLog(@"From DM: Server Available");
    }
}



#pragma mark - Initialization 

- (id)init {
    self = [super init];
    if (self) {
        NSLog(@"Data Manager, breh");
    }
    return self;
}

@end
