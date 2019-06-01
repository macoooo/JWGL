//
//  SGUScoresViewController.m
//  教务管理系统学生端
//
//  Created by 强淑婷 on 2019/4/29.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import "SGUScoresViewController.h"
#import "SGUScoresView.h"

@interface SGUScoresViewController()

@property (nonatomic, strong) SGUScoresView *scoresView;

@end

@implementation SGUScoresViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationItem.title = @"成绩";
    
    self.scoresView = [[SGUScoresView alloc] initWithFrame:self.view.bounds];
    self.scoresView.tableView.delegate = self;
    [self.view addSubview:_scoresView];
    // Do any additional setup after loading the view.
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 140;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
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
