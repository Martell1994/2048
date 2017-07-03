//
//  GameTools.h
//  2048
//
//  Created by Martell on 16/1/10.
//  Copyright © 2016年 Martell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameTools : NSObject

/** 获取到不同数字对应的字体大小*/
+ (NSUInteger)getFontSizeByNumber:(NSUInteger)num;
/** 获取到不同分数对应的字体大小*/
+ (NSUInteger)getFontSizeByScore:(NSInteger)score;

/** 获取当前上方index*/
+ (int)getUpIndex:(int)currentIndex;
/** 获取当前下方index*/
+ (int)getDownIndex:(int)currentIndex;
/** 获取当前左侧index*/
+ (int)getLeftIndex:(int)currentIndex;
/** 获取当前右侧index*/
+ (int)getRightIndex:(int)currentIndex;

@end
