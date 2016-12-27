//
//  XNMPayMethodView.h
//  XingNLive
//
//  Created by xuning on 2016/11/23.
//  Copyright © 2016年 XingNLive&Mall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+XNFrame.h"
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kKeyWindow [UIApplication sharedApplication].keyWindow

@interface XNMPayMethodView : UIView
@property (strong, nonatomic)  UIView *bgView;

@end
