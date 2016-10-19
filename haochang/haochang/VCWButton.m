//
//  VCWButton.m
//  haochang
//
//  Created by zhouMR on 16/7/1.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "VCWButton.h"

@implementation VCWButton

- (id)initWithFrame:(CGRect)frame withTitle:(NSString *)title{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGB3(245);
        _lbText = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbText.textColor = RGB3(18);
        _lbText.text = title;
        _lbText.font = [UIFont systemFontOfSize:10];
        [self addSubview:_lbText];
        
        CGSize ts = [_lbText sizeThatFits:CGSizeMake(MAXFLOAT, 10)];
        _lbText.frame = CGRectMake((self.width-ts.width)/2.0, (self.height-10)/2.0, ts.width, 10);
        
        _lbTip = [[UILabel alloc]initWithFrame:CGRectMake(_lbText.left-2, _lbText.y-8, 10, 10)];
        _lbTip.layer.cornerRadius = 5;
        _lbTip.textColor = [UIColor whiteColor];
        _lbTip.font = [UIFont systemFontOfSize:7];
        _lbTip.backgroundColor = [UIColor redColor];
        _lbTip.layer.masksToBounds = TRUE;
        _lbTip.hidden = TRUE;
        _lbTip.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_lbTip];
        
        _line = [[UIView alloc]initWithFrame:CGRectMake(self.width-1, (self.height-15)/2.0, 1, 15)];
        _line.backgroundColor = RGB3(194);
        [self addSubview:_line];
        
        
    }
    return self;
}

- (void)updateData{
    self.lbTip.text = @"8";
}
@end
