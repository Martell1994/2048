//
//  GameCore.h
//  2048
//
//  Created by Martell on 16/1/10.
//  Copyright © 2016年 Martell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameCore : NSObject



+ (BOOL)arrayToLeft:(int *)array;

+ (int)getNextNumber:(int *)array currentIndex:(int)currentIndex;
@end
