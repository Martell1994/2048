//
//  NS2048Object.h
//  2048
//
//  Created by Martell on 16/1/10.
//  Copyright © 2016年 Martell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NS2048Object : NSObject
- (BOOL)toLeft;
- (BOOL)toRight;
- (BOOL)toUp;
- (BOOL)toDown;
- (int)getNumberByIndex:(NSUInteger)index;
@end
