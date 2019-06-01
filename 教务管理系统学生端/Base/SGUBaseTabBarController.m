//
//  SGUBaseTabBarController.m
//  教务管理系统学生端
//
//  Created by 强淑婷 on 2019/4/29.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import "SGUBaseTabBarController.h"

@interface SGUBaseTabBarController ()

@end

@implementation SGUBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setCodeTabbarController:(NSMutableArray *)viewControllerMutableArray andviewControllerTitleMutableArray:(NSArray *)titleMutableArray{
    NSMutableArray *allNavigationController = [NSMutableArray array];
    for(int i = 0;i < viewControllerMutableArray.count; i++) {
        UINavigationController *everyNavigationController = [[UINavigationController alloc]initWithRootViewController:viewControllerMutableArray[i]];
        everyNavigationController.tabBarItem.image = [UIImage imageNamed:titleMutableArray[i]];
        everyNavigationController.tabBarItem.selectedImage= [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",titleMutableArray[i]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        [allNavigationController addObject:everyNavigationController];
    }
    self.viewControllers = allNavigationController;
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
