//
//  GameColor.m
//  2048
//
//  Created by Martell on 16/1/10.
//  Copyright © 2016年 Martell. All rights reserved.
//

#import "GameColor.h"
#define color(r, g, b) [self colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
@implementation GameColor

+ (UIColor *)gameControllerBackground {
    return color(249, 247, 234);
}

+ (UIColor *)gameTitle {
    return color(100, 91, 82);
}

+ (UIColor *)gameRectBackground {
    return color(182, 172, 159);
}

+ (UIColor *)gameRectNumber {
    return color(253, 255, 254);
}

+ (UIColor*)gameRectTitle {
    return color(235, 223, 210);
}

+ (UIColor *)gameSubRectBackground {
    return color(200, 190, 180);
}

+ (UIColor *)gameButtonBackground {
    return color(123, 103, 83);
}

+ (UIColor *)gameButtonTitle {
    return [UIColor whiteColor];
}

+ (UIColor*)gameScoreBackground {
    return color(173, 157, 143);
}

+ (UIColor*)gameScoreTitle {
    return color(234, 222, 210);
}

+ (UIColor *)gameItemBackground {
    return color(200, 190, 180);
}

+ (UIColor *)gameLabelBackground:(unsigned int)num {
    switch (num) {
        case 0:
            return [UIColor colorWithWhite:1 alpha:0];
        case 2:
            return color(235, 227, 217);
        case 4:
            return color(232, 222, 200);
        case 8:
            return color(225, 175, 123);
        case 16:
            return color(213, 140, 88);
        case 32:
            return color(219, 123, 96);
        case 64:
            return color(230, 90, 62);
        case 128:
            return color(235, 215, 114);
        case 256:
            return color(240, 208, 87);
        case 512:
            return color(227, 192, 60);
        case 1024:
            return color(226, 185, 47);
        case 2048:
            return color(235, 196, 44);
        case 4096:
            return color(136, 190, 0);
        case 8192:
            return color(92, 213, 0);
        case 16384:
            return color(20, 172, 141);
        case 32768:
            return color(0, 122, 213);
        case 65536:
            return color(0, 94, 204);
        default:
            return [UIColor colorWithWhite:1 alpha:0.5];
    }
}

+ (UIColor *)gameLabelText:(unsigned int)num {
    switch (num) {
        case 2:
        case 4:
            return color(116, 110, 101);
        default:
            return [UIColor whiteColor];
            break;
    }
}

@end
