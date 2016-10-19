//
//  VCWButton.h
//  haochang
//
//  Created by zhouMR on 16/7/1.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCWButton : UIView
@property (nonatomic, strong) UILabel *lbText;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UILabel *lbTip;
- (id)initWithFrame:(CGRect)frame withTitle:(NSString *)title;
- (void)updateData;
@end
