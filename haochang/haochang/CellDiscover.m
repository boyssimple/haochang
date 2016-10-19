//
//  CellDiscover.m
//  haochang
//
//  Created by zhouMR on 16/7/18.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "CellDiscover.h"
@interface CellDiscover()
@property (nonatomic, strong) UIImageView *ivIcon;
@property (nonatomic, strong) UILabel *lbName;
@property (nonatomic, strong) UIImageView *ivArrowRight;
@end
@implementation CellDiscover


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView setBackgroundColor:[UIColor whiteColor]];
        
        self.ivIcon = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, 20, 20)];
        [self.contentView addSubview:self.ivIcon];
        
        self.lbName = [[UILabel alloc]initWithFrame:CGRectMake(self.ivIcon.left + 10, self.ivIcon.y+3, DEVICEWIDTH-self.ivIcon.left-10-10, 15)];
        self.lbName.font = [UIFont systemFontOfSize:12];
        self.lbName.textColor = [UIColor blackColor];
        [self.contentView addSubview:self.lbName];
        
        self.ivArrowRight = [[UIImageView alloc]initWithFrame:CGRectMake(DEVICEWIDTH-20, 10, 10, 10)];
        [self.ivArrowRight setImage:[UIImage imageNamed:@"ArrowRight"]];
        [self.contentView addSubview:self.ivArrowRight];
    }
    return self;
}

- (void)updateData:(NSString *)title andIcon:(NSString*)icon{
    [self.ivIcon setImage:[UIImage imageNamed:icon]];
    self.lbName.text = title;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.ivIcon.center = CGPointMake(self.ivIcon.center.x, self.contentView.center.y);
    self.lbName.center = CGPointMake(self.lbName.center.x, self.contentView.center.y);
    self.ivArrowRight.center = CGPointMake(self.ivArrowRight.center.x, self.contentView.center.y);
}
@end
