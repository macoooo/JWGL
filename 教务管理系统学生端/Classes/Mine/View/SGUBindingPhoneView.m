//
//  SGUBindingPhoneView.m
//  教务管理系统学生端
//
//  Created by 强淑婷 on 2019/6/4.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import "SGUBindingPhoneView.h"

@interface SGUBindingPhoneView ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *phoneTextField;
@property (nonatomic, strong) UIButton *sureBindingButton;
@property (nonatomic, strong) UILabel *phoneLabel;

@end
@implementation SGUBindingPhoneView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.phoneTextField = [[UITextField alloc] init];
        [self addSubview:_phoneTextField];
        
        self.phoneLabel = [[UILabel alloc] init];
        [self addSubview:_phoneLabel];
        
        self.sureBindingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_sureBindingButton];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(5);
        make.top.equalTo(self).offset(64 + 5);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    _phoneLabel.text = @"手机号:";
    _phoneLabel.textAlignment = NSTextAlignmentCenter;
    
    [_phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.phoneLabel.mas_right).offset(2);
        make.top.equalTo(self.phoneLabel.mas_top);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];
    _phoneTextField.backgroundColor = [UIColor whiteColor];
    _phoneTextField.delegate = self;
    _phoneTextField.layer.borderWidth = 0.2;
    _phoneTextField.layer.cornerRadius = 3;
    _phoneTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    _sureBindingButton.frame = CGRectMake(k_screen_width / 2 - 35,64 + 90, 70, 40);
    [_sureBindingButton setTitle:@"确定" forState:UIControlStateNormal];
    _sureBindingButton.backgroundColor = [UIColor lightGrayColor];
    _sureBindingButton.layer.cornerRadius = 5;
    _sureBindingButton.layer.masksToBounds = YES;
    [_sureBindingButton addTarget:self action:@selector(sureBindingClick:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)sureBindingClick:(UIButton *)sender {
    if (self.sureBindingClick) {
        _sureBindingClick(self.phoneTextField.text);
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
