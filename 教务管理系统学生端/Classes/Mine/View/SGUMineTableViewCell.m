//
//  SGUMineTableViewCell.m
//  教务管理系统学生端
//
//  Created by 强淑婷 on 2019/5/29.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

static CGFloat kMargin = 5;
#import "SGUMineTableViewCell.h"

@interface SGUMineTableViewCell()
@property (nonatomic, strong) UIButton *avatarImageButton;
@property (nonatomic, strong) UILabel *nickNameLabel;
@property (nonatomic, strong) UILabel *signLabel;

@end

@implementation SGUMineTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.avatarImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_avatarImageButton];
        
        self.nickNameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_nickNameLabel];
        
        self.signLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_signLabel];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.avatarImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(kMargin);
        make.top.equalTo(self.contentView.mas_top).offset(3 * kMargin);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    self.avatarImageButton.layer.cornerRadius = 25;
    self.avatarImageButton.layer.masksToBounds = YES;
    [self.avatarImageButton setImage:[UIImage imageNamed:@"4.jpg"] forState:UIControlStateNormal];
    
    [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarImageButton.mas_right).offset(kMargin);
        make.top.equalTo(self.avatarImageButton.mas_top).offset(kMargin);
        make.width.mas_lessThanOrEqualTo(@50);
        make.height.mas_equalTo(30);
    }];
    self.nickNameLabel.textAlignment = NSTextAlignmentLeft;
    self.nickNameLabel.textColor = [UIColor blackColor];
    
    [self.signLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nickNameLabel.mas_left);
        make.top.equalTo(self.nickNameLabel.mas_bottom).offset(kMargin);
        make.width. mas_lessThanOrEqualTo(k_screen_width - 30- 2 * kMargin);
        make.height.mas_equalTo(30);
    }];
    self.signLabel.textAlignment = NSTextAlignmentLeft;
}
- (void)reloadCellWithData:(id)data {
    self.nickNameLabel.text = @"阡陌";
    self.signLabel.text = @"我不喜欢这世界，我只喜欢你";
    
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
