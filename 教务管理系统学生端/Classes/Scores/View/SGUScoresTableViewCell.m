//
//  SGUScoresTableViewCell.m
//  教务管理系统学生端
//
//  Created by 强淑婷 on 2019/5/28.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import "SGUScoresTableViewCell.h"
#import "SGUScoresModel.h"

@interface SGUScoresTableViewCell ()

@property (nonatomic, strong) UILabel *courseNameLabel;
@property (nonatomic, strong) UILabel *courseScoresLabel;
@property (nonatomic, strong) UILabel *coursePropertyLabel;
@property (nonatomic, strong) UILabel *courseCreditLabel;
@property (nonatomic, strong) UILabel *courseTeacherLabel;
@property (nonatomic, strong) UIView *backView;

@end
@implementation SGUScoresTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backView = [[UIView alloc] initWithFrame:CGRectMake(20, 5, k_screen_width - 40, 130)];
        _backView.backgroundColor = [UIColor colorWithRed:0.95f green:0.84f blue:0.91f alpha:1.00f];
        _backView.layer.cornerRadius = 10;
        _backView.layer.masksToBounds = YES;
        [self.contentView addSubview:_backView];
        
        self.courseNameLabel = [[UILabel alloc] init];
        [_backView addSubview:_courseNameLabel];
        
        self.courseScoresLabel = [[UILabel alloc] init];
        [_backView addSubview:_courseScoresLabel];
        
        self.coursePropertyLabel = [[UILabel alloc] init];
        [_backView addSubview:_coursePropertyLabel];
        
        self.courseCreditLabel = [[UILabel alloc] init];
        [_backView addSubview:_courseCreditLabel];
        
        self.courseTeacherLabel = [[UILabel alloc] init];
        [_backView addSubview:_courseTeacherLabel];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.courseNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView.mas_left).offset(10);
        make.top.equalTo(self.backView.mas_top).offset(5);
        make.width.mas_lessThanOrEqualTo(250);
        make.height.mas_equalTo(40);
    }];
    
    
    [self.courseScoresLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.backView.mas_right).offset(-5);
        make.top.equalTo(self.courseNameLabel.mas_top);
        make.width.mas_equalTo(90);
        make.height.mas_equalTo(40);
    }];
    
    
    [self.coursePropertyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.courseNameLabel.mas_left);
        make.top.equalTo(self.courseNameLabel.mas_bottom).offset(10);
        make.width.mas_lessThanOrEqualTo(@150);
        make.height.mas_equalTo(40);
    }];

    
    [self.courseCreditLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.courseScoresLabel.mas_left);
        make.top.equalTo(self.coursePropertyLabel.mas_top);
        make.width.mas_lessThanOrEqualTo(100);
        make.height.mas_equalTo(40);
    }];

    
    [self.courseTeacherLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.courseNameLabel.mas_left);
        make.top.equalTo(self.coursePropertyLabel.mas_bottom).offset(5);
        make.width.mas_lessThanOrEqualTo(@200);
        make.height.mas_equalTo(40);
    }];
}
- (void)reloadCellWithData:(id)data {
    self.courseNameLabel.text = [NSString stringWithFormat:@"课程名：%@", data[@"course_name"]];
    self.courseScoresLabel.text = [NSString stringWithFormat:@"成绩：%@", data[@"score"]];
    self.coursePropertyLabel.text = @"课程性质: 必修";
    self.courseCreditLabel.text = @"学分：6";
    self.courseTeacherLabel.text = @"任课教师：章虎冬";
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    
    // Configure the view for the selected state
}

@end
