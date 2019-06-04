//
//  SGUCourseChartsViewController.m
//  教务管理系统学生端
//
//  Created by 强淑婷 on 2019/4/29.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import "SGUCourseChartsViewController.h"
#import "SGUCourseChartsView.h"
#import "SGUCourseChartsModel.h"
// 屏幕物理尺寸宽度
#define k_screen_width          [UIScreen mainScreen].bounds.size.width
// 屏幕物理尺寸高度
#define k_screen_height         [UIScreen mainScreen].bounds.size.height

@interface SGUCourseChartsViewController ()<UICollectionViewDelegate>

@property (nonatomic, strong) SGUCourseChartsView *courseChartsView;

@property (nonatomic ,copy) NSString *semester;
@property (nonatomic, copy) NSString *year;
@end

@implementation SGUCourseChartsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationItem.title = @"课表";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _courseChartsView = [[SGUCourseChartsView alloc] initWithFrame:self.view.bounds];
    _courseChartsView.courseChartsCollectionView.delegate = self;
    [self.view addSubview:_courseChartsView];
    
    [self updateCourseCharts];
    // Do any additional setup after loading the view.
}
- (void)updateCourseCharts {
    self.year = @"2019";
    self.semester = @"2";
    NSString *url = [NSString stringWithFormat:@"http://203.195.193.218/es/selCourse?stuNum=%@&year=%@&semester=%@", @"04173011",self.year,self.semester];
    NSLog(@"%@--url----", url);
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
                        NSArray *array = [NSArray array];
                        array = JSON;
                        
                        NSMutableArray *equalSectionArray = [NSMutableArray arrayWithObjects:@"1",@"1",@"1",@"1",@"1",nil];
                        NSMutableArray *secondArray = [NSMutableArray arrayWithObjects:@"1",@"1",@"1",@"1",@"1",nil];
                        NSMutableArray *thirdArray = [NSMutableArray arrayWithObjects:@"1",@"1",@"1",@"1",@"1",nil];
                        NSMutableArray *fourthArray = [NSMutableArray arrayWithObjects:@"1",@"1",@"1",@"1",@"1",nil];
                        NSMutableArray *fifthArray = [NSMutableArray arrayWithObjects:@"1",@"1",@"1",@"1",@"1",nil];
                        for (int i = 0; i < array.count; i++) {
                            NSDictionary *dic = [NSDictionary dictionary];
                            dic = array[i];
                            SGUCourseChartsModel *model = [[SGUCourseChartsModel alloc] initWithDictionary:dic error:nil];
                            NSLog(@"%@--model", model);
                            if ([[model startTime] isEqualToString:@"08:00:00"]) {
                                //[equalSectionArray insertObject:model atIndex:[model weekday] - 1];
                                [equalSectionArray replaceObjectAtIndex:[model weekday] - 1 withObject:model];
                            } else if ([[model startTime] isEqualToString:@"10:30:00"]) {
                                [secondArray replaceObjectAtIndex:[model weekday] - 1 withObject:model];
                            } else if ([[model startTime] isEqualToString:@"14:30:00"]) {
                                [thirdArray replaceObjectAtIndex:[model weekday] - 1 withObject:model];
                            } else if ([[model startTime] isEqualToString:@"16:30:42"]) {
                                [fourthArray replaceObjectAtIndex:[model weekday] - 1 withObject:model];
                            } else if ([[model startTime] isEqualToString:@"19:00:00"]) {
                                [fifthArray replaceObjectAtIndex:[model weekday] - 1 withObject:model];
                            }
                        }
                        NSLog(@"%@--equalSectionArray", equalSectionArray);
                        NSMutableArray *allModelArray = [NSMutableArray array];
                        [allModelArray addObject:equalSectionArray];
                        [allModelArray addObject:secondArray];
                        [allModelArray addObject:thirdArray];
                        [allModelArray addObject:fourthArray];
                        [allModelArray addObject:fifthArray];
                        self.courseChartsView.modelArray = [NSArray array];
                        self.courseChartsView.modelArray = [allModelArray copy];

                        dispatch_async(dispatch_get_main_queue(), ^{
                            [self.courseChartsView.courseChartsCollectionView reloadData];
                        });
                        NSLog(@"%@--self.courseChartsView.modelArray---", self.courseChartsView.modelArray);
                    }
                    break;
                    
                default:
                    break;
            }
        }];
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger num = 6;
    CGFloat width = (CGRectGetWidth(collectionView.bounds) - 20)/num;
    CGFloat height1 = 60.0;
    CGFloat height2 = 120;
    
    if(indexPath.row == 0){
        //第一列的width比其他列稍大一些，消除item之间的间隙
        CGFloat realWidth = CGRectGetWidth(collectionView.bounds) - floor(width) * (num - 1);
        if(indexPath.section == 0) {
            return CGSizeMake(realWidth, height1);
        } else {
            return CGSizeMake(realWidth, height2);
        }
    }else{
        if(indexPath.section == 0) {
            return CGSizeMake(floor(width), height1);
        } else {
            return CGSizeMake(floor(width), height2);
        }
    }
}
//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
//设置每个item的垂直间距
-(CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
//设置每个item的水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
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
