//
//  UI2048View.h
//  2048
//
//  Created by Martell on 16/1/10.
//  Copyright © 2016年 Martell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UI2048View : UIView

/** 展示游戏区域方框内的数值*/
- (void)setLabelText:(int)num withIndex:(NSUInteger)index;

@end
