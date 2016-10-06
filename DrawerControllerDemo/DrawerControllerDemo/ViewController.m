//
//  ViewController.m
//  DrawerControllerDemo
//
//  Created by mac on 2016/10/6.
//  Copyright © 2016年 XYD. All rights reserved.
//

#import "ViewController.h"

#import "DrawerController.h"

@interface ViewController ()

@property (nonatomic, strong) DrawerController * drawVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIViewController * left = [[UIViewController alloc]init];
    left.view.backgroundColor = [UIColor redColor];
    
    UIViewController * right = [[UIViewController alloc]init];
    right.view.backgroundColor = [UIColor blueColor];
    
    UIViewController * mid = [[UIViewController alloc]init];
    mid.view.backgroundColor = [UIColor greenColor];
    
    UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] initWithTitle:@"left" style:UIBarButtonItemStyleDone target:self action:@selector(openLeftDrawer)];
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc] initWithTitle:@"right" style:UIBarButtonItemStyleDone target:self action:@selector(openRightDrawer)];
    [mid.navigationItem setLeftBarButtonItem: leftButton];
    [mid.navigationItem setRightBarButtonItem: rightButton];
    
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:mid];

    //  传入三个视图控制器，一般情况中间视图为导航控制器视图
    //  中间视图不允许为空，左右可以为空
    //  可以自行设置手势启用、触发距离、展开宽度、展开时间
    //  把控制器的view加进主视图即可
    
    _drawVC = [[DrawerController alloc]initWithMidVC:nav leftVC:left rithtVC:right];
//    _drawVC = [[DrawerController alloc]initWithMidVC:nav leftVC:left rithtVC:nil];
//    _drawVC.PanGestureEnabled = NO;
//    _drawVC.TapGestureEnabled = NO;
//    _drawVC.openTime = 0.2;
//    _drawVC.openWidth = 300;
    
    [self.view addSubview:_drawVC.view];
}

- (void) openLeftDrawer {
    [_drawVC leftButtonTrigger];
}

- (void) openRightDrawer {
    [_drawVC rightButtonTrigger];
}

@end
