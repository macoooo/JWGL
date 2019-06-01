//
//  SGUCourseChartsCollectionViewCell.m
//  教务管理系统学生端
//
//  Created by 强淑婷 on 2019/5/6.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import "SGUCourseChartsCollectionViewCell.h"

@implementation SGUCourseChartsCollectionViewCell
- (instancetype) initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        self.courseLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.courseLabel];
        
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    _courseLabel.frame = self.contentView.frame;
    _courseLabel.textColor = [UIColor blackColor];
    //_courseLabel.backgroundColor = [UIColor whiteColor];
    _courseLabel.numberOfLines = 0;
    _courseLabel.textAlignment = NSTextAlignmentCenter;
    
}
@end
