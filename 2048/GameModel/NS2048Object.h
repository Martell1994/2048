//
//  NS2048Object.h
//  2048
//
//  Created by Martell on 16/1/10.
//  Copyright © 2016年 Martell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NS2048Object : NSObject

/** 左滑动作，返回游戏是否结束*/
- (BOOL)toLeft;
/** 右滑动作，返回游戏是否结束*/
- (BOOL)toRight;
/** 上滑动作，返回游戏是否结束*/
- (BOOL)toUp;
/** 下滑动作，返回游戏是否结束*/
- (BOOL)toDown;
/** 获取index对应的数值*/
- (int)getNumberByIndex:(NSUInteger)index;

@end
