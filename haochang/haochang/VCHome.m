//
//  VCHome.m
//  haochang
//
//  Created by zhouMR on 16/7/1.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "VCHome.h"
#import "ADPCollectionView.h"
#import "ViewChartWorld.h"
#import "PeopleColleCell.h"
#import "VCPlay.h"

@interface VCHome ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate>
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) UIView *header;
@property (nonatomic, strong) ViewChartWorld *chartWorld;

@property (nonatomic, strong) UICollectionView *colles;
@property (nonatomic, strong) NSArray *dataSource;
@end

@implementation VCHome

- (void)viewDidLoad {
    [super viewDidLoad];
    [NetTool requestGetWith:Net_boot_url andblock:^(NSDictionary *dic, NSError *error) {
        if (dic != nil) {
            NSDictionary *data = [dic objectForKey:@"data"];
            if (data) {
                NSArray *ads = [data objectForKey:@"ads"];
                NSMutableArray *arr = [[NSMutableArray alloc]init];
                int count = (int)ads.count;
                if (count > 5) {
                    count = 5;
                }
                for (int i=0; i < count;i++) {
                    NSDictionary *d = [ads objectAtIndex:i];
                    [arr addObject:[d objectForKey:@"image"]];
                }
                [ADPCollectionView collectionViewWithFrame:CGRectMake(0, 0, self.header.width, self.header.height)
                                                imageArray:arr
                                                 Direction:UICollectionViewScrollDirectionHorizontal
                                              timeInterval:5
                                                      view:self.header];
            }
        }
    }];
    
    [self.view addSubview:self.table];
    
    [NetTool requestGetWith:Net_rank_nation_url andblock:^(NSDictionary *dic, NSError *error) {
        if (dic != nil) {
            NSDictionary *data = [dic objectForKey:@"data"];
            if (data) {
                NSArray *songs = [data objectForKey:@"songs"];
                if (songs && songs.count > 0) {
                    NSDictionary *d = [songs objectAtIndex:0];
                    NSDictionary *singer = [d objectForKey:@"singer"];
                    [self.chartWorld updateData:singer];
                    self.dataSource = songs;
                    int count = 3;
                    if (self.dataSource.count %2 == 0) {
                        count = (int)self.dataSource.count/2;
                    }else{
                        count = (int)self.dataSource.count/2+1;
                    }
                    
                    self.colles.height = count*120;
                    [self.colles reloadData];
                    [self.table reloadData];
                }
            }
        }
    }];
    
}

- (void)viewWillAppear:(BOOL)animated{
    //    UIView *view = [self.navigationController.navigationBar viewWithTag:NAVBARTAG];
    //    if (view) {
    //        view.hidden = FALSE;
    //    }
}

- (void)requestItem:(NSString *)songId{
    NSDictionary *param = [[NSDictionary alloc]initWithObjectsAndKeys:songId,@"songId", nil];
//    [NetTool requestPostWith:Net_music_item_url withParams:param andblock:^(NSDictionary *dic, NSError *error) {
//        NSLog(@"结果：%@",dic);
//    }];
    [NetTool requestGetWith:[NSString stringWithFormat:@"%@",Net_music_item_url] andblock:^(NSDictionary *dic, NSError *error) {
        NSLog(@"结果：%@",dic);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

#pragma mark -UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 150*RATIO_WIDHT320;
    }else if(section == 1){
        return self.chartWorld.height;
    }else{
        return self.colles.height;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return self.header;
    }else if(section == 1){
        return self.chartWorld;
    }
    return self.colles;
}

#pragma mark - UICollectionView delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.dataSource.count == 0) {
        return 0;
    }
    return self.dataSource.count - 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PeopleColleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PeopleColleCell" forIndexPath:indexPath];
    NSDictionary *data = [self.dataSource objectAtIndex:indexPath.row+1];
    [cell updateData:data with:indexPath.row];
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((DEVICEWIDTH-2)/2, 120);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    VCPlay *vc = [[VCPlay alloc]init];
//    UIView *view = [self.navigationController.navigationBar viewWithTag:NAVBARTAG];
//    if (view) {
//        view.hidden = TRUE;
//    }
//    [self.navigationController pushViewController:vc animated:TRUE];
//    [self presentViewController:vc animated:TRUE completion:^{
//        
//    }];
    NSDictionary *data = [self.dataSource objectAtIndex:indexPath.row+1];
    [self requestItem:[data objectForKey:@"songId"]];
    NSLog(@"%@",data);
}



- (UITableView *)table{
    if(!_table){
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, DEVICEHEIGHT)];
        _table.delegate = self;
        _table.dataSource = self;
    }
    return _table;
}

- (UIView *)header{
    if(!_header){
        _header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 150*RATIO_WIDHT320)];
    }
    return _header;
}

- (ViewChartWorld *)chartWorld{
    if(!_chartWorld){
        _chartWorld = [[ViewChartWorld alloc]initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 270*RATIO_WIDHT320+2)];
    }
    return _chartWorld;
}


#pragma mark - geter seter
- (UICollectionView *)colles {
    if(!_colles)
    {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 2.0;
        flowLayout.minimumInteritemSpacing = 2.0;
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        _colles = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, DEVICEHEIGHT) collectionViewLayout:flowLayout];
        _colles.backgroundColor = [UIColor clearColor];
        _colles.delegate = self;
        _colles.dataSource = self;
        _colles.scrollEnabled = FALSE;
        _colles.showsVerticalScrollIndicator = NO;
        [_colles registerClass:[PeopleColleCell class] forCellWithReuseIdentifier:@"PeopleColleCell"];
    }
    return _colles;
}
@end
