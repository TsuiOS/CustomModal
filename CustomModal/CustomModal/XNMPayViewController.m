//
//  XNMPayViewController.m
//  CustomModal
//
//  Created by xuning on 2016/12/27.
//  Copyright © 2016年 xuning. All rights reserved.
//

#import "XNMPayViewController.h"

@interface XNMPayViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end

@implementation XNMPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeController)];
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 禁止子视图响应父视图的手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([touch.view isDescendantOfView:self.bgView]) {
        return NO;
    }
    return YES;
    
}
- (void)closeController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
