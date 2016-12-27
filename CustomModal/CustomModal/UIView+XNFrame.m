//
//  UIView+Frame.m
//  XingNLive
//
//  Created by xuning on 2016/10/16.
//  Copyright © 2016年 xuning. All rights reserved.
//

#import "UIView+XNFrame.h"

@implementation UIView (XNFrame)
//宽度
- (CGFloat)xn_width {
    return self.frame.size.width;
}

- (void)setXn_width:(CGFloat)xn_width {
    CGRect frame = self.frame;
    frame.size.width = xn_width;
    self.frame = frame;
}

//高度
- (CGFloat)xn_height {
    return self.frame.size.height;
}

- (void)setXn_height:(CGFloat)xn_height {
    CGRect frame = self.frame;
    frame.size.height = xn_height;
    self.frame = frame;
}

//x值
- (CGFloat)xn_x {
    return self.frame.origin.x;
}

- (void)setXn_x:(CGFloat)xn_x {
    CGRect frame = self.frame;
    frame.origin.x = xn_x;
    self.frame = frame;
}

//y值
- (CGFloat)xn_y {
    return self.frame.origin.y;
}

- (void)setXn_y:(CGFloat)xn_y {
    CGRect frame = self.frame;
    frame.origin.y = xn_y;
    self.frame = frame;
}

//centerX
- (CGFloat)xn_centerX {
    return self.center.x;
}

- (void)setXn_centerX:(CGFloat)xn_centerX {
    CGPoint center = self.center;
    center.x = xn_centerX;
    self.center = center;
}

//centerY
- (CGFloat)xn_centerY {
    return self.center.y;
}

- (void)setXn_centerY:(CGFloat)xn_centerY {
    CGPoint center = self.center;
    center.y = xn_centerY;
    self.center = center;
}

@end
