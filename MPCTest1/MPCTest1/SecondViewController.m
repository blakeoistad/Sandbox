//
//  SecondViewController.m
//  MPCTest1
//
//  Created by Blake Oistad on 1/24/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (nonatomic, strong) AppDelegate *appDelegate;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
