//
//  ViewController.m
//  TextField和TextView
//
//  Created by ios_dev on 2020/5/29.
//  Copyright © 2020 ios_dev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    CGFloat textFieldWidth = 223;
    CGFloat textFieldHeight = 30;
    CGFloat textFieldTopView = 150;
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake((screen.size.width - textFieldWidth)/2, textFieldTopView, textFieldWidth, textFieldHeight)];
    
    //文本框属性
    textField.borderStyle = UITextBorderStyleRoundedRect;
    //文本委托
    textField.delegate = self;
    
    [self.view addSubview:textField];
    
    //labelName 标签与textField 之间的距离
    CGFloat labelNameTextFieldSpace = 30;
    UILabel *labelName = [[UILabel alloc]initWithFrame:CGRectMake(textField.frame.origin.x, textField.frame.origin.y - labelNameTextFieldSpace, 51, 21)];
    labelName.text = @"Name:";
    [self.view addSubview:labelName];
    
    CGFloat textViewWidth = 236;
    CGFloat textViewHeight = 198;
    CGFloat textViewTopView = 240;
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake((screen.size.width - textViewWidth)/2, textViewTopView, textViewWidth, textViewHeight)];
    
    textView.text = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.";
    
    textView.delegate = self;
    
    [self.view addSubview:textView];
    
    //labelAbstract标签与textView之间的距离
    CGFloat labelAbstractTextViewSpace = 30;
    UILabel *labelAbstract = [[UILabel alloc]initWithFrame:CGRectMake(textView.frame.origin.x, textView.frame.origin.y - labelAbstractTextViewSpace, 103, 21)];
    
    labelAbstract.text = @"Abstract:";
    [self.view addSubview:labelAbstract];
    
}

#pragma mark - 实现UITextFieldDelegate委托协议方法
-(BOOL)textFieldShouldReturn:(UITextView *)textField{
    NSLog(@"TextField获得焦点，点击return建");
    //失去第一响应者 隐藏键盘
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - 实现UITextViewDelegate委托协议方法
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(nonnull NSString *)text{
    if([text isEqualToString:@"\n"]){
        NSLog(@"TextView获得焦点，点击returdn键");
        //失去第一响应者 隐藏键盘
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}


@end
