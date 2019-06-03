//
//  SGUScoresViewController.m
//  教务管理系统学生端
//
//  Created by 强淑婷 on 2019/4/29.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import "SGUScoresViewController.h"
#import "SGUScoresView.h"
#import "SGUScoresModel.h"

@interface SGUScoresViewController()

@property (nonatomic, strong) SGUScoresView *scoresView;
@property (nonatomic ,strong) NSString *semester;
@property (nonatomic, strong) NSString *year;
@end

@implementation SGUScoresViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationItem.title = @"成绩";
    
    self.scoresView = [[SGUScoresView alloc] initWithFrame:self.view.bounds];
    self.scoresView.tableView.delegate = self;
    [self.view addSubview:_scoresView];
    
    typeof(self) weakSelf = self;
    self.scoresView.selectCallBlock = ^(NSString *year, NSString *semester) {
        weakSelf.year = year;
        weakSelf.semester = semester;
        [weakSelf selectScores];
    };
    
    // Do any additional setup after loading the view.
}
- (void)selectScores {
    
    NSString *url = [NSString stringWithFormat:@"http://203.195.193.218/es/selScore?stuNum=%@&year=%@&semester=%@", @"04173011",self.year,self.semester];
    NSLog(@"%@--url----", url);
    //NSDictionary *parameters = @{@"stuName":@"04173011",@"year":self.scoresView.year,@"semester":self.scoresView.semester};
    if([APIClient networkType] > 0) {
        [APIClient requestURL:url httpMethod:GET contentType:nil params:nil response:^(ApiRequestStatusCode requestStatusCode, id JSON) {
            
            switch (requestStatusCode) {
                case ApiRequestOK:
                    if ([JSON isKindOfClass:NSClassFromString(@"NSDictionary")]) {
                        if ([JSON[@"errCode"] isEqual:@1]) {
                            [self showAlertView:@"你的信息已过期，请重新操作！" andMessage:nil];
                        } else if ([JSON[@"errCode"] isEqual:@500]) {
                            [self showAlertView:@"异常信息！" andMessage:nil];
                        }
                    } else {
                        self.scoresView.modelArray = [NSArray array];
                        self.scoresView.modelArray = JSON;
                        NSLog(@"%@", JSON);
                    }
                    break;
                    
                default:
                    break;
            }
        }];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 140;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 20;
    } else {
        return 0;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc] init];
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
