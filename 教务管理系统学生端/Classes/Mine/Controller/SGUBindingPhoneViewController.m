//
//  SGUBindingPhoneViewController.m
//  教务管理系统学生端
//
//  Created by 强淑婷 on 2019/6/4.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import "SGUBindingPhoneViewController.h"
#import "SGUBindingPhoneView.h"

@interface SGUBindingPhoneViewController ()

@property (nonatomic, strong) SGUBindingPhoneView *bindingPhoneView;
@end

@implementation SGUBindingPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.bindingPhoneView = [[SGUBindingPhoneView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_bindingPhoneView];
    
    self.bindingPhoneView.sureBindingClick = ^(NSString *phone) {
        
    };
    // Do any additional setup after loading the view.
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
