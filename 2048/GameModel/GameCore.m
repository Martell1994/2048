//
//  GameCore.m
//  2048
//
//  Created by Martell on 16/1/10.
//  Copyright © 2016年 Martell. All rights reserved.
//

#import "GameCore.h"

@implementation GameCore

+ (BOOL)arrayToLeft:(int *)array {
    //用数组表示栈
    int newArray[4] = {0};
    int count = 0;
    for (int i = 0; i < 4; i++) {
        //取第i个数保存到a
        int a = array[i];
        if (!a) {
            //a等于0时不做任何操作
            continue;
        }
        //取下一个和非零数字的下标,数字不存在,则返回-1
        int indexofB = [self getNextNumber:array currentIndex:i];
        if (indexofB != -1) {
            //取下一个非零数字
            int b = array[indexofB];
            //判断b是否等于a
            if (b == a) {
                a *= 2;
                array[indexofB] = 0;
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                NSInteger currentScore = [[defaults objectForKey:@"currentScore"] integerValue] + a;
                [defaults setObject:@(currentScore) forKey:@"currentScore"];
                NSInteger bestScore = [[defaults objectForKey:@"bestScore"] integerValue];
                if (bestScore < currentScore) {
                    [defaults setObject:@(currentScore) forKey:@"bestScore"];
                }
            }
        }
        //a入栈
        newArray[count] = a;
        count ++;
    }

    BOOL hasChange = NO;
    for (int i = 0; i < 4; i++) {
        hasChange = hasChange || array[i]!=newArray[i];
        array[i] = newArray[i];
    }
    return hasChange;
}

+ (int)getNextNumber:(int *)array
        currentIndex:(int)currentIndex {
    for (int i = currentIndex + 1; i < 4; i++) {
        if (array[i]) {
            return i;
        }
    }
    return -1;
}

@end
