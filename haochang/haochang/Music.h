//
//  Music.h
//  haochang
//
//  Created by zhouMR on 16/7/18.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Music : NSObject
// 图片
@property (nonatomic, copy) NSString *coverLarge;
// 音乐地址
@property (nonatomic, copy) NSString *playUrl32;
// 标题
@property (nonatomic, strong) NSString *title;

@end
