//
//  NavViewController.m
//  haochang
//
//  Created by zhouMR on 16/7/1.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "NavViewController.h"
#import "NavBarItem.h"

@interface NavViewController ()
@property (nonatomic, strong) UIView *header;
@property (nonatomic, strong) NavBarItem *home;
@property (nonatomic, strong) NavBarItem *discover;
@property (nonatomic, strong) NavBarItem *mine;
@end

@implementation NavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar addSubview:self.header];
}

- (UIView *)header{
    if (!_header) {
        _header = [[UIView alloc]initWithFrame:CGRectMake((DEVICEWIDTH-150)/2.0, 13, 150, 30)];
        _header.tag = NAVBARTAG;
        self.home = [[NavBarItem alloc]initWithFrame:CGRectMake(0, 0, 30, _header.height)];
        self.home.title.text = @"首页";
        [self.home selected];
        UITapGestureRecognizer *homeTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(navHomeClick:)];
        [self.home addGestureRecognizer:homeTap];
        [_header addSubview:self.home];
        
        self.discover = [[NavBarItem alloc]initWithFrame:CGRectMake(self.home.left+28, 0, self.home.width, _header.height)];
        self.discover.title.text = @"发现";
        UITapGestureRecognizer *disTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(navDiscoverClick:)];
        [self.discover addGestureRecognizer:disTap];
        [_header addSubview:self.discover];
        
        self.mine = [[NavBarItem alloc]initWithFrame:CGRectMake(self.discover.left+28, 0, self.home.width, _header.height)];
        self.mine.title.text = @"我的";
        self.mine.dot.hidden = FALSE;
        UITapGestureRecognizer *mineTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(navMineClick:)];
        [self.mine addGestureRecognizer:mineTap];
        [_header addSubview:self.mine];
    }
    return _header;
}

- (void)navHomeClick:(UIGestureRecognizer*)ges{
    [[NSNotificationCenter defaultCenter]postNotification:[NSNotification notificationWithName:@"MAINTABCHANGE" object:@"0" userInfo:nil]];
    [self unSelected];
    [self.home selected];
}

- (void)navDiscoverClick:(UIGestureRecognizer*)ges{
    [[NSNotificationCenter defaultCenter]postNotification:[NSNotification notificationWithName:@"MAINTABCHANGE" object:@"1" userInfo:nil]];
    [self unSelected];
    [self.discover selected];
}

- (void)navMineClick:(UIGestureRecognizer*)ges{
    [[NSNotificationCenter defaultCenter]postNotification:[NSNotification notificationWithName:@"MAINTABCHANGE" object:@"2" userInfo:nil]];
    [self unSelected];
    [self.mine selected];
}

- (void)unSelected{
    [self.discover unSelected];
    [self.mine unSelected];
    [self.home unSelected];
}
@end
