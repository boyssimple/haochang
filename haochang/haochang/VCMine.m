//
//  VCDiscovery.m
//  haochang
//
//  Created by zhouMR on 16/7/1.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "VCMine.h"
#import "CellDiscover.h"

@interface VCMine ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *table;

@end

@implementation VCMine

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.table];
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0){
        return 1;
    }else if (section == 1) {
        return 3;
    }else if(section == 2){
        return 2;
    }
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{\
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 3) {
        return 40;
    }
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.table deselectRowAtIndexPath:indexPath animated:TRUE];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0){
        if (indexPath.row == 0) {
            static NSString *identifier = @"CellMeAction";
            CellDiscover *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[CellDiscover alloc]init];
            }
            [cell updateData:@"朋友圈" andIcon:@"friend_line"];
            return cell;
        }
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            static NSString *identifier = @"CellMeAction";
            CellDiscover *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[CellDiscover alloc]init];
            }
            [cell updateData:@"私密作品" andIcon:@"match"];
            return cell;
        }else if(indexPath.row == 1){
            static NSString *identifier = @"CellMeAction";
            CellDiscover *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[CellDiscover alloc]init];
            }
            [cell updateData:@"我的歌单" andIcon:@"activity"];
            return cell;
        }else if(indexPath.row == 2){
            static NSString *identifier = @"CellMeAction";
            CellDiscover *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[CellDiscover alloc]init];
            }
            [cell updateData:@"我收藏的歌单" andIcon:@"ktv"];
            return cell;
        }
    }else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            static NSString *identifier = @"CellMeAction";
            CellDiscover *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[CellDiscover alloc]init];
            }
            [cell updateData:@"1" andIcon:@"match"];
            return cell;
        }else if(indexPath.row == 1){
            static NSString *identifier = @"CellMeAction";
            CellDiscover *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[CellDiscover alloc]init];
            }
            [cell updateData:@"看视频领鲜花" andIcon:@"activity"];
            return cell;
        }
    }else if (indexPath.section == 3){
        if (indexPath.row == 0) {
            static NSString *identifier = @"CellMeAction";
            CellDiscover *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[CellDiscover alloc]init];
            }
            [cell updateData:@"关注" andIcon:@"match"];
            return cell;
        }else if(indexPath.row == 1){
            static NSString *identifier = @"CellMeAction";
            CellDiscover *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[CellDiscover alloc]init];
            }
            [cell updateData:@"粉丝" andIcon:@"activity"];
            return cell;
        }else if(indexPath.row == 2){
            static NSString *identifier = @"CellMeAction";
            CellDiscover *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[CellDiscover alloc]init];
            }
            [cell updateData:@"打招呼" andIcon:@"activity"];
            return cell;
        }
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 3) {
        static NSString *headerIdentifier = @"header";
        UIView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerIdentifier];
        if (header == nil) {
            header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 40)];
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, 100, 40)];
            label.font = [UIFont boldSystemFontOfSize:14];
            label.text = @"社交 ";
            [header addSubview:label];
        }
        return header;
    }
    return nil;
}

#pragma mark - geter seter
- (UITableView*)table{
    if (!_table) {
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, DEVICEHEIGHT) style:UITableViewStyleGrouped];
        _table.delegate = self;
        _table.dataSource = self;
    }
    return _table;
}
@end
