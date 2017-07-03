//
//  UI2048Button.h
//  2048
//
//  Created by Martell on 16/1/10.
//  Copyright © 2016年 Martell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UI2048Button : UIButton

/** 配置16个按钮*/
- (instancetype)initButtonTitle:(NSString *)title withFrame:(CGRect)frame;

@end
