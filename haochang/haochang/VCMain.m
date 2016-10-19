//
//  MainViewController.m
//  haochang
//
//  Created by zhouMR on 16/7/1.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "VCMain.h"
#import "VCHome.h"
#import "VCDiscovery.h"
#import "VCMine.h"
#import "PlayerBar.h"
#import "Music.h"

#define PLAYVIEWHEIGHT 50

@interface VCMain ()<UITabBarControllerDelegate>
@property (nonatomic, strong) PlayerBar *playerBar;
@end

@implementation VCMain

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.tabBar.hidden = TRUE;
    [self createContentPages];
    
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(change:) name:@"MAINTABCHANGE" object:nil];
}

- (void)change:(NSNotification*)sender{
    NSLog(@"%@",sender.object);
    NSInteger index = [sender.object integerValue];
    self.selectedIndex = index;
}

- (void) createContentPages {
    VCHome *home = [[VCHome alloc] init];
    VCDiscovery *discovery = [[VCDiscovery alloc] init];
    VCMine *mine = [[VCMine alloc] init];
    
    [self addChildViewController:home];
    [self addChildViewController:discovery];
    [self addChildViewController:mine];
    
    Music * music = [[Music alloc]init];
    music.coverLarge = @"http://img-qn.okchang.com/data_center/avatar/23/1429956917_10719123.jpg?imageView2/1/w/70/h/70";
    music.playUrl32 = @"http://files.haochang.tv/file/song/20160715/IM314685585114431412.m4a";
    music.title = @"[合]你那么爱她-高清版";
    
    [MusicManager shareInfo].musicArray = [[[NSArray alloc]initWithObjects:music, nil]mutableCopy];
    [MusicManager shareInfo].index = 0;
    self.playerBar = [[PlayerBar alloc]initWithFrame:CGRectMake(0, DEVICEHEIGHT-PLAYVIEWHEIGHT, DEVICEWIDTH, PLAYVIEWHEIGHT)];
    [self.view addSubview:self.playerBar];
}




@end
