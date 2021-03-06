//
//  Pink.m
//  test
//
//  Created by adoma on 16/6/15.
//  Copyright © 2016年 adoma. All rights reserved.
//

#import "Pink.h"

@implementation Pink
{
    UIBezierPath *path;
}

- (void)awakeFromNib
{
    path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    
    layer.path = path.CGPath;
    
    layer.frame = self.bounds;
    
    self.layer.mask = layer;
    

    CAShapeLayer *borderLayer = [CAShapeLayer new];
    
    borderLayer.fillColor = self.backgroundColor.CGColor;
    
    borderLayer.lineWidth = 2;
    
    borderLayer.strokeColor = [UIColor whiteColor].CGColor;
    
    borderLayer.path = path.CGPath;
    
    [self.layer addSublayer:borderLayer];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (CGPathContainsPoint(path.CGPath, NULL, point, NO)) {
        
        //如何保证只推出一次
        UINavigationController *navi = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
        
        //可根据类判断、title判断
        if (![navi.topViewController.title  isEqual: @"推出视图"]) {
            UIViewController *pushVC = [UIViewController new];
            
            pushVC.view.backgroundColor = [UIColor redColor];
            
            pushVC.title = @"推出视图";
            
            [navi pushViewController:pushVC animated:YES];
        }
        
        NSLog(@"触摸点在椭圆内");
        
        return self;
    }
    
    return nil;
}


@end
