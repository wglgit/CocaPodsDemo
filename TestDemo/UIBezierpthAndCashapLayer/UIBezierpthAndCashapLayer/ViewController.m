//
//  ViewController.m
//  UIBezierpthAndCashapLayer
//
//  Created by wgl7569 on 15-7-3.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//
#import "WGLCircleProgressView.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIView *ui_View = [[UIView alloc]initWithFrame:CGRectMake(30, 30, 200, 200)];
    [ui_View setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:ui_View];
    
//    [ui_View.layer addAnimation:[self opacityForever_Animation:1] forKey:nil];
    [ui_View.layer addAnimation:[self moveX:2 X:[NSNumber numberWithFloat:100]] forKey:nil];
    
    
    
    
//    WGLCircleProgressView *pregress = [[WGLCircleProgressView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
//    [self.view addSubview:pregress];
//    pregress.trackColor = [UIColor blackColor];
//    pregress.pressColor = [UIColor redColor];
//    pregress.press = .7;
//    pregress.pressWith = 10;
    
    
    //好神奇的  圆角 伸缩
//    CABasicAnimation *anim2 = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
//    anim2.duration = 1.f;
//    anim2.fromValue = [NSNumber numberWithFloat:0.f];
//    anim2.toValue = [NSNumber numberWithFloat:100.f];
//    anim2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    anim2.repeatCount = CGFLOAT_MAX;
//    anim2.autoreverses = YES;
//    [self.view.layer addAnimation:anim2 forKey:@"cornerRadius"];

    
//    CABasicAnimation *pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    pulse.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
//    pulse.duration = 0.5 + (rand() % 10) * 0.05;
//    pulse.repeatCount = 1;
//    pulse.autoreverses = YES;
//    pulse.fromValue = [NSNumber numberWithFloat:.8];
//    pulse.toValue = [NSNumber numberWithFloat:1.2];
//    [ui_View.layer addAnimation:pulse forKey:nil];
    
    
//    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"bounds"];
//    anim.duration = 1.f;
//    anim.fromValue = [NSValue valueWithCGRect:CGRectMake(0,0,10,10)];
//    anim.toValue = [NSValue valueWithCGRect:CGRectMake(10,10,200,200)];
//    anim.byValue  = [NSValue valueWithCGRect:ui_View.bounds];
//    //    anim.toValue = (id)[UIColor redColor].CGColor;
//    //    anim.fromValue =  (id)[UIColor blackColor].CGColor;
//    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    anim.repeatCount = 1;
//    anim.autoreverses = YES;
//    
//    [ui_View.layer addAnimation:anim forKey:nil];
    
    
    
//    CABasicAnimation *anim2 = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
//    anim2.duration = 1.f;
//    anim2.fromValue = [NSNumber numberWithFloat:0.f];
//    anim2.toValue = [NSNumber numberWithFloat:20.f];
//    anim2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    anim2.repeatCount = CGFLOAT_MAX;
//    anim2.autoreverses = YES;
//    
//    [ui_View.layer addAnimation:anim2 forKey:@"cornerRadius"];

    
//    [ui_View.layer setShadowOffset:CGSizeMake(2,2)];
//    [ui_View.layer setShadowOpacity:1];
//    [ui_View.layer setShadowColor:[UIColor grayColor].CGColor];
//    //
//    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"shadowColor"];
//    anim.duration = 1.f;
//    anim.toValue = (id)[UIColor redColor].CGColor;
//    anim.fromValue =  (id)[UIColor blackColor].CGColor;
//    
//    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    anim.repeatCount = CGFLOAT_MAX;
//    anim.autoreverses = YES;
//    
//    [ui_View.layer addAnimation:anim forKey:nil];

    //没看到效果
