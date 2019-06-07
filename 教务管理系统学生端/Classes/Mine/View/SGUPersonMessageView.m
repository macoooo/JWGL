//
//  SGUPersonMessageView.m
//  教务管理系统学生端
//
//  Created by 强淑婷 on 2019/6/5.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import "SGUPersonMessageView.h"
#import "SGUSmallMessageView.h"

@interface SGUPersonMessageView()

@property (nonatomic, strong) SGUSmallMessageView *smallMessageView;
@property (nonatomic, strong) UIButton *saveButton;
@property (nonatomic, strong) UIScrollView *scrollView;

@end
@implementation SGUPersonMessageView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(20, 64 + 20, k_screen_width - 40, 480)];
        backgroundView.backgroundColor = [UIColor colorWithRed:0.82f green:0.95f blue:0.99f alpha:1.00f];
        backgroundView.layer.cornerRadius = 10;
        backgroundView.layer.masksToBounds = YES;
        [self addSubview:backgroundView];
        
        NSArray *array = [NSArray arrayWithObjects:@"学号",@"姓名",@"学院",@"专业",@"身份证号",@"民族",@"性别",@"手机号", nil];
        for (int i = 0; i < 8; i++) {
            self.smallMessageView = [[SGUSmallMessageView alloc] initWithFrame:CGRectMake(0, 60 * i, 350, 60)];
            self.smallMessageView.textField.tag = i;
            if (i == 0 || i == 1 || i == 2 || i == 3 || i == 6) {
                self.smallMessageView.textField.userInteractionEnabled = NO;
            }
            self.smallMessageView.titleLabel.text = array[i];
            [backgroundView addSubview:self.smallMessageView];
        }
        
        self.saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_saveButton];
        
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_saveButton setTitle:@"保存" forState:UIControlStateNormal];
    _saveButton.backgroundColor = [UIColor lightGrayColor];
    _saveButton.layer.cornerRadius = 3;
    _saveButton.layer.masksToBounds = YES;
    _saveButton.frame = CGRectMake(k_screen_width / 2 - 40, 570, 80, 40);
    [_saveButton addTarget:self action:@selector(saveClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)saveClick:(UIButton *)sender {
    NSString *str1 = nil;
    NSString *str2 = nil;
    NSString *str3 = nil;
    if (_smallMessageView.textField.tag == 4) {
        str1 = _smallMessageView.textField.text;
    } else if (_smallMessageView.textField.tag == 5) {
        str2 = _smallMessageView.textField.text;
    } else if (_smallMessageView.textField.tag == 7) {
        str3 = _smallMessageView.textField.text;
    }
    if(_saveCallBack) {
        _saveCallBack(str1, str2, str3);
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
