//
//  ViewController.m
//  OBJCmusicLibraryDemo
//
//  Created by Blake Oistad on 4/24/16.
//  Copyright © 2016 Blake Oistad. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Properties

#pragma mark - Media Query Methods

- (void)getSongInfo {
    
    MPMediaQuery *myPlaylistsQuery = [MPMediaQuery playlistsQuery];
    NSArray *playlists = [myPlaylistsQuery collections];
    
    for (MPMediaPlaylist *playlist in playlists) {
        NSLog (@"%@", [playlist valueForProperty: MPMediaPlaylistPropertyName]);
        
        NSArray *songs = [playlist items];
        for (MPMediaItem *song in songs) {
            NSString *songTitle =
            [song valueForProperty: MPMediaItemPropertyTitle];
            NSLog (@"\t\t%@", songTitle);
            
            
        }
    }
}

#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getSongInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
