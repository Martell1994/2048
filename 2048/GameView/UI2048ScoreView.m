//
//  UI2048ScoreView.m
//  2048
//
//  Created by Martell on 16/1/10.
//  Copyright © 2016年 Martell. All rights reserved.
//

#import "UI2048ScoreView.h"
#import "GameColor.h"
#import "GameTools.h"

@interface UI2048ScoreView ()
@property (nonatomic, strong) NSMutableArray *scoreArray;
@end
@implementation UI2048ScoreView

- (instancetype)initWithFrame:(CGRect)frame {
    //私有属性初始化
    self.scoreArray = [[NSMutableArray alloc] initWithCapacity:2];
    if (self = [super initWithFrame:frame]) {
        for (int i = 0; i < 2; i ++) {
            //标签背景面板
            UIView *scoreView = [[UIView alloc] initWithFrame:CGRectMake(0 + i * (self.frame.size.width / 2), 0, self.frame.size.width / 2 - 10, self.frame.size.width / 2 - 15)];
            scoreView.backgroundColor = [GameColor gameScoreBackground];
            scoreView.layer.cornerRadius = 5;
            [self addSubview:scoreView];
            //指示分数标签
            UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(i * (self.frame.size.width / 2), 5, self.frame.size.width / 2 - 10, self.frame.size.width / 6)];
            titleLabel.textColor = [GameColor gameScoreTitle];
            titleLabel.font = [UIFont systemFontOfSize:18 weight:1];
            titleLabel.textAlignment = NSTextAlignmentCenter;
            self.backgroundColor = [GameColor gameControllerBackground];
            self.layer.cornerRadius = 5;
            if (i == 0) {
                titleLabel.text = @"SCORE";
            } else {
                titleLabel.text = @"BEST";
            }
            [self addSubview:titleLabel];
            UILabel *scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0 + i * (self.frame.size.width / 2), self.frame.size.width / 6 + 5, self.frame.size.width / 2 - 10, self.frame.size.width / 3 - 25)];
            scoreLabel.font = [UIFont systemFontOfSize:22 weight:1];
            scoreLabel.textAlignment = NSTextAlignmentCenter;
            scoreLabel.textColor = [UIColor whiteColor];
            [self.scoreArray addObject:scoreLabel];
            [self addSubview:scoreLabel];
        }
    }
    return self;
}

- (void)setScoreText:(NSInteger)score withIndex:(NSUInteger)index {
    UILabel *scoreLabel = self.scoreArray[index];
    scoreLabel.font = [UIFont systemFontOfSize:[GameTools getFontSizeByScore:score] weight:1];
    scoreLabel.text = [NSString stringWithFormat:@"%ld",(long)score];
}

@end
