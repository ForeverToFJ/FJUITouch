//
//  ViewController.m
//  FJUITouch
//
//  Created by  高帆 on 2017/3/2.
//  Copyright © 2017年 GF. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/**
 *  <#注释#>
 */
@property (nonatomic, strong) UIImageView *imageView;

/**
 *  <#注释#>
 */
@property (nonatomic, assign) CGPoint mPtLast;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    imageView.frame = CGRectMake(50, 100, 300, 200);
    
    self.imageView = imageView;
    
    [self.view addSubview:imageView];
    
}

// 点击屏幕开始的瞬间调用此方法
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"触碰瞬间");
    
    // 获取点击对象，anyObject -> 获取任何一个点击对象
    UITouch *touch = [touches anyObject];
    
    if (touch.tapCount == 1) {
        NSLog(@"单击");
    }
    else if (touch.tapCount == 2) {
        NSLog(@"双击");
    }
    
    self.mPtLast = [touch locationInView:self.view];
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"滑动ing");
    
    UITouch *touch = [touches anyObject];
    
    // 获取当前手指在屏幕上的相对当前试图的坐标
    CGPoint pt = [touch locationInView:self.view];
    
    // 偏移量
    float xOffset = pt.x - self.mPtLast.x;
    float yOffset = pt.y - self.mPtLast.y;
    
    self.mPtLast = pt;
    
    self.imageView.frame = CGRectMake(self.imageView.frame.origin.x + xOffset, self.imageView.frame.origin.y + yOffset, 300, 200);
    
    NSLog(@"x = %.1f, y = %.1f", pt.x, pt.y);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"离开屏幕");
}

// 特殊情况中断触屏事件  （电话）
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}


@end
