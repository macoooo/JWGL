//
//  SGUScoresModel.h
//  教务管理系统学生端
//
//  Created by 强淑婷 on 2019/6/3.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import "JSONModel.h"

@protocol scoresMessageModel
@end

@interface scoresMessageModel: JSONModel
@property (nonatomic, copy) NSString *score;
@property (nonatomic, copy) NSString *course_name;

@end

@interface SGUScoresModel : JSONModel

@property (nonatomic, copy) NSArray<scoresMessageModel> *scoresMessage;
@end
