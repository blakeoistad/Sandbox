//
//  BlipBlop.m
//  RandomTester
//
//  Created by Blake Oistad on 1/4/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

#import "BlipBlop.h"

@implementation BlipBlop

+ (NSString *)getStartTime {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterNoStyle];
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    startedTime = [formatter stringFromDate:[NSDate date]];
    NSLog(@"Started Time: %@", startedTime);
    return startedTime;
}

@end
