//
//  XNMPayMethodView.m
//  XingNLive
//
//  Created by xuning on 2016/11/23.
//  Copyright © 2016年 XingNLive&Mall. All rights reserved.
//

#import "XNMPayMethodView.h"

@interface XNMPayMethodView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) UIButton *sureButton;
@property (nonatomic, strong) NSArray *array;
@end

@implementation XNMPayMethodView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.bgView];
        [self.bgView addSubview:self.tableview];
        [self.bgView addSubview:self.sureButton];
    }
    return self;
}


#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}

#pragma mark - 懒加载
- (UIView *)bgView {
    if (_bgView ==  nil) {
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight, kScreenWidth, kScreenHeight)];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}

- (UITableView *)tableview {
    if (_tableview == nil) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 200) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        [_tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    }
    return _tableview;
}
- (UIButton *)sureButton {
    if (_sureButton == nil) {
        _sureButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 200, kScreenWidth, 44)];
        _sureButton.backgroundColor = [UIColor orangeColor];
        [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
    }
    return _sureButton;
}

- (NSArray *)array {
    if (_array == nil) {
        _array = @[@"支付宝",@"微信支付",@"余额支付"];
    }
    return _array;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [UIView animateWithDuration:0.5 animations:^{
       self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0];
       self.bgView.xn_y = kScreenHeight;
    }completion:^(BOOL finished) {
        for (UIView *cover in kKeyWindow.subviews) {
            if ([cover isKindOfClass:[XNMPayMethodView class]]) {
                [cover removeFromSuperview];
            }
        }
    }];
}
@end
