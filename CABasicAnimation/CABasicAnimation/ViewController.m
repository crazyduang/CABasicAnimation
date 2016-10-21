//
//  ViewController.m
//  CABasicAnimation
//
//  Created by admin on 16/9/22.
//  Copyright © 2016年 YL. All rights reserved.
//

#import "ViewController.h"

@interface MyClass : NSObject

- (float)value;

@end

@interface MyClass ()
{
    float value;
}

- (void)setValue:(float)newValue;

@end

@implementation MyClass

- (float)value {
    return value;
}

- (void)setValue:(float)newValue{
    value = newValue;
}

@end



@interface ViewController ()


@property (nonatomic, strong) UIView *animationView;
@property (nonatomic, strong) CABasicAnimation *basicAnimation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.animationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.animationView.center = CGPointMake(self.view.frame.size.width/2, 130);
    self.animationView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.animationView];
    
    NSArray *btnTitle = @[@"闪烁1", @"闪烁2", @"横向", @"纵向", @"缩放", @"组合", @"路径", @"点移动", @"旋转"];
    for (int i = 0; i < btnTitle.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(20, 40+40*i, 60, 30);
        button.tag = i;
        button.backgroundColor = [UIColor redColor];
        [button setTitle:btnTitle[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickButChangeAnimation:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
    
    
}

- (void)clickButChangeAnimation:(UIButton *)sender{
//    [self.animationView.layer removeAllAnimations];
    
    switch (sender.tag) {
        case 0:
            self.basicAnimation = [CABasicAnimation opacityForever_Animation:2];
            [self.animationView.layer addAnimation:self.basicAnimation forKey:nil];
            NSLog(@"闪烁1");
            break;
        case 1:
            self.basicAnimation = [CABasicAnimation opacityTimes_Animation:2 durTimes:1];
            [self.animationView.layer addAnimation:self.basicAnimation forKey:nil];
            NSLog(@"闪烁2");
            break;
        case 2:
             self.basicAnimation = [CABasicAnimation moveX:2 X:[NSNumber numberWithInt:10]];
            NSLog(@"横向");
            break;
        case 3:
            self.basicAnimation = [CABasicAnimation moveY:2 Y:[NSNumber numberWithInt:500]];
            NSLog(@"纵向");
            break;
        case 4:
            self.basicAnimation = [CABasicAnimation scale:[NSNumber numberWithInt:2] orgin:[NSNumber numberWithInt:3] durTimes:2 Rep:2];
            NSLog(@"缩放");
            break;
        case 5:
            NSLog(@"组合");
            self.basicAnimation = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
            self.basicAnimation.duration = 1.f;
            self.basicAnimation.fromValue = [NSNumber numberWithFloat:150.f];
            self.basicAnimation.toValue = [NSNumber numberWithFloat:100.f];
            self.basicAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            self.basicAnimation.repeatCount = CGFLOAT_MAX;
            self.basicAnimation.autoreverses = YES;
            [self.animationView.layer addAnimation:self.basicAnimation forKey:@"cornerRadius"];
            break;
        case 6:
            NSLog(@"路径");
            break;
        case 7:
            self.basicAnimation = [CABasicAnimation movepoint:CGPointMake(100, 100)];
            [self.animationView.layer addAnimation:self.basicAnimation forKey:nil];
            NSLog(@"点移动");
            break;
        case 8:
            self.basicAnimation = [CABasicAnimation rotation:2 degree:10.f direction:3 repeatCount:2];
            [self.animationView.layer addAnimation:self.basicAnimation forKey:nil];
            NSLog(@"旋转");
            
            break;
        default:
            
            break;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
