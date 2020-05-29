//
//  ViewController.m
//  标签与按钮
//
//  Created by ios_dev on 2020/5/29.
//  Copyright © 2020 ios_dev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(strong, nonatomic) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat labelWidth = 90;
    CGFloat labelHeight = 20;
    CGFloat labelTopView = 150;
    CGRect labelFrame = CGRectMake((screen.size.width - labelWidth)/2, labelTopView, labelWidth, labelHeight);
    
    self.label = [[UILabel alloc] initWithFrame: labelFrame];
    
    self.label.text = @"nihao";
    //字体左右居中
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.label];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"OK" forState:UIControlStateNormal];
    
    CGFloat buttonWidth = 60;
    CGFloat buttonHeight = 20;
    CGFloat buttonTopView = 240;
    
    button.frame = CGRectMake((screen.size.width - buttonWidth)/2, buttonTopView, buttonWidth, buttonHeight);
    
    //添加点击事件
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

-(void)onClick:(id)sender{
    NSLog(@"button点击事件");
    self.label.text = @"HelloWord!";
}


@end
