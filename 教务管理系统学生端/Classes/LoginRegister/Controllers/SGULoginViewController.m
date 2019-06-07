//
//  SGULoginViewController.m
//  教务管理系统学生端
//
//  Created by 强淑婷 on 2019/4/29.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import "SGULoginViewController.h"
#import "SGUMineViewController.h"
#import "SGUCourseChartsViewController.h"
#import "SGUScoresViewController.h"
#import "SGUBaseTabBarController.h"
#import "SGULoginView.h"
#import "SGURegisterViewController.h"
#import "SGUVerifyViewController.h"

@interface SGULoginViewController ()

@property (nonatomic, strong) SGULoginView *loginView;
@end

@implementation SGULoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _userNameLoginString = [[NSString alloc] init];
    _pwdLoginString = [[NSString alloc] init];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.88f green:0.45f blue:0.53f alpha:1.00f];
    
    _loginView = [[SGULoginView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_loginView];
    
    typeof(self) weakSelf = self;
    self.loginView.loginCallBackBlock = ^(UIButton *button, NSString *name) {
        [weakSelf login];
    };
    self.loginView.registerCallBackBlock = ^(UIButton *button) {
        [weakSelf registered];
    };
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    
    
    // Do any additional setup after loading the view.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}
- (void)keyBoardWillShow:(NSNotification *)notification {
    CGFloat kbHeight = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].origin.y;
    CGFloat offset = kbHeight;
    //取得键盘的动画时间，这样可以在视图上移的时候更连贯、
    double duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    if (offset > 0) {
        [UIView animateWithDuration:duration animations:^{
            self.view.transform = CGAffineTransformMakeTranslation(0.0f, self.loginView.loginButton.origin.y - offset + 5);
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

- (void)login {
        NSDictionary *parameters = @{@"num":self.loginView.usersTextField.text,@"pwd":self.loginView.passwordTextField.text};
        NSLog(@"%@----parameters----", parameters);
        if([APIClient networkType] > 0) {
            [APIClient requestURL:@"http://203.195.193.218/es/login" httpMethod:GET contentType:nil params:parameters response:^(ApiRequestStatusCode requestStatusCode, id JSON) {
                switch (requestStatusCode) {
                    case ApiRequestOK:
                        
                        NSLog(@"%@---JSON----", JSON);
                        if([JSON[@"errCode"] isEqual:@101]) {
                            [self showAlertView:@"请输入合法信息" andMessage:@"请重新检查"];
                        } else if ([JSON[@"errCode"] isEqual:@2]) {
                            [self showAlertView:@"用户名或密码错误" andMessage:@"请重新检查"];

                        } else {
                            SGUCourseChartsViewController *courseViewController = [[SGUCourseChartsViewController alloc] init];
                            SGUScoresViewController *scoresViewController = [[SGUScoresViewController alloc] init];
                            SGUMineViewController *mineViewController = [[SGUMineViewController alloc] init];

                            NSMutableArray *viewControllerMutableArray = [NSMutableArray array];
                            [viewControllerMutableArray addObject:courseViewController];
                            [viewControllerMutableArray addObject:scoresViewController];
                            [viewControllerMutableArray addObject:mineViewController];

                            NSArray *titleArray = @[@"sgu_ic_course_tabBar",@"sgu_ic_scores_tabBar",@"sgu_ic_mine_tabBar"];
                            SGUBaseTabBarController *tabBarController = [[SGUBaseTabBarController alloc] init];
                            [tabBarController setCodeTabbarController:viewControllerMutableArray andviewControllerTitleMutableArray:titleArray];
                            [self presentViewController:tabBarController animated:YES completion:nil];
                        }
                        break;

                    default:
                        break;
                }

            }];
        }
//    SGUCourseChartsViewController *courseViewController = [[SGUCourseChartsViewController alloc] init];
//    SGUScoresViewController *scoresViewController = [[SGUScoresViewController alloc] init];
//    SGUMineViewController *mineViewController = [[SGUMineViewController alloc] init];
//    
//    NSMutableArray *viewControllerMutableArray = [NSMutableArray array];
//    [viewControllerMutableArray addObject:courseViewController];
//    [viewControllerMutableArray addObject:scoresViewController];
//    [viewControllerMutableArray addObject:mineViewController];
//    
//    NSArray *titleArray = @[@"sgu_ic_course_tabBar",@"sgu_ic_scores_tabBar",@"sgu_ic_mine_tabBar"];
//    SGUBaseTabBarController *tabBarController = [[SGUBaseTabBarController alloc] init];
//    [tabBarController setCodeTabbarController:viewControllerMutableArray andviewControllerTitleMutableArray:titleArray];
//    [self presentViewController:tabBarController animated:YES completion:nil];
    
}
- (void)registered {
//     SGURegisterViewController *registerViewController = [[SGURegisterViewController alloc] init];
//    registerViewController.returnValueBlock = ^(NSString *passedUserName, NSString *passedPassword) {
//        self.loginView.usersTextField.text = passedUserName;
//        self.loginView.passwordTextField.text = passedPassword;
//    };
//    [self presentViewController:registerViewController animated:NO completion:nil];
    SGUVerifyViewController *verifyViewController = [[SGUVerifyViewController alloc] init];
    [self presentViewController:verifyViewController animated:YES completion:nil];
}
//根据传参显示弹窗
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
