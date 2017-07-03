//
//  GameCore.h
//  2048
//
//  Created by Martell on 16/1/10.
//  Copyright © 2016年 Martell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameCore : NSObject

/** 计算分数，并返回是否数组变化*/
+ (BOOL)arrayToDirection:(int *)array;

/** 取下一个和非零数字的下标,数字不存在,则返回-1*/
+ (int)getNextNumber:(int *)array currentIndex:(int)currentIndex;

@end
