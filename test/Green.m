//
//  Green.m
//  test
//
//  Created by adoma on 16/6/15.
//  Copyright © 2016年 adoma. All rights reserved.
//

#import "Green.h"

@implementation Green

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    CGMutablePathRef pathRef=CGPathCreateMutable();
    CGPathMoveToPoint(pathRef, NULL, 0, 0);
    CGPathAddLineToPoint(pathRef, NULL, self.frame.size.width, 0);
    CGPathAddLineToPoint(pathRef, NULL, 0, self.frame.size.height);
    CGPathCloseSubpath(pathRef);
    
    
    if (CGPathContainsPoint(pathRef, NULL, point, NO)) {
        NSLog(@"%@上半部分",NSStringFromClass(self.class));
    } else {
        NSLog(@"%@下半部分",NSStringFromClass(self.class));
    }
    
    return self;
}

@end
