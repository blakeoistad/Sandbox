//
//  Player.m
//  ObjCPlayground_1
//
//  Created by Blake Oistad on 1/10/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

#import "Player.h"

@implementation Player

-(void)jump {
    NSLog(@"JUMP!");
}

-(void)fire {
    NSLog(@"FIRE!");
}

-(void)restartLevel:(int)levelNumber {
    NSLog(@"Restarting level %i", levelNumber);
}

@end
