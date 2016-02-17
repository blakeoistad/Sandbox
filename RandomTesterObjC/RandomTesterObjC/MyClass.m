//
//  MyClass.m
//  RandomTesterObjC
//
//  Created by Blake Oistad on 1/5/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass

+ (id)getStartTime {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterNoStyle];
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    NSString *startTime = [formatter stringFromDate:[NSDate date]];
    return startTime;
}

@end
