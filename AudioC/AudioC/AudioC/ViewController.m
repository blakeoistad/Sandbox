//
//  ViewController.m
//  AudioC
//
//  Created by Blake Oistad on 12/23/15.
//  Copyright © 2015 Blake Oistad. All rights reserved.
//

#import "ViewController.h"
@import AVFoundation;
@import MediaPlayer;

@interface ViewController ()

@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (nonatomic, weak) IBOutlet UISlider *volumeSlider;
@property (nonatomic, weak) IBOutlet UISlider *progressSlider;
@property (nonatomic, weak) IBOutlet UISlider *rateSlider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpAudio];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self becomeFirstResponder];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
}

- (void)remoteControlReceivedWithEvent:(UIEvent *)event {

}


- (void)setUpAudio {
    NSError *error;
    [[AVAudioSession sharedInstance] setActive:true error: &error];
    if (error != nil) {
        NSAssert(error == nil, @"");
    }
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error:&error];
    if (error != nil) {
        NSAssert(error == nil, @"");
    }
    
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"15 M'$" withExtension:@"mp3"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&error];
    if (error != nil) {
        NSAssert(error == nil, @"");
    }
    self.audioPlayer.enableRate = YES;
    [self.audioPlayer prepareToPlay];
    [self.audioPlayer setVolume:self.volumeSlider.value];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(audioInterrupt:) name:AVAudioSessionInterruptionNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(audioRouteChanged:) name:AVAudioSessionRouteChangeNotification object:nil];

    MPRemoteCommandCenter *commandCenter = [MPRemoteCommandCenter sharedCommandCenter];
    [commandCenter.playCommand addTarget:self action:@selector(playButtonPressed:)];
    [commandCenter.stopCommand addTarget:self action:@selector(stopButtonPressed:)];
    [commandCenter.pauseCommand addTarget:self action:@selector(stopButtonPressed:)];
    
}

- (void)audioRouteChanged:(NSNotification *)notification {
    NSNumber *reason = (NSNumber *)[notification.userInfo valueForKey:AVAudioSessionRouteChangeReasonKey];
    switch ([reason integerValue]) {
        case AVAudioSessionRouteChangeReasonOldDeviceUnavailable:
        case AVAudioSessionRouteChangeReasonNoSuitableRouteForCategory:
            NSLog(@"Route Changed: %@", reason);
            [self stopButtonPressed:nil];
            break;
            
        default:
            break;
    }
}

- (void)audioInterrupt:(NSNotification *)notification {
    NSNumber *interruptionType = (NSNumber *)[notification.userInfo valueForKey:AVAudioSessionInterruptionTypeKey];
    switch ([interruptionType integerValue]) {
        case AVAudioSessionInterruptionTypeBegan:
            NSLog(@"Interruption Type: %@", interruptionType);
            [self stopButtonPressed:nil];
            break;
        case AVAudioSessionInterruptionTypeEnded:
        {
            if ([(NSNumber *)[notification.userInfo valueForKey:AVAudioSessionInterruptionOptionKey] intValue] == AVAudioSessionInterruptionOptionShouldResume) {
                [self playButtonPressed:nil];
            }
        }
            break;
        default:
            break;
    }
}

- (IBAction)playButtonPressed:(id)sender {
    NSLog(@"Play Button Pressed");
    BOOL played = [self.audioPlayer play];
    if (!played) {
        NSLog(@"Error");
    }
    
    MPMediaItemArtwork *albumArt = [[MPMediaItemArtwork alloc] initWithImage:[UIImage imageNamed:@"CoverArt"]];
    NSDictionary *songInfo = @{
                               MPMediaItemPropertyTitle:@"Random Audio Title",
                               MPMediaItemPropertyArtist:@"Roganiss JoeRog",
                               MPMediaItemPropertyArtwork:albumArt,
                               };
    [[MPNowPlayingInfoCenter defaultCenter]setNowPlayingInfo:songInfo];
}

- (IBAction)stopButtonPressed:(id)sender {
    NSLog(@"Stop Button Pressed");
    [self.audioPlayer stop];
}

- (IBAction)volumeSliderChanged:(UISlider *)sender {
    NSLog(@"Volume Adjusted");
    [self.audioPlayer setVolume: sender.value];
}

- (IBAction)progressValueChanged:(UISlider *)sender {
    NSLog(@"Progress Changed");
}

- (IBAction)rateValueChanged:(UISlider *)sender {
    NSLog(@"Rate Value Changed");
    [self.audioPlayer setRate: sender.value];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
