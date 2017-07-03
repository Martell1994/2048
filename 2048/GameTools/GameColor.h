//
//  GameColor.h
//  2048
//
//  Created by Martell on 16/1/10.
//  Copyright © 2016年 Martell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameColor : UIColor

/** 控制器背景色*/
+ (UIColor *)gameControllerBackground;
/** 游戏标题颜色*/
+ (UIColor *)gameTitle;
/** 游戏区域背景颜色*/
+ (UIColor *)gameRectBackground;
/** 无数字标签时的背景颜色*/
+ (UIColor *)gameSubRectBackground;
/** 新局按钮背景色*/
+ (UIColor *)gameNewGameBackground;
/** 新局按钮字体颜色*/
+ (UIColor *)gameNewGameTitle;
/** 分数背景色*/
+ (UIColor *)gameScoreBackground;
/** 分数颜色*/
+ (UIColor *)gameScoreTitle;
/** 不同数字标签对应的背景颜色*/
+ (UIColor *)gameLabelBackground:(unsigned)num;
/** 不同数字标签对应的字体颜色*/
+ (UIColor *)gameLabelText:(unsigned)num;

@end
