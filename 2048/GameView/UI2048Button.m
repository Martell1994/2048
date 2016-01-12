//
//  UI2048Button.m
//  2048
//
//  Created by Martell on 16/1/10.
//  Copyright © 2016年 Martell. All rights reserved.
//

#import "UI2048Button.h"
#import "GameColor.h"

@implementation UI2048Button

- (instancetype)initButtonTitle:(NSString *)title withFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setTitle:title forState:0];
        [self setTitleColor:[GameColor gameButtonTitle] forState:0];
        [self setBackgroundColor:[GameColor gameButtonBackground]];
        self.titleLabel.font = [UIFont systemFontOfSize:18 weight:2];
        self.layer.cornerRadius = 5;
    }
    return self;
}

@end
