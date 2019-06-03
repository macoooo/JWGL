//
//  SGUVerifyView.m
//  教务管理系统学生端
//
//  Created by 强淑婷 on 2019/6/3.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import "SGUVerifyView.h"
static const CGFloat kLoginLeft = 60;

@interface SGUVerifyView ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *phoneNumTextField;
@property (nonatomic, strong) UITextField *vertifyWordTextField;
@property (nonatomic, strong) UIButton *sureVerifyButton;
@property (nonatomic, strong) UIButton* cancelButton;
@property (nonatomic, strong) UIImageView *logoImageView;



@end
@implementation SGUVerifyView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.phoneNumTextField = [[UITextField alloc] init];
        [self addSubview:_phoneNumTextField];
        
        self.sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_sendButton];
        
        self.vertifyWordTextField = [[UITextField alloc] init];
        [self addSubview:_vertifyWordTextField];
        
        self.sureVerifyButton = [UIButton buttonWithType: UIButtonTypeCustom];
        [self addSubview:_sureVerifyButton];
        
        self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_cancelButton];
        
        self.logoImageView = [[UIImageView alloc] init];
        [self addSubview:_logoImageView];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    _logoImageView.frame = CGRectMake(k_screen_width/4, k_screen_width/4, k_screen_width/4, k_screen_width/4);
    _logoImageView.center = CGPointMake(k_screen_width/2, k_screen_width/2);
    _logoImageView.image = [UIImage imageNamed:@"sgu_ic_logo"];
    _logoImageView.layer.cornerRadius = k_screen_width/8;
    _logoImageView.layer.masksToBounds = YES;
    
    
    [_phoneNumTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset((k_screen_width - 300) / 2);
        make.top.equalTo(self).offset(300);
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(50);
    }];
    _phoneNumTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sgu_ic_login_user"]];
    _phoneNumTextField.leftViewMode = UITextFieldViewModeAlways;
    _phoneNumTextField.layer.cornerRadius = 3;
    _phoneNumTextField.backgroundColor = [UIColor whiteColor];
    _phoneNumTextField.delegate = self;
    [_sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.phoneNumTextField.mas_right).offset(-5);
        make.top.equalTo(self.phoneNumTextField.mas_top).offset(5);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(40);
    }];
    
    [_sendButton setTitle:@"发送" forState:UIControlStateNormal];
    _sendButton.backgroundColor = [UIColor grayColor];
    _sendButton.layer.masksToBounds = YES;
    _sendButton.layer.cornerRadius = 5;
    [_sendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_sendButton addTarget:self action:@selector(sendClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIImageView *lineImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sgu_icon_login_shortline"]];
    lineImageView.frame = CGRectMake(32, 8, 2, 38);
    [_phoneNumTextField addSubview:lineImageView];
    _phoneNumTextField.delegate = self;
    
    [_vertifyWordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.phoneNumTextField.mas_left);
        make.top.equalTo(self.phoneNumTextField.mas_bottom).offset(10);
        make.width.equalTo(self.phoneNumTextField.mas_width);
        make.height.equalTo(self.phoneNumTextField.mas_height);
    }];
    _vertifyWordTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sgu_ic_login_password"]];
    _vertifyWordTextField.leftViewMode = UITextFieldViewModeAlways;
    _vertifyWordTextField.backgroundColor = [UIColor whiteColor];
    _vertifyWordTextField.layer.cornerRadius = 3;
    UIImageView *lineImageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sgu_icon_login_shortline"]];
    lineImageView2.frame = CGRectMake(32, 8, 2, 38);
    [_vertifyWordTextField addSubview:lineImageView2];
    _vertifyWordTextField.delegate = self;
    
    [_sureVerifyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.phoneNumTextField.mas_left).offset(kLoginLeft / 1.5);
        make.top.equalTo(self.vertifyWordTextField.mas_bottom).offset(kLoginLeft / 5);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(40);
    }];
    [_sureVerifyButton setTitle:@"确认" forState:UIControlStateNormal];
    [self setButton:_sureVerifyButton];
    [_sureVerifyButton addTarget:self action:@selector(sureVerifyButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sureVerifyButton.mas_right).offset(kLoginLeft / 7);
        make.top.equalTo(self.sureVerifyButton.mas_top);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(40);
    }];
    [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [self setButton:_cancelButton];
    [_cancelButton addTarget:self action:@selector(cancelClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setButton:(UIButton *)btn {
    btn.layer.borderColor = [UIColor whiteColor].CGColor;
    btn.layer.borderWidth = 0.5;
    btn.layer.cornerRadius = 5;
    btn.titleLabel.font = [UIFont systemFontOfSize:24];
}
- (void)sureVerifyButtonClick:(UIButton *)button {
    if (self.sureVerifyButton) {
        self.sureVerifyCallBackBlock(button, self.vertifyWordTextField.text);
    }
}

- (void)cancelClick:(UIButton *)button {
    if (self.cancelCallBackBlock) {
        self.cancelCallBackBlock(button);
    }
}
- (void)sendClick:(UIButton *)sender {
    if(self.sendCallBlock) {
        self.sendCallBlock(sender, self.phoneNumTextField.text);
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if(![self.phoneNumTextField isExclusiveTouch] || ![self.vertifyWordTextField isExclusiveTouch]) {
        [self.phoneNumTextField resignFirstResponder];
        [self.vertifyWordTextField resignFirstResponder];
    }
    return YES;
}
//点击空白收起键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.phoneNumTextField resignFirstResponder];
    [self.vertifyWordTextField resignFirstResponder];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
