//
//  VCPlay.m
//  haochang
//
//  Created by zhouMR on 16/7/4.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "VCPlay.h"

@interface VCPlay ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *table;

@end

@implementation VCPlay

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"音乐播放";
//    [self.view addSubview:self.table];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

#pragma mark -UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 300;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (UITableView *)table{
    if(!_table){
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, DEVICEHEIGHT)];
        _table.delegate = self;
        _table.dataSource = self;
    }
    return _table;
}

@end
