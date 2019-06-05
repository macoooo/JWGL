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

@end
@implementation SGUPersonMessageView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(20, 64 + 20, k_screen_width - 40, k_screen_height)];
        backgroundView.backgroundColor = [UIColor colorWithRed:0.82f green:0.95f blue:0.99f alpha:1.00f];
        backgroundView.layer.cornerRadius = 10;
        backgroundView.layer.masksToBounds = YES;
        [self addSubview:backgroundView];
        
        NSArray *array = [NSArray arrayWithObjects:@"学号",@"姓名",@"学院",@"专业",@"身份证号",@"民族",@"性别",@"手机号", nil];
        for (int i = 0; i < 8; i++) {
            self.smallMessageView = [[SGUSmallMessageView alloc] initWithFrame:CGRectMake(0, 60 * i, 350, 60)];
            self.smallMessageView.textField.tag = i;
            self.smallMessageView.titleLabel.text = array[i];
            [backgroundView addSubview:self.smallMessageView];
        }
        
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
