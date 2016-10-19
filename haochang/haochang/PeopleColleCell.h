//
//  PeopleColleCell.h
//  haochang
//
//  Created by zhouMR on 16/7/1.
//  Copyright © 2016年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PeopleColleCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *img;
@property (nonatomic, strong) UILabel *nickname;

- (void) updateData:(NSDictionary *)data with:(NSInteger)index;
@end
