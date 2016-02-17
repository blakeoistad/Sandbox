//
//  MyScene.m
//  AnimationExamples
//
//  Created by Simon Allardice on 2/20/14.
//  Copyright (c) 2014 Simon Allardice. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.29 green:0.75 blue:.99 alpha:1];
        
        //create platform (just a colored sprite)
        SKSpriteNode *platform = [SKSpriteNode spriteNodeWithColor:[SKColor brownColor] size:CGSizeMake(100, 20)];
        platform.position = CGPointMake(50, 100);
        [self addChild:platform];
        
        //create the first action
        //SKAction *move = [SKAction moveToX:size.width -(platform.size.width/2) duration:2];       //this works but moveToX is NOT reversable
        
        //create the first action, this time reversible
        SKAction *move = [SKAction moveByX:(size.width-platform.size.width) y:0 duration:2];
        
        //SKAction *moveBack = [SKAction moveToX:(platform.size.width/2) duration:2];       manual action to move back
        SKAction *moveBack = [move reversedAction];             //will compile, but doesnt work on all original actions!
        
        //just wait
        SKAction *wait = [SKAction waitForDuration:1.5];
        
        //create third action that will run through a sequence of actions
        SKAction *backAndForth = [SKAction sequence:@[move,wait,moveBack,wait]];
        
        //set the repeater
        SKAction *repeater = [SKAction repeatActionForever:backAndForth];
        
        //run it
        [platform runAction:repeater];
    }
    return self;
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
