//
//  ViewController.m
//  开关控件分段控件滑块控件
//
//  Created by ios_dev on 2020/5/29.
//  Copyright © 2020 ios_dev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(strong, nonatomic) UISwitch *rightSwitch;
@property(strong, nonatomic) UISwitch *leftSwitch;
@property(strong, nonatomic) UILabel *sliderValue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    //1.添加rightSwitch控件
    //边距
    CGFloat switchScreenSpace = 39;
    
    self.rightSwitch = [[UISwitch alloc] init];
    CGRect frame = self.rightSwitch.frame;
    frame.origin = CGPointMake(switchScreenSpace, 98);
    //重新设置控件状态
    self.rightSwitch.frame = frame;
    //设置控件状态
    self.rightSwitch.on = TRUE;
    //指定事件处理方式
    [self.rightSwitch addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.rightSwitch];
    
    //2.添加leftSwitch
    self.leftSwitch = [[UISwitch alloc] init];
    frame = self.leftSwitch.frame;
    frame.origin = CGPointMake(screen.size.width - (frame.size.width + switchScreenSpace), 98);
    //重新设置控件的位置
    self.leftSwitch.frame = frame;
    //设置控件状态
    self.leftSwitch.on = TRUE;
    //指定事件处理方法
    [self.leftSwitch addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_leftSwitch];
    
    //3.添加segmentedControl控件
    NSArray *segments = @[@"Right", @"Left"];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:segments];
    
    CGFloat scWidth = 220;
    CGFloat scHeight = 29;
    CGFloat scTopView = 186;
    segmentedControl.frame = CGRectMake((screen.size.width - scWidth)/2, scTopView, scWidth, scHeight);
    //重新设置控件的位置
//    segmengtedControl.frame = frame;
    //指定事件处理方法
    [segmentedControl addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventValueChanged];
        
    [self.view addSubview:segmentedControl];
    
    //4.添加slider控件
    CGFloat sliderWidth = 300;
    CGFloat sliderHeight = 31;
    CGFloat sliderTopView = 298;
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake((screen.size.width - sliderWidth)/2, sliderTopView, sliderWidth, sliderHeight)];
    
    slider.minimumValue = 0.0f;
    slider.maximumValue = 100.0f;
    slider.value = 50.00f;
    
    //指定时间处理方法
    [slider addTarget:self action:@selector(sliderValueChange:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:slider];
}

-(void)switchValueChanged:(id)sender{
    UISwitch *witchSwitch = sender;
    BOOL setting = witchSwitch.isOn;
    [self.leftSwitch setOn:setting animated:TRUE];
    [self.rightSwitch setOn:setting animated:TRUE];
}

-(void)touchDown:(id)sender{
    
    UISegmentedControl *segmentControl = (UISegmentedControl *)sender;
    NSLog(@"选择的段： %li", segmentControl.selectedSegmentIndex);
    
    if(self.leftSwitch.hidden){
        self.rightSwitch.hidden = FALSE;
        self.leftSwitch.hidden = FALSE;
    }else{
        self.leftSwitch.hidden = TRUE;
        self.rightSwitch.hidden = TRUE;
    }
}

-(void)sliderValueChange:(id)sender{
    UISlider *slider = sender;
    int progressAsInt = slider.value;
    NSString *newText = [[NSString alloc]initWithFormat:@"%d", progressAsInt];
    NSLog(@"滑块的值 : “%@", newText);
    self.sliderValue.text = newText;
}

@end
