//
//  SGUCourseChartsView.m
//  教务管理系统学生端
//
//  Created by 强淑婷 on 2019/4/29.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import "SGUCourseChartsView.h"
#import "SGUCourseChartsCollectionViewCell.h"

#define k_screen_width          [UIScreen mainScreen].bounds.size.width
// 屏幕物理尺寸高度
#define k_screen_height         [UIScreen mainScreen].bounds.size.height
static NSString *const courseCell1 = @"courseCell1";
static NSString *const courseCell2 = @"courseCell2";

@interface SGUCourseChartsView()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>



@end
@implementation SGUCourseChartsView
- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        
        _courseChartsCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(5, 5, k_screen_width - 10 , k_screen_height - 5) collectionViewLayout:layout];
        _courseChartsCollectionView.dataSource = self;
        _courseChartsCollectionView.backgroundColor = [UIColor whiteColor];
        _courseChartsCollectionView.layer.cornerRadius = 80;
        _courseChartsCollectionView.layer.masksToBounds = YES;
        
        [_courseChartsCollectionView registerClass:[SGUCourseChartsCollectionViewCell class] forCellWithReuseIdentifier:courseCell1];
        [_courseChartsCollectionView registerClass:[SGUCourseChartsCollectionViewCell class] forCellWithReuseIdentifier:courseCell2];
        
        [self addSubview:_courseChartsCollectionView];
    }
    return self;
}
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 6;
}
- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.section == 0) {
        SGUCourseChartsCollectionViewCell *cell = [_courseChartsCollectionView dequeueReusableCellWithReuseIdentifier:courseCell1 forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        NSArray *weekArray = [NSArray arrayWithObjects:@"    ",@"星期一\n5-6",@"星期二\n5-7", @"星期三\n5-8",@"星期四\n5-9",@"星期五\n5-10",nil];
        cell.courseLabel.text = weekArray[indexPath.row];
        cell.courseLabel.backgroundColor = [UIColor colorWithRed:0.37f green:1.00f blue:0.97f alpha:1.00f];
        return cell;
    } else {
        SGUCourseChartsCollectionViewCell *cell = [_courseChartsCollectionView dequeueReusableCellWithReuseIdentifier:courseCell2 forIndexPath:indexPath];
        cell.courseLabel.text = @"近代史（XXX老师）";
        if(indexPath.row == 0) {
            NSArray *courseSection = [NSArray arrayWithObjects:@"1-2节",@"3-4节",@"5-6节", @"7-8节",@"9-10节",nil];
            cell.courseLabel.text = courseSection[indexPath.section - 1];
            cell.courseLabel.backgroundColor = [UIColor colorWithRed:0.37f green:1.00f blue:0.97f alpha:1.00f];
        }
        
        return cell;
    }
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
