//
//  AccountManager.h
//  AccountsTrial_OBJC
//
//  Created by Blake Oistad on 1/6/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccountManager : NSObject

@property (nonatomic, strong) NSNumber *currentBalance;
@property (nonatomic, strong) NSNumber *numberOfTransactions;

- (void)postTransaction:(double)submittedAmount;

@end
