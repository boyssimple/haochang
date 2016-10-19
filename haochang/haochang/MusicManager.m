//
//  MusicManager.m
//  avTest
//
//  Created by lanou on 16/7/4.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "MusicManager.h"


static MusicManager *_musicManager = nil;

@implementation MusicManager

+ (instancetype)shareInfo
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _musicManager = [[MusicManager alloc] init];
    });
    return _musicManager;
}

- (instancetype)init
{
    if (self = [super init]) {
        _player = [[AVPlayer alloc] init];
    }
    return self;
}

// 播放
- (void)playerPlay
{
    [_player play];
    _isPlay = YES;
}
- (void)playerPause
{
    [_player pause];
    _isPlay = NO;
}

- (void)playAndPause
{
    if (self.isPlay) {
        [self playerPause];
    }else{
        [self playerPlay];
    }
}

- (void)playPrevious
{
    if (self.index == 0) {
        self.index = self.musicArray.count - 1;
    }else{
        self.index--;
    }
}

- (void)playNext
{
    if (self.index == self.musicArray.count - 1) {
        self.index = 0;
    }else{
        self.index++;
    }
}


- (void)playerVolumeWithVolumeFloat:(CGFloat)volumeFloat
{
    self.player.volume = volumeFloat;
}

- (void)playerProgressWithProgressFloat:(CGFloat)progressFloat
{
    [self.player seekToTime:CMTimeMakeWithSeconds(progressFloat, 1) completionHandler:^(BOOL finished) {
        [self playerPlay];
    }];
}

- (void)replaceItemWithUrlString:(NSString *)urlString
{
    AVPlayerItem *item = [[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:urlString]];
    [self.player replaceCurrentItemWithPlayerItem:item];
    [self playerPlay];
}


- (void)reset{
    _isPlay = NO;
    [self.player seekToTime:CMTimeMakeWithSeconds(0, 1) completionHandler:^(BOOL finished) {
        [self playerPause];
    }];
}


@end
