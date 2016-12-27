//
//  ViewController.m
//  CustomModal
//
//  Created by xuning on 2016/12/27.
//  Copyright © 2016年 xuning. All rights reserved.
//

#import "ViewController.h"
#import "XNMPayMethodView.h"
#import "XNMPayViewController.h"
#import "XNMSeimiViewController.h"
#import "UIViewController+KNSemiModal.h"


@interface ViewController ()

@property (nonatomic, strong) XNMPayMethodView *payMethodView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)firstButtonClick:(UIButton *)sender {
    
    [kKeyWindow addSubview:self.payMethodView];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.payMethodView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
        self.payMethodView.bgView.xn_y = kScreenHeight -244;
    }];
}

- (IBAction)secondButtonClick:(UIButton *)sender {
    
    XNMPayViewController *pay = [[XNMPayViewController alloc]init];
    pay.view.backgroundColor = [UIColor clearColor];
    [self presentViewController:pay animated:YES completion:nil];
    
}
- (IBAction)thirdButtonClick:(UIButton *)sender {
    
    XNMSeimiViewController *seimi = [[XNMSeimiViewController alloc]init];
    [self.navigationController presentSemiViewController:seimi withOptions:@{KNSemiModalOptionKeys.pushParentBack    : @(NO),
                                                                            KNSemiModalOptionKeys.animationDuration : @(0.6),
                                                                            KNSemiModalOptionKeys.shadowOpacity     : @(0.8)
                                                                             }];
}

- (XNMPayMethodView *)payMethodView {
    if (_payMethodView == nil) {
        _payMethodView = [[XNMPayMethodView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _payMethodView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0];
        _payMethodView.bgView.backgroundColor = [UIColor clearColor];
        _payMethodView.frame = [UIScreen mainScreen].bounds;
    }
    return _payMethodView;
}

@end
