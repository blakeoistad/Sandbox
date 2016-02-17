//
//  AppDelegate.h
//  MPCTest1
//
//  Created by Blake Oistad on 1/24/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCManager.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) MCManager *mcManager;

@end

