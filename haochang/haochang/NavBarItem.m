//
//  NavBarItem.m
//  haochang
//
//  Created by zhouMR on 16/7/1.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "NavBarItem.h"

@implementation NavBarItem

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _title = [[UILabel alloc]initWithFrame:CGRectMake(0, 5, self.width, 15)];
        _title.font = [UIFont systemFontOfSize:14];
        _title.backgroundColor = [UIColor clearColor];
        _title.textColor = [UIColor blackColor];
        [self addSubview:_title];
        
        _line = [[UIView alloc]initWithFrame:CGRectMake(0, self.height-1, self.width-2, 1)];
        _line.backgroundColor = [UIColor redColor];
        _line.hidden = TRUE;
        [self addSubview:_line];
        
        _dot = [[UIView alloc]initWithFrame:CGRectMake(_title.left-5, _title.y-3, 5, 5)];
        _dot.backgroundColor = [UIColor redColor];
        _dot.hidden = TRUE;
        _dot.layer.cornerRadius = 2.5;
        [self addSubview:_dot];
    }
    return self;
}

- (void)selected{
    self.title.textColor = [UIColor redColor];
    self.line.hidden = FALSE;
}

- (void)unSelected{
    self.title.textColor = [UIColor blackColor];
    self.line.hidden = TRUE;
}
@end
