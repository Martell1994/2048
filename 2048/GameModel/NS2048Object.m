//
//  NS2048Object.m
//  2048
//
//  Created by Martell on 16/1/10.
//  Copyright © 2016年 Martell. All rights reserved.
//

#import "NS2048Object.h"
#import "GameCore.h"
#import "GameTools.h"
@interface NS2048Object() {
    int _array[16];
}
@end

@implementation NS2048Object
- (instancetype)init
{
    self = [super init];
    if (self) {
        for (int i = 0; i < 16; i++) {
            _array[i] = 0;
        }
        [self insertNewNumber];
        [self insertNewNumber];
    }
    return self;
}

- (void)insertNewNumber {
    for (int i = 0; i < 16; i++) {
        if (_array[i] == 0) {
            int index = 0;
            do {
                index = arc4random() % 16;
            } while (_array[index]);
            //   1/4 => 4   3/4 => 2
            _array[index] = [self randomNewNumber];
            break;
        }
    }
}

- (int)getNumberByIndex:(NSUInteger)index {
    if (index >= 16) {
        return  -1;
    }
    return _array[index];
}

- (BOOL)isFull {
    for (int i = 0; i < 16; i++) {
        if (!_array[i]) {
            return NO;
        }
    }
    return YES;
}

- (BOOL)isGameOver {
    if ([self isFull]) {
        //是否能移动
        for (int i = 0; i < 16; i++) {
            int up = [GameTools getUpIndex:i];
            if (up != -1) {
                if (_array[up] == _array[i]) {
                    return NO;
                }
            }
            int down = [GameTools getDownIndex:i];
            if (down != -1) {
                if (_array[down] == _array[i]) {
                    return NO;
                }
            }
            int left = [GameTools getLeftIndex:i];
            if (left != -1) {
                if (_array[left] == _array[i]) {
                    return NO;
                }
            }
            int right = [GameTools getRightIndex:i];
            if (right != -1) {
                if (_array[right] == _array[i]) {
                    return NO;
                }
            }
        }
        return YES;
    }else {
        //不是满的,还可以继续玩
        return NO;
    }
}

- (int)randomNewNumber {
    int random = arc4random() % 4;
    if (random < 3) {
        return 2;
    }else {
        return 4;
    }
}

- (void)getRow:(int)row toArray:(int *)array {
    for (int i = 0; i < 4; i++) {
        array[i] = _array[4 * row + i];
    }
}

- (void)_getRow:(int)row toArray:(int *)array {
    for (int i = 0; i < 4; i++) {
        array[3 - i] = _array[4 * row + i];
    }
}

- (void)getCol:(int)col toArray:(int *)array {
    for (int i = 0; i < 4; i++) {
        array[i] = _array[4 * i + col];
    }
}

- (void)_getCol:(int)col toArray:(int *)array {
    for (int i = 0; i < 4; i++) {
        array[3 - i] = _array[4 * i + col];
    }
}

- (void)writeRow:(int)row byArray:(int *)array {
    for (int i = 0; i < 4; i++) {
        _array[4 * row + i] = array[i];
    }
}
- (void)_writeRow:(int)row byArray:(int *)array {
    for (int i = 0; i < 4; i++) {
        _array[4 * row + i] = array[3 - i];
    }
}

- (void)writeCol:(int)col byArray:(int *)array {
    for (int i = 0; i < 4; i++) {
        _array[4 * i + col] = array[i];
    }
}
- (void)_writeCol:(int)col byArray:(int *)array {
    for (int i = 0; i < 4; i++) {
        _array[4 * i + col] = array[3 - i];
    }
}

- (BOOL)toLeft {
    int array[4] = {0};
    BOOL hasChange = NO;
    for (int i = 0; i < 4; i++) {
        [self getRow:i toArray:array];
        hasChange = [GameCore arrayToDirection:array] || hasChange;
        [self writeRow:i byArray:array];
    }
    if (hasChange) {
        [self insertNewNumber];
    }
    return [self isGameOver];
}

- (BOOL)toRight {
    int array[4] = {0};
    BOOL hasChange = NO;
    for (int i = 0; i < 4; i++) {
        [self _getRow:i toArray:array];
        hasChange = [GameCore arrayToDirection:array] || hasChange;
        [self _writeRow:i byArray:array];
    }
    if (hasChange) {
        [self insertNewNumber];
    }
    return [self isGameOver];
}

- (BOOL)toUp {
    int array[4] = {0};
    BOOL hasChange = NO;
    for (int i = 0; i < 4; i++) {
        [self getCol:i toArray:array];
        hasChange = [GameCore arrayToDirection:array] || hasChange;
        [self writeCol:i byArray:array];
    }
    if (hasChange) {
        [self insertNewNumber];
    }
    return [self isGameOver];
}

- (BOOL)toDown {
    int array[4] = {0};
    BOOL hasChange = NO;
    for (int i = 0; i < 4; i++) {
        [self _getCol:i toArray:array];
        hasChange = [GameCore arrayToDirection:array] || hasChange;
        [self _writeCol:i byArray:array];
    }
    if (hasChange) {
        [self insertNewNumber];
    }
    return [self isGameOver];
}
@end
