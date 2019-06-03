//
//  SGURegisterViewController.m
//  教务管理系统学生端
//
//  Created by 强淑婷 on 2019/5/28.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import "SGURegisterViewController.h"
#import "SGURegisterView.h"

@interface SGURegisterViewController ()

@property (nonatomic, strong) SGURegisterView *registerView;
@property (nonatomic, copy) NSString *userNameString;
@property (nonatomic, copy)NSString *pwdString;
@property (nonatomic, copy) NSString *surePwdString;
@property (nonatomic, strong) NSDictionary *returnParameters;
@end

@implementation SGURegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.88f green:0.45f blue:0.53f alpha:1.00f];
    self.registerView = [[SGURegisterView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_registerView];
    
    self.userNameString = [[NSString alloc] init];
    self.pwdString = [[NSString alloc] init];
    self.surePwdString = [[NSString alloc] init];
    self.returnParameters = [[NSDictionary alloc] init];
    
    typeof(self) weakSelf = self;
    self.registerView.sureRgCallBackBlock = ^(UIButton *button, NSString *userName, NSString *pwd, NSString *surePwd) {
        weakSelf.userNameString = userName;
        weakSelf.pwdString = pwd;
        weakSelf.surePwdString = surePwd;
        [weakSelf sureRgPwd];
    };
    
    
    self.registerView.cancelRgCallBackBlock = ^(UIButton *button) {
        
        [weakSelf dismissViewControllerClass:NSClassFromString(@"SGULoginViewController")];
    };
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)keyBoardWillShow:(NSNotification *)notification {
    CGFloat kbHeight = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].origin.y;
    CGFloat offset = kbHeight;
    //取得键盘的动画时间，这样可以在视图上移的时候更连贯、
    double duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    if (offset > 0) {
        [UIView animateWithDuration:duration animations:^{
            self.view.transform = CGAffineTransformMakeTranslation(0.0f, self.registerView.cancelButton.origin.y - offset + 5);
        }];
    }
}
#pragma mark --- 当键盘消失后，视图需要恢复原状
- (void)keyBoardWillHide:(NSNotification *)notify {
    double duration = [[notify.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    //视图下移恢复原状
    [UIView animateWithDuration:duration animations:^{
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }];
}
- (void)sureRgPwd {
    NSString *url = @"http://203.195.193.218/es/enSurePwd";
    NSDictionary *parameters = @{@"pwd1":self.pwdString,@"pwd2":self.surePwdString};
    
    if([APIClient networkType] > 0) {
        [APIClient requestURL:url httpMethod:GET contentType:nil params:parameters response:^(ApiRequestStatusCode requestStatusCode, id JSON) {
            switch (requestStatusCode) {
                case ApiRequestOK:{
                    if ([JSON[@"errCode"] isEqual:@0]) {
                        [self showSureRgAlertView];
                    } else if ([JSON[@"errCode"] isEqual:@2]) {
                        [self showAlertView:@"密码不一致！" andMessage:nil];
                    } else if ([JSON[@"errCode"] isEqual:@2]) {
                        [self showAlertView:@"你的信息已过期，请重新操作" andMessage:nil];
                    } else if ([JSON[@"errCode"] isEqual:@2]) {
                        [self showAlertView:@"请不要输入空值！！！" andMessage:nil];
                    }
                    
                    break;
                }
                case ApiRequestError:
                    break;
                case ApiRequestNotReachable:
                    break;
                default:
                    break;
            }
        }];
    }
}
- (void)getData:(id)sender {
    NSDictionary *returnParameters = (NSDictionary *)sender;
    self.returnParameters = returnParameters;
}
- (BOOL)isEqualPassword:(NSString *)pwd andsurePwd:(NSString *)surePwd{
    if([pwd isEqualToString:surePwd]) {
        return YES;
    }
    return NO;
}
- (void)showAlertView:(NSString *)title andMessage:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}
- (void)showSureRgAlertView {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"修改成功" message:@"耶" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (self.returnValueBlock) {
            self.returnValueBlock(self.userNameString, self.pwdString);
        }
        [self dismissViewControllerClass:NSClassFromString(@"SGULoginViewController")];
    }];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}
- (void)dismissViewControllerClass:(Class)class {
    UIViewController *vc = self;
    while (![vc isKindOfClass:class] && vc != nil) {
        vc = vc.presentingViewController;
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController *)vc).viewControllers.lastObject;
        }
    }
    [vc dismissViewControllerAnimated:YES completion:nil];
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
