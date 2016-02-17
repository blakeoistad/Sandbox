//
//  MyScene.h
//  BreakingBricks
//

//  Copyright (c) 2014 Simon Allardice. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface MyScene : SKScene <SKPhysicsContactDelegate>     //import the skphysicscontactdelegate to add this functionality of what happens during contact events, specifically the didbegincontact and                                                    didendcontact methods

@end
