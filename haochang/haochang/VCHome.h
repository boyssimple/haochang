//
//  VCHome.h
//  haochang
//
//  Created by zhouMR on 16/7/1.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCHome : VCBase

@end

@protocol VCHomeDelegate <NSObject>

@required
- (void)clickItem;

@end