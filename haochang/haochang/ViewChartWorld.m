//
//  ViewChartWorld.m
//  haochang
//  全国榜
//  Created by zhouMR on 16/7/1.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "ViewChartWorld.h"
#import "VCWButton.h"
#import "PeopleImage.h"

@interface ViewChartWorld()
@property (nonatomic, strong) VCWButton *lbRecomment;
@property (nonatomic, strong) VCWButton *lbArea;
@property (nonatomic, strong) VCWButton *lbNewSong;
@property (nonatomic, strong) VCWButton *lbGuesPoint;
@property (nonatomic, strong) PeopleImage *img;

@property (nonatomic, strong) UILabel *lbAll;
@property (nonatomic, strong) UIImageView *iv;
@end
@implementation ViewChartWorld

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat w = DEVICEWIDTH/4.0;
        
        _lbRecomment = [[VCWButton alloc]initWithFrame:CGRectMake(0, 0, w, 30*RATIO_WIDHT320) withTitle:@"推荐"];
        [_lbRecomment updateData];
        [self addSubview:_lbRecomment];
        
        _lbArea = [[VCWButton alloc]initWithFrame:CGRectMake(_lbRecomment.left, 0, w, _lbRecomment.height) withTitle:@"地区"];
        [_lbArea updateData];
        [self addSubview:_lbArea];
        
        _lbNewSong = [[VCWButton alloc]initWithFrame:CGRectMake(_lbArea.left, 0, w, _lbRecomment.height) withTitle:@"新歌"];
        [_lbNewSong updateData];
        [self addSubview:_lbNewSong];
        
        _lbGuesPoint = [[VCWButton alloc]initWithFrame:CGRectMake(_lbNewSong.left, 0, w, _lbRecomment.height) withTitle:@"猜分"];
        [_lbGuesPoint updateData];
        _lbGuesPoint.line.hidden = TRUE;
        _lbGuesPoint.lbTip.hidden = FALSE;
        [self addSubview:_lbGuesPoint];
        
        _lbAll = [[UILabel alloc]initWithFrame:CGRectMake(0, _lbRecomment.top, self.width, 40*RATIO_WIDHT320)];
        _lbAll.textColor = RGB3(115);
        _lbAll.text = @"全国榜";
        _lbAll.textAlignment = NSTextAlignmentCenter;
        _lbAll.font = [UIFont systemFontOfSize:14];
        [self addSubview:_lbAll];
        
        _img = [[PeopleImage alloc]initWithFrame:CGRectMake(0, _lbAll.top, self.width, 200*RATIO_WIDHT320)];
        [self addSubview:_img];
    }
    return self;
}

- (void)updateData:(NSDictionary*)data{
    [self.img updateData:data];
}
@end
