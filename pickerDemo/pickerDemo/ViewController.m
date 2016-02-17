//
//  ViewController.m
//  pickerDemo
//
//  Created by Blake Oistad on 2/14/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property NSArray *moodsArray;

@end

@implementation ViewController


#pragma mark - Picker View Methods

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.moodsArray count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.moodsArray[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    UIColor *moodColor;
    
    switch (row) {
        case 0: case 2: case 3: case 6:
            moodColor = [UIColor colorWithRed:1.0 green:0.85 blue:0.0 alpha:1.0];
            break;
        case 1: case 4: case 5:
            moodColor = [UIColor colorWithRed:94.0/255.0 green:138.00/255.0 blue:168.0/255.0 alpha:1.0];
            break;
        default:
            break;
    }
    
    [[self view] setBackgroundColor:moodColor];
}

#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    self.moodsArray = @[@"Happy", @"Sad", @"Ecstatic", @"Optimistic", @"Cynical", @"Indifferent", @"Relaxed"];
    NSLog(@"Moods array contains %lu choices", _moodsArray.count);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
