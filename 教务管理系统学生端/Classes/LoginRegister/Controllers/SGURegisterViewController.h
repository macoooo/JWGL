//
//  SGURegisterViewController.h
//  教务管理系统学生端
//
//  Created by 强淑婷 on 2019/5/28.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ReturnValueBlock)(NSString *passedUserName, NSString *passedPassword);

@interface SGURegisterViewController : UIViewController

@property (nonatomic, copy) ReturnValueBlock returnValueBlock;
@end
