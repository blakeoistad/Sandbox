//
//  ViewController.m
//  LandscapeExample
//
//  Created by Simon Allardice on 2/20/14.
//  Copyright (c) 2014 Simon Allardice. All rights reserved.
//

#import "ViewController.h"
#import "MyScene.h"

@implementation ViewController

//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//
//    
//}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    
    if (!skView.scene) {                    //if the view doesnt already have a scene, then initialize the new scene
        // Create and configure the scene.
        SKScene * scene = [MyScene sceneWithSize:skView.bounds.size];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        
        // Present the scene.
        [skView presentScene:scene];
    }
    
    
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

-(BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
