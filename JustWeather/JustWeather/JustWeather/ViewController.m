//
//  ViewController.m
//  JustWeather
//
//  Created by Blake Oistad on 12/29/15.
//  Copyright © 2015 Blake Oistad. All rights reserved.
//

#import "ViewController.h"
#import "NetworkManager.h"
#import "DataManager.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Interactivity Methods

- (IBAction)searchButtonPressed:(id)sender {
    NSLog(@"Search Button Pressed");
}

#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    NetworkManager *networkManager = [NetworkManager sharedInstance];
    DataManager *dataManager = [DataManager sharedInstance];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
