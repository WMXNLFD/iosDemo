//
//  RegisterViewController.m
//  ModelViewExercise
//
//  Created by ios_dev on 2020/5/28.
//  Copyright © 2020 ios_dev. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@property(weak, nonatomic)IBOutlet UITextField *txtUsername;

-(IBAction)save:(id)sender;
-(IBAction)cancel:(id)sender;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)save:(id)sender{
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"点击save按钮，关闭模态视图");
        
        NSDictionary *dataDict = @{@"username": self.txtUsername.text};
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"RegisterCompletionNotification" object:nil userInfo:dataDict];
    }];
}

- (void)cancel:(id)sender{
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"点击Cancel按钮，关闭模态视图");
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
