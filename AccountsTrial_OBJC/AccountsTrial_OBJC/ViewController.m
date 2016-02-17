//
//  ViewController.m
//  AccountsTrial_OBJC
//
//  Created by Blake Oistad on 1/6/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

#import "ViewController.h"
#import "AccountManager.h"

#define kCurrentBalancePrefix @"Current Balance: "

static NSString *kCurrentBalanceKeyPath = @"currentBalance";
static NSString *kNumberOfTransactionsKeyPath = @"numberOfTransactions";

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak)     IBOutlet UITextField    *amountInputTextField;
@property (nonatomic, weak)     IBOutlet UIButton       *submitButton;
@property (nonatomic, weak)     IBOutlet UILabel        *currentBalanceLabel;
@property (nonatomic, weak)     IBOutlet UILabel        *successLabel;
@property (nonatomic, weak)     IBOutlet UILabel        *dateLabel;
@property (nonatomic, weak)     IBOutlet UIImageView    *logoImageView;
@property (nonatomic, weak)     IBOutlet UITableView    *historyTableView;
@property (nonatomic, strong)            AccountManager *account;
@property (nonatomic, strong)            NSMutableArray *transactionHistory;

@end

@implementation ViewController
@synthesize account, transactionHistory;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
