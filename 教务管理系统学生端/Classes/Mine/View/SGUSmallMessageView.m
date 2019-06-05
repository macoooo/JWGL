//
//  SGUSmallMessageView.m
//  教务管理系统学生端
//
//  Created by 强淑婷 on 2019/6/5.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import "SGUSmallMessageView.h"

@implementation SGUSmallMessageView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.textField = [[UITextField alloc] init];
        [self addSubview:_textField];
        
        self.titleLabel = [[UILabel alloc] init];
        [self addSubview:_titleLabel];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];

    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(5);
        make.top.equalTo(self).offset(5);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(50);
    }];
    self.titleLabel.textColor = [UIColor grayColor];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-5);
        make.top.equalTo(self.titleLabel.mas_top);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
