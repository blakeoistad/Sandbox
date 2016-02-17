//
//  EndScene.m
//  BreakingBricks
//
//  Created by Blake Oistad on 10/11/15.
//  Copyright © 2015 Simon Allardice. All rights reserved.
//

#import "EndScene.h"
#import "MyScene.h"

@implementation EndScene

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        self.backgroundColor = [SKColor blackColor];
        
        SKAction *play = [SKAction playSoundFileNamed:@"gameover.caf" waitForCompletion:NO];
        [self runAction:play];
        
        NSLog(@"Game over");
        //create message
        SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];
        label.text = @"Game Over";
        label.fontColor = [SKColor whiteColor];
        label.fontSize = 44;
        label.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));        //adds label to the center of the scene
        [self addChild:label];
        
        //second message
        SKLabelNode *tryAgain = [SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];
        tryAgain.text = @"tap to play again";
        tryAgain.fontColor = [SKColor whiteColor];
        tryAgain.fontSize = 24;
        tryAgain.position = CGPointMake(size.width/2, -50);
        
        SKAction *moveLabel = [SKAction moveToY:(size.height/2 - 40) duration:0.5];
        [tryAgain runAction:moveLabel];
        
        [self addChild:tryAgain];
    }
    return self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    MyScene *firstScene = [MyScene sceneWithSize:self.size];
    [self.view presentScene:firstScene transition:[SKTransition doorsOpenHorizontalWithDuration:1.5]];
}


@end
