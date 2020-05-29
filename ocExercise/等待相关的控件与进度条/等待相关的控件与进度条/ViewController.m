//
//  ViewController.m
//  等待相关的控件与进度条
//
//  Created by ios_dev on 2020/5/29.
//  Copyright © 2020 ios_dev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UIActivityIndicatorView* activityIndicatorView;
@property (nonatomic, strong) UIProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    
    CGRect screen = [[UIScreen mainScreen]bounds];
    
    //1.获得指示器
    self.activityIndicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    CGRect frame = self.activityIndicatorView.frame;
    frame.origin = CGPointMake((screen.size.width - frame.size.width)/2, 84);
    //重新设置控件的位置
    self.activityIndicatorView.frame = frame;
    
    self.activityIndicatorView.hidesWhenStopped = false;
    [self.view addSubview:self.activityIndicatorView];
    
    //2.Upload按钮
    UIButton *buttonUpload = [UIButton buttonWithType:UIButtonTypeSystem];
    [buttonUpload setTitle:@"Upload" forState:UIControlStateNormal];
    
    CGFloat buttonUploadWidth = 50;
    CGFloat buttonUploadHeight = 30;
    CGFloat buttonUploadTopView = 190;
    
    buttonUpload.frame = CGRectMake((screen.size.width - buttonUploadWidth)/2, buttonUploadTopView, buttonUploadWidth, buttonUploadHeight);
    
    [buttonUpload addTarget:self action:@selector(startToMove:) forControlEvents:UIControlEventTouchUpInside];
    
    //指定事件处理方法
    [self.view addSubview:buttonUpload];
}

-(void)atartToMove:(id)sender{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(download) userInfo:nil repeats:TRUE];
}

-(void)download{
    self.progressView.progress = self.progressView.progress + 0.2;
    if(self.progressView.progress == 1.0){
        [self.timer invalidate];
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"download completed!" message:@"haha" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击ok按钮！！！");
        }];
        
        [alertController addAction:okAction];
        //显示
        [self presentViewController:alertController animated:true completion:^{
            NSLog(@"这不知道是显示什么");
        }];
    }
}


@end
