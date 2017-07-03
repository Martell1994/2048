//
//  ViewController.m
//  2048
//
//  Created by Martell on 16/1/10.
//  Copyright © 2016年 Martell. All rights reserved.
//

#import "ViewController.h"
#import "UI2048View.h"
#import "UI2048Button.h"
#import "UI2048ScoreView.h"
#import "NS2048Object.h"
#import "GameColor.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *labelArray;
@property (nonatomic, strong) UI2048View *gameView;
@property (nonatomic, strong) UI2048ScoreView *scoreView;
@property (nonatomic, strong) NS2048Object *data;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //游戏背景颜色
    self.view.backgroundColor = [GameColor gameControllerBackground];
    //游戏名称
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 25, self.view.frame.size.width / 2 - 5, self.view.frame.size.width / 4)];
    titleLabel.text = @"2048";
    titleLabel.font = [UIFont systemFontOfSize:64];
    titleLabel.textColor = [GameColor gameTitle];
    [self.view addSubview:titleLabel];
    //创建游戏界面
    [self initGameView];
    [self.view addSubview:self.gameView];
    //生成分数标签
    self.scoreView = [[UI2048ScoreView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2, 30, self.view.frame.size.width / 2, self.view.frame.size.width / 4 - 10)];
    [self.view addSubview:self.scoreView];
    //重新开始按钮
    UIButton *replayBtn = [[UI2048Button alloc] initButtonTitle:@"New Game" withFrame:CGRectMake(self.view.frame.size.width - 130, self.view.frame.size.width / 4 + 30, 120, 45)];
    [self.view addSubview:replayBtn];
    [replayBtn addTarget:self action:@selector(restartGame) forControlEvents:UIControlEventTouchUpInside];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@(0) forKey:@"currentScore"];
    [self.scoreView setScoreText:0 withIndex:0];
    [defaults synchronize];
    [self refreshViews];
}

- (void)initGameView {
    //获取数据
    CGFloat width = self.view.frame.size.width;
    CGFloat gamebgWidth = width - 20;
    //游戏背景
    self.gameView = [[UI2048View alloc] initWithFrame:CGRectMake(10, self.view.frame.size.width / 4 + 90, gamebgWidth, gamebgWidth)];
    for (int i = 0; i < 4; i++) {
        UISwipeGestureRecognizer *gesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(userSwip:)];
        [gesture setDirection:1<<i];
        [self.gameView addGestureRecognizer:gesture];
    }
    NS2048Object *data = [[NS2048Object alloc]init];
    self.data = data;
}

- (void)restartGame {
    self.data = [self.data init];
    [self refreshViews];
    //初始化分数
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@(0) forKey:@"currentScore"];
    [self.scoreView setScoreText:0 withIndex:0];
    [defaults synchronize];
}

- (void)refreshViews {
    for (int i = 0; i < 16; i++) {
        int num = [self.data getNumberByIndex:i];
        [self.gameView setLabelText:num withIndex:i];
        
    }
    //更新当前分数
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger score = [[defaults objectForKey:@"currentScore"] integerValue];
    [self.scoreView setScoreText:score withIndex:0];
    NSInteger best = [[defaults objectForKey:@"bestScore"] integerValue];
    [self.scoreView setScoreText:best withIndex:1];
}

- (void)userSwip:(UISwipeGestureRecognizer *)recognizer {
    BOOL gameOver = NO;
    switch (recognizer.direction) {
        case UISwipeGestureRecognizerDirectionLeft:
            gameOver = [self.data toLeft];
            break;
        case UISwipeGestureRecognizerDirectionRight:
            gameOver = [self.data toRight];
            break;
        case UISwipeGestureRecognizerDirectionUp:
            gameOver = [self.data toUp];
            break;
        case UISwipeGestureRecognizerDirectionDown:
            gameOver = [self.data toDown];
            break;
        default:
            break;
    }
    [self refreshViews];
    if (gameOver) {
        if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
            UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"游戏结束" message:nil preferredStyle:UIAlertControllerStyleAlert];
            [self presentViewController:alertC animated:YES completion:nil];
            UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //点击确认按钮
            }];
            [alertC addAction:sureAction];
        }
        else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"游戏结束" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"返回", nil];
            [alert show];
#pragma clang diagnostic pop
        }
    }
}

@end
