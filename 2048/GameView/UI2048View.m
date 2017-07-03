//
//  UI2048View.m
//  2048
//
//  Created by Martell on 16/1/10.
//  Copyright © 2016年 Martell. All rights reserved.
//

#import "UI2048View.h"
#import "GameColor.h"
#import "GameTools.h"

@interface UI2048View ()

@property (nonatomic, strong) NSMutableArray *labelArray;

@end

@implementation UI2048View


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //设置自己的背景颜色和圆角值
        self.backgroundColor = [GameColor gameRectBackground];
        self.layer.cornerRadius = 10;
        //私有属性初始化
        self.labelArray = [[NSMutableArray alloc] initWithCapacity:16];
        //16宫格数据计算和获取
        CGFloat selfWidth = frame.size.width;
        CGFloat itemWidth = (selfWidth - 5 * 10) / 4;
        //16宫格创建
        for (int row = 0; row < 4; row++) {
            for (int col = 0; col < 4; col++) {
                //16个背景View
                UIView *subView0 = [[UIView alloc] initWithFrame:CGRectMake((col + 1) * 10+ col * itemWidth, (row + 1) * 10 + row * itemWidth, itemWidth, itemWidth)];
                subView0.backgroundColor = [GameColor gameSubRectBackground];
                subView0.layer.cornerRadius = 5;
                subView0.layer.masksToBounds = YES;
                [self addSubview:subView0];
                //16个Label
                UILabel *subLabel = [[UILabel alloc] initWithFrame:CGRectMake((col + 1) * 10 + col * itemWidth, (row + 1) * 10 + row * itemWidth, itemWidth, itemWidth)];
                subLabel.text = @"2";
                subLabel.layer.cornerRadius = 5;
                subLabel.layer.masksToBounds = YES;
                subLabel.textAlignment = NSTextAlignmentCenter;
                subLabel.textColor = [UIColor whiteColor];
                subLabel.font = [UIFont systemFontOfSize:30];
                [self.labelArray addObject:subLabel];
                [self addSubview:subLabel];
            }
        }
    }
    return self;
}

- (void)setLabelText:(int)num withIndex:(NSUInteger)index {
    UILabel *label = self.labelArray[index];
    label.backgroundColor = [GameColor gameLabelBackground:num];
    label.textColor = [GameColor gameLabelText:num];
    label.text = [NSString stringWithFormat:@"%d",num];
    label.font = [UIFont systemFontOfSize:[GameTools getFontSizeByNumber:num]];
}


@end
