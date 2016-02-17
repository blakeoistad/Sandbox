//
//  ViewController.m
//  DragDrop
//
//  Created by Blake Oistad on 10/18/15.
//  Copyright © 2015 Blake Oistad. All rights reserved.
//

#import "ViewController.h"
#import "GameScene.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    //configure the view
    SKView *skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    if (!skView.scene) {
        SKScene *scene = [GameScene sceneWithSize:skView.bounds.size];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        
            [skView presentScene:scene];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(BOOL)prefersStatusBarHidden {
    return YES;
}



@end
