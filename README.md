# CustomModal
### iOS开发-推出半屏效果的几种实现方式

> 先看效果图,是在是不好描述

![效果图](http://7xsi0q.com1.z0.glb.clouddn.com/WechatIMG1.png)

在APP中这种需求是非常多的,但是如何用简单的代码去实现这种效果一个非常的头疼,我一开始写项目的时候是自己写蒙版,然后用`UIView`是实现效果,处理起来非常的麻烦

实现难度: 五颗星

### 实现方式一
> 实现难度 三颗星

在`keyWindow` 上添加`View`,选择这种方式遇到的坑,就是如果父视图的背景色是`clearColor`,子视图是看不到的.解决方式使用`colorWithAlphaComponent`

核心代码

```OBjc

//懒加载视图
- (XNMPayMethodView *)payMethodView {
    if (_payMethodView == nil) {
        _payMethodView = [[XNMPayMethodView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _payMethodView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0];
        _payMethodView.bgView.backgroundColor = [UIColor clearColor];
        _payMethodView.frame = [UIScreen mainScreen].bounds;
    }
    return _payMethodView;
}

//点击方法
    [kKeyWindow addSubview:self.payMethodView];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.payMethodView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
        self.payMethodView.bgView.xn_y = kScreenHeight -244;
    }];
   

```


`XNMPayMethodView`内部处理:在可以window上移除视图

```
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

```

效果:

![方式一效果图](http://7xsi0q.com1.z0.glb.clouddn.com/Snip20161227_5.png)



### 实现方式二
> 实现难度 两个星

modal控制器,设置控制器的`modalPresentationStyle`为`UIModalPresentationOverCurrentContext`


```
    XNMPayViewController *pay = [[XNMPayViewController alloc]init];
    pay.view.backgroundColor = [UIColor clearColor];
    [self presentViewController:pay animated:YES completion:nil];
```

`XNMPayViewController `控制器代码:

```
    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeController)];
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
    
    
    
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

    
```

问题:给父视图添加手势的时候,子视图也会相应.而且这种方式有蒙版的时候效果不好,适用于背景透明


### 实现方式一
> 实现难度 一个星

终极大招:

使用`UIViewController+KNSemiModal`,既可以退出控制器,也可以退出View

```
    [self.navigationController presentSemiViewController:seimi withOptions:@{KNSemiModalOptionKeys.pushParentBack    : @(NO),
                                                                            KNSemiModalOptionKeys.animationDuration : @(0.6),
                                                                            KNSemiModalOptionKeys.shadowOpacity     : @(0.8)
                                                                             }];
```
详细设置看`UIViewController+KNSemiModal`,这也是无意间发现的扩展,在github上没有搜到.


> Demo地址: