//
//  CABasicAnimation+animation.h
//  CABasicAnimation
//
//  Created by admin on 16/9/22.
//  Copyright © 2016年 YL. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CABasicAnimation (animation)


// 永久闪烁的动画
+(CABasicAnimation *)opacityForever_Animation:(float)time;
// 有闪烁次数的动画
+(CABasicAnimation *)opacityTimes_Animation:(float)repeatTimes durTimes:(float)time;
// 横向移动
+(CABasicAnimation *)moveX:(float)time X:(NSNumber *)x;
// 纵向移动
+(CABasicAnimation *)moveY:(float)time Y:(NSNumber *)y;
// 缩放
+(CABasicAnimation *)scale:(NSNumber *)Multiple orgin:(NSNumber *)orginMultiple durTimes:(float)time Rep:(float)repeatTimes;
// 组合动画
+(CAAnimationGroup *)groupAnimation:(NSArray *)animationAry durTimes:(float)time Rep:(float)repeatTimes;
// 路径动画
+(CAKeyframeAnimation *)keyframeAniamtion:(CGMutablePathRef)path durTimes:(float)time Rep:(float)repeatTimes;
// 点移动
+(CABasicAnimation *)movepoint:(CGPoint )point;
// 旋转
+(CABasicAnimation *)rotation:(float)dur degree:(float)degree direction:(int)direction repeatCount:(int)repeatCount;

@end