//    CABasicAnimation *_anim = [CABasicAnimation animationWithKeyPath:@"shadowOffset"];
//    _anim.duration = 1.f;
//    ui_View.layer.shadowColor = [UIColor blackColor].CGColor;
//    _anim.fromValue = [NSValue valueWithCGSize:CGSizeMake(0,0)];
//    _anim.toValue = [NSValue valueWithCGSize:CGSizeMake(10,10)];
//    
//    _anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    _anim.repeatCount = CGFLOAT_MAX;
//    _anim.autoreverses = YES;
//    
//    [ui_View.layer addAnimation:_anim forKey:nil];
    
    
//    CABasicAnimation *_anim1 = [CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
//    _anim1.duration = 1.f;
//    _anim1.fromValue = [NSNumber numberWithFloat:0.5];
//    _anim1.toValue = [NSNumber numberWithFloat:1];
//    
//    _anim1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    _anim1.repeatCount = CGFLOAT_MAX;
//    _anim1.autoreverses = YES;
//    
//    [ui_View.layer addAnimation:_anim1 forKey:nil];
    
    
    
//    CABasicAnimation *_anim2 = [CABasicAnimation animationWithKeyPath:@"shadowRadius"];
//    _anim2.duration = 1.f;
//    _anim2.fromValue = [NSNumber numberWithFloat:10];
//    _anim2.toValue = [NSNumber numberWithFloat:5];
//    
//    _anim2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    _anim2.repeatCount = CGFLOAT_MAX;
//    _anim2.autoreverses = YES;
//    
//    [ui_View.layer addAnimation:_anim2 forKey:nil];
    
    // Do any additional setup after loading the view, typically from a nib.
}
//几个可以用来实现热门APP应用PATH中menu效果的几个方法

-(CABasicAnimation *)opacityForever_Animation:(float)time //永久闪烁的动画

{
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    
    animation.fromValue=[NSNumber numberWithFloat:1.0];
    
    animation.toValue=[NSNumber numberWithFloat:0.0];
    
    animation.autoreverses=YES;
    
    animation.duration=time;
    
    animation.repeatCount=FLT_MAX;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    return animation;
    
}
-(CABasicAnimation *)moveX:(float)time X:(NSNumber *)x //横向移动

{
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    
    animation.toValue=x;
    
    animation.duration=time;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    return animation;
    
}
+(CABasicAnimation *)moveY:(float)time Y:(NSNumber *)y //纵向移动

{
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    
    animation.toValue=y;
    
    animation.duration=time;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    return animation;
    
}



+(CABasicAnimation *)scale:(NSNumber *)Multiple orgin:(NSNumber *)orginMultiple durTimes:(float)time Rep:(float)repeatTimes //缩放

{
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    animation.fromValue=orginMultiple;
    
    animation.toValue=Multiple;
    
    animation.duration=time;
    
    animation.autoreverses=YES;
    
    animation.repeatCount=repeatTimes;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    return animation;
    
}



+(CAAnimationGroup *)groupAnimation:(NSArray *)animationAry durTimes:(float)time Rep:(float)repeatTimes //组合动画

{
    
    CAAnimationGroup *animation=[CAAnimationGroup animation];
    
    animation.animations=animationAry;
    
    animation.duration=time;
    
    animation.repeatCount=repeatTimes;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    return animation;
    
}



+(CAKeyframeAnimation *)keyframeAniamtion:(CGMutablePathRef)path durTimes:(float)time Rep:(float)repeatTimes //路径动画

{
    
    CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    animation.path=path;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    animation.autoreverses=NO;
    
    animation.duration=time;
    
    animation.repeatCount=repeatTimes;
    
    return animation;
    
}



+(CABasicAnimation *)movepoint:(CGPoint )point //点移动

{
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.translation"];
    
    animation.toValue=[NSValue valueWithCGPoint:point];
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    return animation;
    
}



+(CABasicAnimation *)rotation:(float)dur degree:(float)degree direction:(int)direction repeatCount:(int)repeatCount //旋转

{
    
    CATransform3D rotationTransform  = CATransform3DMakeRotation(degree, 0, 0,direction);
    
    CABasicAnimation* animation;
    
    animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    
    
    animation.toValue= [NSValue valueWithCATransform3D:rotationTransform];
    
    animation.duration= dur;
    
    animation.autoreverses= NO;
    
    animation.cumulative= YES;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    animation.repeatCount= repeatCount; 
    
    animation.delegate= self;
    
    
    
    return animation;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
