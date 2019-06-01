//
//  SGULoginView.h
//  教务管理系统学生端
//
//  Created by 强淑婷 on 2019/4/29.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SGULoginView : UIView

@property (nonatomic, copy) void(^loginCallBackBlock)(UIButton *button, NSString *name);
@property (nonatomic, copy)void(^registerCallBackBlock)(UIButton *button);
@property (nonatomic, strong) UITextField *usersTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIButton *loginButton;
@end
