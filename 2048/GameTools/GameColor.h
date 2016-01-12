//
//  GameColor.h
//  2048
//
//  Created by Martell on 16/1/10.
//  Copyright © 2016年 Martell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameColor : UIColor
+ (UIColor *)gameControllerBackground;

+ (UIColor *)gameTitle;

+ (UIColor *)gameRectBackground;
+ (UIColor *)gameRectTitle;
+ (UIColor *)gameRectNumber;
+ (UIColor *)gameSubRectBackground;

+ (UIColor *)gameButtonBackground;
+ (UIColor *)gameButtonTitle;

+ (UIColor *)gameScoreBackground;
+ (UIColor *)gameScoreTitle;
+ (UIColor *)gameItemBackground;
+ (UIColor *)gameLabelBackground:(unsigned)num;
+ (UIColor *)gameLabelText:(unsigned)num;
@end
