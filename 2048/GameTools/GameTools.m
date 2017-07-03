//
//  GameTools.m
//  2048
//
//  Created by Martell on 16/1/10.
//  Copyright © 2016年 Martell. All rights reserved.
//

#import "GameTools.h"

@implementation GameTools

+ (NSUInteger)getFontSizeByNumber:(NSUInteger)num {
    switch (num) {
        case 0:
            return 0;
        case 2:
        case 4:
        case 8:
        case 16:
        case 32:
        case 64:
            return 35;
        case 128:
        case 256:
        case 512:
            return 30;
        case 1024:
        case 2048:
        case 4096:
        case 8192:
            return 25;
        case 16384:
        case 32768:
        case 65536:
            return 20;
        case 131072:
            return 15;
        default:
            break;
    }
    return 40;
}

+ (NSUInteger)getFontSizeByScore:(NSInteger)score {
    if (score >= 0 && score <= 9999) {
        return 22;
    } else if (score >= 10000 && score <= 99999) {
        return 18;
    } else {
        return 14;
    }
}

+ (int)getUpIndex:(int)currentIndex {
    int up = currentIndex - 4;
    if (up >= 0 && up < 16) {
        return up;
    }else {
        return -1;
    }
}

+ (int)getDownIndex:(int)currentIndex {
    int down = currentIndex + 4;
    if (down >= 0 && down < 16) {
        return down;
    }else {
        return -1;
    }
}

+ (int)getLeftIndex:(int)currentIndex {
    if (!currentIndex % 4) {
        return -1;
    }else {
        return currentIndex - 1;
    }
}

+ (int)getRightIndex:(int)currentIndex {
    if (currentIndex % 4 == 3) {
        return -1;
    }else {
        return currentIndex + 1;
    }
}

@end
