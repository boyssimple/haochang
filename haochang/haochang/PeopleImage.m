//
//  PeopleImage.m
//  haochang
//
//  Created by zhouMR on 16/7/1.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import "PeopleImage.h"

@interface PeopleImage()
@property (nonatomic, strong) UIImageView *img;
@property (nonatomic, strong) UILabel *nickname;
@end
@implementation PeopleImage

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        _img.contentMode = UIViewContentModeScaleAspectFill;
        _img.clipsToBounds = TRUE;
        [self addSubview:_img];
        
        _nickname = [[UILabel alloc]initWithFrame:CGRectMake(3, self.height-22, self.width-3, 12)];
        _nickname.textColor = [UIColor whiteColor];
        [self addSubview:_nickname];
    }
    return self;
}

- (void) updateData:(NSDictionary *)data{
    NSDictionary *avatar = [data objectForKey:@"avatar"];
    self.nickname.text = [NSString stringWithFormat:@"1.%@",[data objectForKey:@"nickname"]];
    [self.img sd_setImageWithURL:[NSURL URLWithString:[avatar objectForKey:@"middle"]]];
}

@end
