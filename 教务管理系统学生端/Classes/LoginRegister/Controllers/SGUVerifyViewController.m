//
//  SGUVerifyViewController.m
//  教务管理系统学生端
//
//  Created by 强淑婷 on 2019/6/3.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import "SGUVerifyViewController.h"
#import "SGUVerifyView.h"
#import "SGURegisterViewController.h"

@interface SGUVerifyViewController ()
@property (nonatomic, strong) SGUVerifyView *verifyView;
@property (nonatomic, copy) NSString *phoneNumString;
@property (nonatomic, copy) NSString *vertifyWordString;
@end

@implementation SGUVerifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.88f green:0.45f blue:0.53f alpha:1.00f];
    
    self.verifyView = [[SGUVerifyView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_verifyView];
    
    typeof(self) weakSelf = self;
    self.verifyView.sureVerifyCallBackBlock = ^(UIButton *button, NSString *vertifyWordString) {
        weakSelf.vertifyWordString = vertifyWordString;
        [weakSelf sureChange];
    };
    self.verifyView.cancelCallBackBlock = ^(UIButton *button) {
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    };
    self.verifyView.sendCallBlock = ^(UIButton *button, NSString *phoneNumber) {
        weakSelf.phoneNumString = phoneNumber;
        [weakSelf sureSend];
    } ;
    // Do any additional setup after loading the view.
}
- (void)sureChange {
    NSString *url = [NSString stringWithFormat:@"http://203.195.193.218/es/checkValidCode?validCode=%@",self.vertifyWordString];
    
    if ([APIClient networkType] > 0) {
        [APIClient requestURL:url httpMethod:GET contentType:nil params:nil response:^(ApiRequestStatusCode requestStatusCode, id JSON) {
            switch (requestStatusCode) {
                case ApiRequestOK:
                    if ([JSON[@"errCode"] isEqual:@0]) {
                        SGURegisterViewController *registerViewController = [[SGURegisterViewController alloc] init];
                        [self presentViewController:registerViewController animated:YES completion:nil];
                    } else if ([JSON[@"errCode"] isEqual:@1]){
                        [self showAlertView:@"验证码错误！" andMessage:nil];
                    } else if ([JSON[@"errCode"] isEqual:@101]){
                        [self showAlertView:@"请不要输入空值！！！" andMessage:nil];
                    }
                    break;
                    
                default:
                    break;
            }
        }];
    }
    
    
}
- (void)sureSend {
    NSString *param = [NSString stringWithFormat:@"http://203.195.193.218/es/getValidCode?tel=%@",self.phoneNumString];
    NSLog(@"%@", self.phoneNumString);
    if ([APIClient networkType] > 0) {
        [APIClient requestURL:param httpMethod:GET contentType:nil params:nil response:^(ApiRequestStatusCode requestStatusCode, id JSON) {
            switch (requestStatusCode) {
                case ApiRequestOK:
                    if ([JSON[@"errCode"] isEqual:@0]) {
                        self.verifyView.sendButton.backgroundColor = [UIColor lightGrayColor];
                    } else if ([JSON[@"errCode"] isEqual:@1]){
                        [self showAlertView:@"请输入正确的电话号码" andMessage:nil];
                    } else if ([JSON[@"errCode"] isEqual:@2]){
                        [self showAlertView:@"你操作的太频繁了！" andMessage:nil];
                    } else if ([JSON[@"errCode"] isEqual:@101]){
                        [self showAlertView:@"请不要输入空值！！！" andMessage:nil];
                    }
                    break;
                    
                default:
                    break;
            }
        }];
    }
    
}
- (void)showAlertView:(NSString *)title andMessage:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
