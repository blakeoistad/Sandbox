//
//  Player.h
//  ObjCPlayground_1
//
//  Created by Blake Oistad on 1/10/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property int score;

@property (nonatomic) NSString *playerName;

-(void) jump;
-(void) fire;
-(void) restartLevel: (int) levelNumber;

@end
