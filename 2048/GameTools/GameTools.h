//
//  GameTools.h
//  2048
//
//  Created by Martell on 16/1/10.
//  Copyright © 2016年 Martell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameTools : NSObject
+ (NSUInteger)getIndexByLine:(NSUInteger)line andCol:(NSUInteger)col;

+ (NSUInteger)getLineByIndex:(NSUInteger)index;
+ (NSUInteger)getColByIndex:(NSUInteger)index;

+ (NSUInteger)getFontSizeByNumber:(NSUInteger)num;
+ (NSUInteger)getFontSizeByScore:(NSInteger)score;

+ (int)getUpIndex:(int)currentIndex;
+ (int)getDownIndex:(int)currentIndex;
+ (int)getLeftIndex:(int)currentIndex;
+ (int)getRightIndex:(int)currentIndex;
@end
