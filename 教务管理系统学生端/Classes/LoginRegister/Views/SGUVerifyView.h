//
//  SGUVerifyView.h
//  教务管理系统学生端
//
//  Created by 强淑婷 on 2019/6/3.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SGUVerifyView : UIView

@property (nonatomic, copy) void(^sureVerifyCallBackBlock)(UIButton *button, NSString *vertifyWordString);
@property (nonatomic, copy)void(^cancelCallBackBlock)(UIButton *button);
@property (nonatomic, copy) void(^sendCallBlock)(UIButton *button, NSString *phoneNumber);
@property (nonatomic, strong) UIButton *sendButton;
@end
