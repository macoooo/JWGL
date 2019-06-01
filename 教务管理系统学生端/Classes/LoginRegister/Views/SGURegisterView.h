//
//  SGURegisterView.h
//  教务管理系统学生端
//
//  Created by 强淑婷 on 2019/5/28.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SGURegisterView : UIView

@property (nonatomic, copy) void(^sureRgCallBackBlock)(UIButton *button,NSString *userName, NSString *pwd, NSString *surePwd);
@property (nonatomic, copy)void(^cancelRgCallBackBlock)(UIButton *button);
@property (nonatomic, strong) UIButton *cancelButton;
@end
