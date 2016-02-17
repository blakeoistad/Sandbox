////
////  RecordViewController.m
////  AudioC
////
////  Created by Blake Oistad on 12/23/15.
////  Copyright © 2015 Blake Oistad. All rights reserved.
////
//
//#import "RecordViewController.h"
//
//typedef NS_ENUM(NSUInteger, AudioQueueState) {
//    AudioQueueState_Idle,
//    AudioQueueState_Recording,
//    AudioQueueState_Playing,
//};
//
//@import AVFoundation;
//
//@interface RecordViewController ()
//
//@property AudioQueueState *currentState;
//
//@end
//
////Set audio format to record in universally
//static AudioStreamBasicDescription audioFormat;
//
//
//@implementation RecordViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    [self setUpAudio];
//}
//
//- (void)setUpAudio {
//    audioFormat.mSampleRate = 44100.00;
//    audioFormat.mFormatID = kAudioFormatLinearPCM;
//    audioFormat.mFormatFlags = kAudioFormatFlagIsSignedInteger | kAudioFormatFlagIsPacked;
//    audioFormat.mFramesPerPacket = 1;
//    audioFormat.mChannelsPerFrame = 1;
//    audioFormat.mBitsPerChannel = 16;
//    audioFormat.mBytesPerFrame = audioFormat.mChannelsPerFrame * sizeof(SInt16);
//    audioFormat.mBytesPerPacket = audioFormat.mFramesPerPacket * audioFormat.mBytesPerFrame;
//    
//    self.currentState = AudioQueueState_Idle;
//}
//
//- (void)stopRecording {
//    
//}
//
//- (IBAction)recordButtonPressed:(id)sender {
//    NSLog(@"Record Button Pressed");
//    switch (self.currentState) {
//        case AudioQueueState_Idle:
//            break;
//        case AudioQueueState_Playing:
//            return;
//        case AudioQueueState_Recording:
//            [self stopRecording];
//            return;
//        default:
//            break;
//    }
//    
//    NSError *error;
//    [[AVAudioSession sharedInstance] setActive:YES error: &error];
//    NSAssert(error == nil, @"Error");
//    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryRecord error: &error];
//    NSAssert(error == nil, @"Error");
//    
//    [[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted) {
//        if (granted) {
//            self.currentState = AudioQueueState_Recording;
//        } else {
//            NSAssert(error == nil, @"Error");
//        }
//    }];
//    
//}
//
//- (IBAction)playAudioButtonPressed:(id)sender {
//    NSLog(@"Play Audio Button Pressed");
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//}
//
//@end
