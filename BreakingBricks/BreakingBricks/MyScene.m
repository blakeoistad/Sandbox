//
//  MyScene.m
//  BreakingBricks
//
//  Created by Simon Allardice on 2/15/14.
//  Copyright (c) 2014 Simon Allardice. All rights reserved.
//

#import "MyScene.h"
#import "EndScene.h"


@interface MyScene ()

@property (nonatomic) SKSpriteNode *paddle;

@end


//set initial category definitions for different sprite nodes, using standard for bitmask, type uint32_t (unassigned integer of 32 bit type)
static const uint32_t ballCategory   = 1; //00000000000000000000000000000001
static const uint32_t brickCategory  = 2; //00000000000000000000000000000010
static const uint32_t paddleCategory = 4; //00000000000000000000000000000100
static const uint32_t edgeCategory   = 8; //00000000000000000000000000001000
static const uint32_t bottomEdgeCategory = 16;

//static const uint32_t WHOOPSCategory = 15; //00000000000000000000000000001111    cant have multiple categories per one node
/* alternatively, using bitwise operators
 static const uint32_t ballCategory   = 0x1;        //00000000000000000000000000000001
 static const uint32_t brickCategory  = 0x1 << 1;   //00000000000000000000000000000010          this << operator tells us that were taking the first flipped bit and moving it over 1 place
 static const uint32_t paddleCategory = 0x1 << 2;   //00000000000000000000000000000100          this << operator tells us that were taking the first flipped bit and moving it over 2 places
 static const uint32_t edgeCategory   = 0x2 << 3;   //00000000000000000000000000001000          this << operator tells us that were taking the first flipped bit and moving it over 3 places
 */

@implementation MyScene

-(void)didBeginContact:(SKPhysicsContact *)contact {
    
//    if (contact.bodyA.categoryBitMask == brickCategory) {
//        NSLog(@"bodyA is a brick");
//        [contact.bodyA.node removeFromParent];                  //removes the current node, in this case the brick, from its parent object, in this case the scene itself
//    }
//    if (contact.bodyB.categoryBitMask == brickCategory) {
//        NSLog(@"bodyB is a brick");
//        [contact.bodyB.node removeFromParent];                  //removes the current node, in this case the brick, from its parent object, in this case the scene itself
//    }
    
    // create a placeholder reference for the "non ball" object
    SKPhysicsBody *notTheBall;
    
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask) {            //if the category of body a is less than the category of body b, we know then that whatever it is (nottheball) is the ball, because its value is 1
        notTheBall = contact.bodyB;
    } else {                                                                        //if the category of body a is more than the category of body b, we know that whatever it is is not the ball, higher than 1
        notTheBall = contact.bodyA;
    }
    
    if (notTheBall.categoryBitMask == brickCategory) {
        NSLog(@"It's a brick!");
        SKAction *playSFX = [SKAction playSoundFileNamed:@"brickhit.caf" waitForCompletion:NO];             //creates the action object but doesnt actually trigger the sound
        [self runAction:playSFX];
        [notTheBall.node removeFromParent];
    }
//    } else {                                                      //this assumes that whatever is not the ball is a paddle, which may not be true if we add more categories later
//        NSLog(@"Play boing sound");
//    }
    if (notTheBall.categoryBitMask == paddleCategory) {             //so instead, we explicitly say that if its the paddle, play the boing sound
        NSLog(@"Play boing sound");
        SKAction *playSFX = [SKAction playSoundFileNamed:@"blip.caf" waitForCompletion:NO];             //creates the action object but doesnt actually trigger the sound
        [self runAction:playSFX];                                                               //tells the scene to play the action, in this case playSFX
    }
    
    if (notTheBall.categoryBitMask == bottomEdgeCategory) {
//        NSLog(@"Game over");                                                                      //code lives in endscene.m
//        //create message
//        SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];
//        label.text = @"You lose";
//        label.fontColor = [SKColor blackColor];
//        label.fontSize = 50;
//        label.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));        //adds label to the center of the scene
//        [self addChild:label];
        
        EndScene *end = [EndScene sceneWithSize:self.size];                     //creates end scene, then presents new scene
        [self.view presentScene:end transition:[SKTransition doorsCloseHorizontalWithDuration:0.5]];
        
    }

}

-(void) addBottomEdge:(CGSize)size {
    SKNode *bottomEdge = [SKNode node];     //acts as invisible container, generic node
    bottomEdge.physicsBody = [SKPhysicsBody bodyWithEdgeFromPoint:CGPointMake(0, 1) toPoint:CGPointMake(size.width, 1)];        //single line from one point to another, one pixel above edge
    bottomEdge.physicsBody.categoryBitMask = bottomEdgeCategory;
    [self addChild:bottomEdge];
}

