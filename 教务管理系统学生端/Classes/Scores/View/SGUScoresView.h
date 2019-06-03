//
//  SGUScoresView.h
//  教务管理系统学生端
//
//  Created by 强淑婷 on 2019/4/29.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import <UIKit/UIKit.h>

@class scoresMessageModel;
@interface SGUScoresView : UIView

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray *modelArray;
@property (nonatomic, copy) void(^selectCallBlock)(NSString *year, NSString *semester);
@end
