//
//  PlayerBar.m
//  haochang
//
//  Created by zhouMR on 16/7/15.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "PlayerBar.h"
#import "Music.h"

@interface PlayerBar()
@property (nonatomic, strong) UIView *gray;
@property (nonatomic, strong) UIButton *playBtn;
@property (nonatomic, strong) UIButton *musicListBtn;
@property (nonatomic, strong) UILabel *lbName;
@property (nonatomic, strong) UILabel *lbStatus;
@property (nonatomic, strong) UIImageView *ivImg;

@property (nonatomic, assign) CGFloat progressValue;

@property (nonatomic, strong) NSTimer *timer;
@end

@implementation PlayerBar


- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
        [self initData];
    }
    return self;
}

- (void)setUpUI{
    self.backgroundColor = [UIColor clearColor];
    _gray = [[UIView alloc]init];
    _gray.backgroundColor = [UIColor blackColor];
    _gray.alpha = 0.8;
    [self addSubview:_gray];
    
    _playBtn = [[UIButton alloc]initWithFrame:CGRectZero];
    [_playBtn setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateNormal];
    [_playBtn addTarget:self action:@selector(playAndPauseAct:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_playBtn];
    
    _musicListBtn = [[UIButton alloc]initWithFrame:CGRectZero];
    [_musicListBtn setImage:[UIImage imageNamed:@"music_list"] forState:UIControlStateNormal];
    [self addSubview:_musicListBtn];
    
    _ivImg = [[UIImageView alloc]initWithFrame:CGRectMake(10, (self.height-30)/2.0, 30, 30)];
    _ivImg.image = [UIImage imageNamed:@"abc"];
    _ivImg.layer.cornerRadius = 15;
    _ivImg.layer.masksToBounds = TRUE;
    [self addSubview:_ivImg];
    
    _lbName = [[UILabel alloc]initWithFrame:CGRectZero];
    _lbName.font = [UIFont systemFontOfSize:14];
    _lbName.textColor = [UIColor whiteColor];
    _lbName.text = @"爱情电影-高清版";
    [self addSubview:_lbName];
    
    _lbStatus = [[UILabel alloc]initWithFrame:CGRectZero];
    _lbStatus.font = [UIFont systemFontOfSize:10];
    _lbStatus.textColor = [UIColor redColor];
    _lbStatus.text = @"播放中";
    [self addSubview:_lbStatus];
}

- (void)initData{
    NSInteger index = [MusicManager shareInfo].index;
    [self reloadDataWithIndex:index];
    self.progressValue = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerAct) userInfo:nil repeats:YES];
}

- (void)reloadDataWithIndex:(NSInteger)index
{
    // 寻找model
    Music *model = [MusicManager shareInfo].musicArray[index];
    // 改变图片 标题 音频
    [self.ivImg sd_setImageWithURL:[NSURL URLWithString:model.coverLarge] placeholderImage:[UIImage imageNamed:IMGPlaceHolder]];
    self.lbName.text = model.title;
    // 修改播放歌曲
    [[MusicManager shareInfo] replaceItemWithUrlString:model.playUrl32];
}


- (void)timerAct{
    if ([MusicManager shareInfo].player.currentTime.timescale == 0 || [MusicManager shareInfo].player.currentItem.duration.timescale == 0) {
        return;
    }
    // 获得音乐总时长
    long long int totalTime = [MusicManager shareInfo].player.currentItem.duration.value / [MusicManager shareInfo].player.currentItem.duration.timescale;
    // 获得当前时间
    long long int currentTime = [MusicManager shareInfo].player.currentTime.value / [MusicManager shareInfo].player.currentTime.timescale;

    self.progressValue = currentTime;
    
    if (self.progressValue == totalTime) {
//        [[MusicManager shareInfo] playNext];
//        [self reloadDataWithIndex:[MusicManager shareInfo].index];
        NSLog(@"播放完成");
        [[MusicManager shareInfo] reset];
        [self.playBtn setImage:[UIImage imageNamed:@"play"] forState:(UIControlStateNormal)];
    }
    
    if ([MusicManager shareInfo].isPlay) {
        [UIView beginAnimations:@"rzoration" context:nil];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        self.ivImg.transform = CGAffineTransformRotate(self.ivImg.transform, 0.02);
        [UIView commitAnimations];
    }
}

- (IBAction)playAndPauseAct:(id)sender {
    UIButton *btn = sender;
    if ([MusicManager shareInfo].isPlay == YES) {
        [btn setImage:[UIImage imageNamed:@"play"] forState:(UIControlStateNormal)];
    }else{
        [btn setImage:[UIImage imageNamed:@"pause"] forState:(UIControlStateNormal)];
    }
    [[MusicManager shareInfo] playAndPause];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.gray.frame = CGRectMake(0, 0, self.width, self.height);
    
    self.musicListBtn.frame = CGRectMake(self.width-35, (self.height-25)/2.0, 25, 25);
    self.playBtn.frame = CGRectMake(self.musicListBtn.x-35, (self.height-25)/2.0, 25, 25);
    
  
    CGSize ns = [self.lbName sizeThatFits:CGSizeMake(MAXFLOAT, 14)];
    self.lbName.frame = CGRectMake(45, 10, ns.width, 14);
    
    CGSize ss = [self.lbStatus sizeThatFits:CGSizeMake(MAXFLOAT, 10)];
    self.lbStatus.frame = CGRectMake(45, self.lbName.top+5, ss.width, 10);
}

@end
