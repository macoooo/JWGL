//
//  SGUScoresView.m
//  教务管理系统学生端
//
//  Created by 强淑婷 on 2019/4/29.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import "SGUScoresView.h"
#import "SGUDropDownMenuView.h"
#import "SGUScoresTableViewCell.h"

static NSString *const scoreCellName = @"scoreCell";
@interface SGUScoresView ()<UITableViewDataSource>

@property (nonatomic, strong) SGUDropDownMenuView *dropDownMenuView;
@property (nonatomic, strong) SGUDropDownMenuView *secondDropDownView;


@end
@implementation SGUScoresView
- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        NSArray *itemNameArray = [NSArray arrayWithObjects:@"第一学期",@"第二学期", nil];
        NSMutableArray *array = [NSMutableArray array];
        for (int i = 0; i < itemNameArray.count; i++) {
            SGUDropDownListItem *item = [[SGUDropDownListItem alloc] initWithItem:[NSString stringWithFormat:@"i"] itemName:itemNameArray[i]];
            [array addObject:item];
        }
        
        _dropDownMenuView = [[SGUDropDownMenuView alloc] initWithFrame:CGRectMake(5, 3, 190, 50) andTitle:@"学年" andItem:array];
        _dropDownMenuView.backgroundColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor whiteColor];
        
        _secondDropDownView = [[SGUDropDownMenuView alloc] initWithFrame:CGRectMake(180, 60, 200, 50) andTitle:@"学期" andItem:array];
        UIView *tableHeadView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, k_screen_width, 100)];
        [tableHeadView addSubview:_dropDownMenuView];
        [tableHeadView addSubview:_secondDropDownView];
        
        _tableView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.tableHeaderView = tableHeadView;
        _tableView.separatorStyle = NO;
        [_tableView registerClass:[SGUScoresTableViewCell class] forCellReuseIdentifier:scoreCellName];
        [self addSubview:_tableView];
    }
    return self;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SGUScoresTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:scoreCellName];
    if(!cell) {
        cell = [[SGUScoresTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:scoreCellName];
    }
    return cell;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
