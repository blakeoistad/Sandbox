//
//  GameScene.m
//  DragDrop
//
//  Created by Blake Oistad on 10/18/15.
//  Copyright (c) 2015 Blake Oistad. All rights reserved.
//

#import "GameScene.h"

//will use this string later to identify your movable nodes
static  NSString *const kAnimalNodeName = @"movable";

@interface GameScene ()

@property (nonatomic, strong) SKSpriteNode *background;
@property (nonatomic, strong) SKSpriteNode *selectedNode;

@end




@implementation GameScene



-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        // 1) Loading the background
        _background = [SKSpriteNode spriteNodeWithImageNamed:@"blue-shooting-stars"];
        [_background setName:@"background"];
        //sets the anchor point of the background to 0,0, or the lower left corner of the background sprite
        [_background setAnchorPoint:CGPointZero];
        [self addChild:_background];
        
        // 2) Loading the images
        NSArray *imageNames = @[@"bird", @"cat", @"dog", @"turtle"];
        for (int i = 0; i < [imageNames count]; i++) {
            NSString *imageName = [imageNames objectAtIndex:i];
            SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:imageName];
            [sprite setName:kAnimalNodeName];
            
            float offsetFraction = ((float)(i +1)) / ([imageNames count] +1);
            [sprite setPosition:CGPointMake(size.width * offsetFraction, size.height / 2)];
            [_background addChild:sprite];
        }
    }
    return self;
}


- (void)selectNodeForTouch:(CGPoint)touchLocation {
    
    //asks scene for the node that is on the position touchLocation
    SKSpriteNode *touchedNode = (SKSpriteNode *)[self nodeAtPoint:touchLocation];
    
    if (![_selectedNode isEqual:touchedNode]) {
        [_selectedNode removeAllActions];
        [_selectedNode runAction:[SKAction rotateToAngle:0.0f duration:0.1]];
        
        _selectedNode = touchedNode;
        
        //creates a sequence of wiggle animation on the touched node
        if ([[touchedNode name] isEqualToString:kAnimalNodeName]) {
            SKAction *sequence = [SKAction sequence:@[[SKAction rotateByAngle:degToRad(-4.0f) duration:0.1], [SKAction rotateByAngle:0.0 duration:0.1], [SKAction rotateByAngle:degToRad(4.0f) duration:0.1]]];
            [_selectedNode runAction:[SKAction repeatActionForever:sequence]];
        }
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

float degToRad(float degree) {
    return degree / 180.0f * M_PI;
}

@end