- (void)addBall:(CGSize)size {
    // create a new sprite node from an image
    SKSpriteNode *ball = [SKSpriteNode spriteNodeWithImageNamed:@"orb0000"];
    
    // create a CGPoint for positioning
    ball.position = CGPointMake(size.width/2, size.height/2);
    
    // creates the physics body for the ball sprite, based on its radius
    ball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:ball.frame.size.width/2];
    
    // friction only has an effect when the object makes contact with another object
    ball.physicsBody.friction = 0;
    
    // this is actually the resistance to movement of the object
    ball.physicsBody.linearDamping = 0;
    
    // restitution describes bounciness, loss of momentum when hitting other objects
    ball.physicsBody.restitution = 1;
    
    // add category to physics body
    ball.physicsBody.categoryBitMask = ballCategory;
    
    // begin adding contact relationships between categories
    ball.physicsBody.contactTestBitMask = brickCategory | paddleCategory | bottomEdgeCategory;             //notify me when ball touches a brick OR the paddle OR the bottom edge
    
    //configure collision bitmask
    //ball.physicsBody.collisionBitMask = edgeCategory | brickCategory;               //only collide with edge and only collide with brick
    
    //run through imported orb.atlas images to animate appearance
    //get reference to atlas
    SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"orb"];
    //get all image filenames
    NSArray *orbImageNames = [atlas textureNames];
    
    //sort the array of filenames
    NSArray *sortedNames = [orbImageNames sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    //create an array to hold the image objects
    NSMutableArray *orbTextures = [NSMutableArray array];
    
    for (NSString *filename in sortedNames) {
        SKTexture *texture = [atlas textureNamed:filename];
        [orbTextures addObject:texture];
    }
    
    SKAction *glow = [SKAction animateWithTextures:orbTextures timePerFrame:0.1];
    SKAction *keepGlowing = [SKAction repeatActionForever:glow];
    
    [ball runAction:keepGlowing];
    
    // add the sprite node to the scene
    [self addChild:ball];
    
    // create vector
    CGVector myVector = CGVectorMake(5, 5);
    
    // apply the vector to the ball
    [ball.physicsBody applyImpulse:myVector];
    
    
    

}

-(void)addBricks:(CGSize) size {
    for (int i = 0; i < 4; i++) {
        SKSpriteNode *brick = [SKSpriteNode spriteNodeWithImageNamed:@"brick"];
        
        // add a static physics body
        brick.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:brick.frame.size];
        brick.physicsBody.dynamic = NO;
        brick.physicsBody.categoryBitMask = brickCategory;
        
        // set position of bricks
        // divide width of screen by 5, multiplying amount by 1 to get first centered position...
        int xPos = size.width/5 * (i+1);
        // height of screen minus 50
        int yPos = size.height - 50;
        
        brick.position = CGPointMake(xPos, yPos);
        
        [self addChild:brick];
    }
}



-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        NSLog(@"Moving Paddle");
        CGPoint location = [touch locationInNode:self];
        CGPoint newPosition = CGPointMake(location.x, 100);
        
        // stop the paddle from going too far off screen
        // may not want this hardcoded value due to possible new screen sizes or new player objects
        
//        if (newPosition.x < 50) {
//            newPosition.x = 50;
//        }
//        if (newPosition.x > 270) {
//            newPosition.x = 270;
//        }
        
        // set it to half the width of the paddle
        if (newPosition.x < self.paddle.size.width/2) {
            newPosition.x = self.paddle.size.width/2;
        }
        // set it to width of the screen minus half the width of the paddle
        if (newPosition.x > self.size.width - (self.paddle.size.width/2)) {
            newPosition.x = self.size.width - (self.paddle.size.width/2);
        }


        self.paddle.position = newPosition;
    }
}

-(void) addPlayer:(CGSize)size {
    
    // create paddle sprite
    self.paddle = [SKSpriteNode spriteNodeWithImageNamed:@"paddle"];
    // position it
    self.paddle.position = CGPointMake(size.width/2, 100);
    // add physics body
    self.paddle.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.paddle.frame.size];
    self.paddle.physicsBody.categoryBitMask = paddleCategory;
    // make it static
    self.paddle.physicsBody.dynamic = NO;
    
    // add to scene
    [self addChild:self.paddle];

    
    
    
}

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        
        /* Setup your scene here */
        self.backgroundColor = [SKColor whiteColor];
        
        // add a physics body to scene itself so ball doesn't fall out of scene
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        self.physicsBody.categoryBitMask = edgeCategory;
        
        // change gravity settings of physics world
        self.physicsWorld.gravity = CGVectorMake(0, 0);
        
        // check in this class for the contact delegate, specifially didbegincontact and or didendcontact
        self.physicsWorld.contactDelegate = self;
        
        
        [self addBall:size];
        [self addPlayer:size];
        [self addBricks:size];
        [self addBottomEdge:size];
   
    }
    return self;
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
