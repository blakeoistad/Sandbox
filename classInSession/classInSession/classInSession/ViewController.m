//
//  ViewController.m
//  classInSession
//
//  Created by Blake Oistad on 4/19/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person *me = [[Person alloc] init];
    NSString *personName = me->personName;
    NSLog(@"Person: %@", personName);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
