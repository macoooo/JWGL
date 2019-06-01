//
//  SGUCourseChartsViewController.m
//  教务管理系统学生端
//
//  Created by 强淑婷 on 2019/4/29.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import "SGUCourseChartsViewController.h"
#import "SGUCourseChartsView.h"
// 屏幕物理尺寸宽度
#define k_screen_width          [UIScreen mainScreen].bounds.size.width
// 屏幕物理尺寸高度
#define k_screen_height         [UIScreen mainScreen].bounds.size.height

@interface SGUCourseChartsViewController ()<UICollectionViewDelegate>

@property (nonatomic, strong) SGUCourseChartsView *courseChartsView;
@end

@implementation SGUCourseChartsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationItem.title = @"课表";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _courseChartsView = [[SGUCourseChartsView alloc] initWithFrame:self.view.bounds];
    _courseChartsView.courseChartsCollectionView.delegate = self;
    [self.view addSubview:_courseChartsView];
    
    // Do any additional setup after loading the view.
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger num = 6;
    CGFloat width = (CGRectGetWidth(collectionView.bounds) - 20)/num;
    CGFloat height1 = 50.0;
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
