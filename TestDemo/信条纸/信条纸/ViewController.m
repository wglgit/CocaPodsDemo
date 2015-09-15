//
//  ViewController.m
//  信条纸
//
//  Created by wgl7569 on 15-7-1.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import "ViewController.h"
#import "CustomStatusBar.h"
#import "信条纸-Bridging-Header.h"
#import "信条纸-swift.h"
#import "NSString+Additions.h"
#import "UITextField+ExtentRange.h"
@interface ViewController ()
{
    UITextField *moneyTextField;
    NSString *money;
    NSRange slectRange;
}

@end
typedef NS_ENUM(NSInteger, EMMS) {
   LSDFJKLAJDFKD
};
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
//    // Do any additional setup after loading the view, typically from a nib.、
    
    CGSize size = CGSizeMake(self.view.frame.size.width,26);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGFloat height = 26;
    CGContextAddRect(ctx,CGRectMake(0, 0, self.view.frame.size.width, height));
    [[UIColor brownColor]set];
    CGContextFillPath(ctx);
    
    
    CGFloat linWideth = 2;
    CGFloat lineY = height - linWideth;
    CGFloat lineX = 0;
    CGContextMoveToPoint(ctx, lineX, lineY);
    CGContextAddLineToPoint(ctx, 375, lineY);
    [[UIColor blackColor]set];
    CGContextStrokePath(ctx);
    
    UIImage *image  = UIGraphicsGetImageFromCurrentImageContext();
    UIColor *color = [UIColor colorWithPatternImage:image];
    self.view.backgroundColor = color;
    
    
    UIButton *btn =[ UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.frame = CGRectMake(100, 100, 40, 40);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(addBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    
//    CGSize size = CGSizeMake(self.view.frame.size.width, 35);
//    UIGraphicsBeginImageContextWithOptions(size , NO, 0);
//    
//    // 2.画矩形
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    CGFloat height = 35;
//    CGContextAddRect(ctx, CGRectMake(0, 0, self.view.frame.size.width, height));
//    [[UIColor whiteColor] set];
//    CGContextFillPath(ctx);
//    
//    // 3.画线条
//    
//    CGFloat lineWidth = 2;
//    CGFloat lineY = height - lineWidth;
//    CGFloat lineX = 0;
//    CGContextMoveToPoint(ctx, lineX, lineY);
//    CGContextAddLineToPoint(ctx, 375, lineY);
//    [[UIColor blackColor] set];
//    CGContextStrokePath(ctx);
//    
//    
//    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
//    UIColor *color=[UIColor colorWithPatternImage:image];
//    self.view.backgroundColor=color;
//    CustomStatusBar *cs = [[CustomStatusBar alloc]init];
//    [cs showStatusMessage:@"22222222"];
//    [self setRefreshWindow];
    
    
    moneyTextField = [[UITextField alloc]init];
    moneyTextField.backgroundColor = [UIColor orangeColor];
    moneyTextField.frame = CGRectMake(20, 30, 100, 40);
    moneyTextField.delegate = self;
    moneyTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:moneyTextField];
    money = @"100000";
    
}
- (NSString *)stringWithOutComma:(NSString *)commaString
{
    NSArray *array = [commaString componentsSeparatedByString:@","];
    return [array componentsJoinedByString:@""];
}
-(void)textFieldDidEndEditing:(UITextField *)textField{

}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    {
        NSMutableString *textFieldString = [NSMutableString stringWithString:textField.text];
        if ([string isEqualToString:@""])//如果string是空白的话代表删除一位
        {
            [textFieldString deleteCharactersInRange:NSMakeRange(range.location, 1)];
            NSMutableString *textString = [NSMutableString stringWithString:[self stringWithOutComma:textFieldString]];
            if (textString.length == 0)
            {
                [textString appendString:@"0"];
                moneyTextField.text = textString;
                NSRange range = [moneyTextField textRange];
                [moneyTextField setSlectRange:range];
                return NO;
            }
            NSRange rangel = [textString rangeOfString:@"."];
            if (rangel.location != NSNotFound)
            {
                NSArray *pointArray = [textString componentsSeparatedByString:@"."];
                NSString *pointString = pointArray[0];
                NSString *pointString1 = pointArray[1];
                if (pointString == nil || pointString.length == 0 || [pointString integerValue] == 0)
                {
                    textString = [NSMutableString stringWithFormat:@"0.%@",pointString1];
                }
            }
            else
            {
                textString = [NSMutableString stringWithFormat:@"%d",[textString intValue]];
            }
            slectRange = [moneyTextField textRange];
            moneyTextField.text = [NSString stringWithComma:textString];
            [moneyTextField setSlectRange:slectRange];

            return NO;
        }
        else
        {
            char aCharacter = [string characterAtIndex:0];
            //n (数字或小数点)
            if(!((aCharacter >= 48 && aCharacter <= 57) || aCharacter == 46))
            {//非数字或小数点
                return NO;
            }
            else if (aCharacter == 46 && [textFieldString rangeOfString:@"."].location != NSNotFound)
            {//小数点不能输入2次
                return NO;
            }
            else if (aCharacter != 46 && [textFieldString rangeOfString:@"."].location != NSNotFound)
            {//有小数点
                if (textFieldString.length - [textFieldString rangeOfString:@"."].location > 2 &&
                    range.location > [textFieldString rangeOfString:@"."].location)
                {//小数点后超2位
                    if ([textFieldString floatValue] == 0.00f){
                        moneyTextField.text = string;
                    }
                    if ([moneyTextField.text doubleValue] > [money doubleValue])
                    {
                        moneyTextField.text = [NSString stringWithComma:money];
                        return NO;
                    }
                    return NO;
                }
                else if ([textFieldString rangeOfString:@"."].location >= 10 && range.location <= [textFieldString rangeOfString:@"."].location)
                {//小数点前超8位
                    return NO;
                }
            }
            else if (aCharacter != 46 && [textFieldString rangeOfString:@"."].location == NSNotFound && textFieldString.length >= 10)
            {//小数点前最长8位
                return NO;
            }
            NSMutableString *textString = [NSMutableString stringWithString:[self stringWithOutComma:textFieldString]];
            if ([textString doubleValue] != 0.0f)
            {
                if ([string isEqualToString:@"."] && textFieldString.length - range.location > 2)
                {
                    return NO;
                }
                [textFieldString insertString:string atIndex:range.location];
                textString = [NSMutableString stringWithString:[self stringWithOutComma:textFieldString]];
                if ([textString doubleValue] > [money doubleValue])
                {
                    moneyTextField.text = [NSString stringWithComma:money];
                    return NO;
                }
                else
                {
                    NSRange rangel = [textString rangeOfString:@"."];
                    if (rangel.location != NSNotFound)
                    {
                        NSArray *pointArray = [textString componentsSeparatedByString:@"."];
                        NSString *pointString = pointArray[0];
                        NSString *pointString1 = pointArray[1];
                        textString = [NSMutableString stringWithFormat:@"%ld.%@",(long)[pointString integerValue],pointString1];
                    }
                    else
                    {
                        textString = [NSMutableString stringWithFormat:@"%ld",(long)[textString integerValue]];
                    }
                    
                    moneyTextField.text = [NSString stringWithComma:textString];
                    return NO;
                }
            }
            else
            {
                if ([string isEqualToString:@"."] || [textString rangeOfString:@"."].location != NSNotFound)
                {
                    [textString insertString:string atIndex:range.location];
                    if ([textString doubleValue] > [money doubleValue])
                    {
                        moneyTextField.text = [NSString stringWithComma:money];
                        return NO;
                    }
                    
                }
                else
                {
                    if (textString == nil || textString.length == 0)
                    {
                        moneyTextField.text = string;
                        if ([moneyTextField.text doubleValue] > [money doubleValue])
                        {
                            moneyTextField.text = [NSString stringWithComma:money];
                            return NO;
                        }
                        return NO;
                    }
                    else
                    {
                        [textString replaceCharactersInRange:NSMakeRange(0, 1) withString:string];
                        moneyTextField.text = textString;
                        if ([textString doubleValue] > [money doubleValue])
                        {
                            moneyTextField.text = [NSString stringWithComma:money];
                            return NO;
                        }
                        return NO;
                    }
                }
            }
        }
        return YES;
    }
}
-(void)addBtnAction{
    SwiftViewController *sv = [[SwiftViewController alloc]init];
    [self presentViewController:sv animated:YES completion:^{
        
    }];
}
-(void)setRefreshWindow{
    CGRect frame = CGRectMake(0.0, 0.0, 320.0, 20.0);
    UIWindow *statusbarWindow = [[UIWindow alloc] initWithFrame:frame];
    [statusbarWindow setBackgroundColor:[UIColor blackColor]];
    [statusbarWindow setWindowLevel:UIWindowLevelStatusBar+1.0f];
    
    // 添加自定义子视图
    UIImageView *customView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 0, 120, 18)];
    customView.image=[UIImage imageNamed:@"数据刷新栏.png"];
    
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(100, 0, 100, 20)];
    label.backgroundColor=[UIColor clearColor];
    label.text=@"数据正在刷新";
    [customView addSubview:label];
    [statusbarWindow addSubview:customView];
    [statusbarWindow makeKeyAndVisible];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
