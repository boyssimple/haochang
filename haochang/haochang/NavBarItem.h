//
//  NavBarItem.h
//  haochang
//
//  Created by zhouMR on 16/7/1.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavBarItem : UIView
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UIView *dot;

- (void)selected;
- (void)unSelected;
@end
