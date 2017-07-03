//
//  UI2048ScoreView.h
//  2048
//
//  Created by Martell on 16/1/10.
//  Copyright © 2016年 Martell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UI2048ScoreView : UIView

/** 配置分数面板 0 - SCORE，1 - BEST*/
- (void)setScoreText:(NSInteger)score withIndex:(NSUInteger)index;

@end
