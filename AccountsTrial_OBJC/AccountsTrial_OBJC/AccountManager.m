//
//  AccountManager.m
//  AccountsTrial_OBJC
//
//  Created by Blake Oistad on 1/6/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

#import "AccountManager.h"

static double kStartingBalance = 5000;
static double kStartingTransactions = 0;

static NSString *kCurrentBalanceKeyPath = @"currentBalance";
static NSString *kNumberofTransactionsKeyPath = @"numberOfTransactions";

@implementation AccountManager

@synthesize currentBalance;
@synthesize numberOfTransactions;

- (id)init {
    if (self == [super init]) {
        //Set inital balance
        currentBalance = [NSNumber numberWithDouble:kStartingBalance];
        numberOfTransactions = [NSNumber numberWithDouble:kStartingTransactions];
    }
    return self;
}

//Update current balance with submitted amount
- (void)postTransaction:(double)submittedAmount {
    double currentAmount = [currentBalance doubleValue];
    currentAmount += submittedAmount;
    
    //currentBalance = [NSNumber numberWithDouble:currentAmount];
    [self setValue:[NSNumber numberWithDouble:currentAmount] forKey:kCurrentBalanceKeyPath];
    NSLog(@"currentBalance: %@", currentBalance);
}

- (void)incrementTransactionCount {
    double transactionCount = [numberOfTransactions doubleValue];
    transactionCount++;
    //numberOfTransactions = [NSNumber numberWithDouble:transactionCount];
    [self setValue:[NSNumber numberWithDouble:transactionCount] forKey:kNumberofTransactionsKeyPath];
}

@end
