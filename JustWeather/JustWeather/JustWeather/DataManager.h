//
//  DataManager.h
//  JustWeather
//
//  Created by Blake Oistad on 12/29/15.
//  Copyright © 2015 Blake Oistad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

@property (nonatomic, strong)       NSString *baseURLString;

+ (DataManager *)sharedInstance;

- (id)init;

@end
