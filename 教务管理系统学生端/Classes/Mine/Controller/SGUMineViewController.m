//
//  SGUMineViewController.m
//  教务管理系统学生端
//
//  Created by 强淑婷 on 2019/4/29.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import "SGUMineViewController.h"
#import "SGUMineView.h"
#import "SGUBindingPhoneViewController.h"
#import "SGUPersonMessageViewController.h"

@interface SGUMineViewController ()<UITableViewDelegate>

@property (nonatomic, strong) SGUMineView *mineView;
@end

@implementation SGUMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationItem.title = @"我的";
    
    self.mineView = [[SGUMineView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_mineView];
    _mineView.tableView.delegate = self;
    // Do any additional setup after loading the view.
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] init];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc] init];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        return 100;
    } else {
        return 60;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return  0.0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            SGUBindingPhoneViewController *phoneViewController = [[SGUBindingPhoneViewController alloc] init];
            [self.navigationController pushViewController:phoneViewController animated:YES];
        } else if (indexPath.row == 1) {
            SGUPersonMessageViewController *personMessageViewController = [[SGUPersonMessageViewController alloc] init];
            [self.navigationController pushViewController:personMessageViewController animated:YES];
        }
        
    } else if (indexPath.section == 0) {
        SGUPersonMessageViewController *personMessageViewController = [[SGUPersonMessageViewController alloc] init];
        [self.navigationController pushViewController:personMessageViewController animated:YES];
    }
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
