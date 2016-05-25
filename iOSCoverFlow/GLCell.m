//
//  GLCell.m
//  iOSCoverFlow
//
//  Created by 吕建发 on 16/5/25.
//  Copyright © 2016年 cn.geek. All rights reserved.
//


#import "GLCell.h"

// 颜色
#define LVColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define LVColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

// 随机色
#define LVRandomColor LVColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface GLCell ()


@end

@implementation GLCell

- (void)setIndexPath:(NSIndexPath *)idxPath withCount:(int)count {
    
    self.backgroundColor = LVRandomColor;
    
    
    self.lblName.text = [NSString stringWithFormat:@"%@ / %@", @(idxPath.item), @(count)];
}
@end
