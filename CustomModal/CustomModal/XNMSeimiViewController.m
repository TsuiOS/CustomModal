//
//  XNMSeimiViewController.m
//  CustomModal
//
//  Created by xuning on 2016/12/27.
//  Copyright © 2016年 xuning. All rights reserved.
//

#import "XNMSeimiViewController.h"
#import "UIViewController+KNSemiModal.h"
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kKeyWindow [UIApplication sharedApplication].keyWindow

@interface XNMSeimiViewController ()

@end

@implementation XNMSeimiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight-200, kScreenWidth, 200)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self closeViewController];
}
- (void)closeViewController {
    
    UIViewController * parent = [self.view containingViewController];
    if ([parent respondsToSelector:@selector(dismissSemiModalView)]) {
        [parent dismissSemiModalView];
    }
    
}


@end
