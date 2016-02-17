//
//  main.m
//  ObjCPlayground_1
//
//  Created by Blake Oistad on 1/10/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        Player *sean = [[Player alloc] init];
        [sean jump];
        [sean fire];
        [sean restartLevel:21];
        
        [sean setScore:3000];
        [sean setPlayerName:@"Sean the ultimate foo foo riff raff ass fool"];
        NSLog(@"Current player is %@ with a score of %i", [sean playerName], [sean score]);
    }
    
    return 0;
}
