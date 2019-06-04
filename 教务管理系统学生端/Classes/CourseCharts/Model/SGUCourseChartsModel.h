//
//  SGUCourseChartsModel.h
//  教务管理系统学生端
//
//  Created by 强淑婷 on 2019/6/4.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import "JSONModel.h"

@interface SGUCourseChartsModel : JSONModel

@property (nonatomic, assign) NSInteger weekday;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *startTime;
@property (nonatomic, strong) NSString *endTime;
@property (nonatomic, assign) NSInteger credit;
@property (nonatomic, strong) NSString *courseName;
@property (nonatomic, assign) NSInteger elective;
@property (nonatomic, assign) NSInteger courseHour;
@property (nonatomic, strong) NSString *teachName;
@end
