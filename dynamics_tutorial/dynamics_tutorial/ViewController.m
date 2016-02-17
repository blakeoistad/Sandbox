//
//  ViewController.m
//  dynamics_tutorial
//
//  Created by Blake Oistad on 10/18/15.
//  Copyright © 2015 Blake Oistad. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController



//add variables to initiate dynamics behavior, gravity, and collision boundary
UIDynamicAnimator *_animator;
UIGravityBehavior *_gravity;
UICollisionBehavior *_collision;
bool *_firstContact;

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p {
    //logs the collision contact information as it happens
    NSLog(@"Boundary contact occured - %@", identifier);
    
    //changes the background color of the colliding item to yellow then fades back to gray
    UIView *view = (UIView *)item;
    view.backgroundColor = [UIColor yellowColor];
    [UIView animateWithDuration:0.3 animations:^{
        view.backgroundColor = [UIColor grayColor];
    }];
    
    if (!_firstContact) {
        _firstContact = YES;
        
        UIView *square = [[UIView alloc] initWithFrame:CGRectMake(30, 0, 100, 100)];
        square.backgroundColor = [UIColor grayColor];
        [self.view addSubview:square];
        
        [_collision addItem:square];
        [_gravity addItem:square];
        
        UIAttachmentBehavior *attach = [[UIAttachmentBehavior alloc] initWithItem:view attachedToItem:square];
        
        [_animator addBehavior:attach];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //draw the object, in this case a square, and add it to the view
    UIView *square = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    square.backgroundColor = [UIColor grayColor];
    [self.view addSubview:square];
    
    //adds a red barrier that has its own collision behavior
    UIView *barrier = [[UIView alloc] initWithFrame:CGRectMake(0, 300, 130, 20)];
    barrier.backgroundColor = [UIColor redColor];
    [self.view addSubview:barrier];
    
    //add a boundary that coincides with the top edge of the barrier object
    CGPoint rightEdge = CGPointMake(barrier.frame.origin.x + barrier.frame.size.width, barrier.frame.origin.y);

    //allocate dynamics behavoior into memory for the square
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    _gravity = [[UIGravityBehavior alloc] initWithItems:@[square]];
    _collision = [[UICollisionBehavior alloc] initWithItems:@[square]];
    
    //sets the current view controller as the collision delegate
    _collision.collisionDelegate = self;
    
    //initiates top edge boundary for barrier object
    [_collision addBoundaryWithIdentifier:@"barrier" fromPoint:barrier.frame.origin toPoint:rightEdge];
    _collision.translatesReferenceBoundsIntoBoundary = YES;
    
//logs the center and transform properties of the falling square
//    _collision.action = ^{
//        NSLog(@"%@, %@",NSStringFromCGAffineTransform(square.transform),NSStringFromCGPoint(square.center));
//    };
    
    //add the behaviors to the animator
    [_animator addBehavior:_gravity];
    [_animator addBehavior:_collision];
    
    //creates an item behavior, associates it with the square, and adds the behavior object to the animator
    UIDynamicItemBehavior *itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[square]];
    itemBehavior.elasticity = 0.6;
    [_animator addBehavior:itemBehavior];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
