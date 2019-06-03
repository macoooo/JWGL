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
#import "SGUScoresModel.h"

static NSString *const scoreCellName = @"scoreCell";
@interface SGUScoresView ()<UITableViewDataSource>

@property (nonatomic, strong) SGUDropDownMenuView *dropDownMenuView;
@property (nonatomic, strong) SGUDropDownMenuView *secondDropDownView;
@property (nonatomic ,strong) NSString *semester;
@property (nonatomic, strong) NSString *year;
@property (nonatomic, strong) UIButton *selectButton;


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
        
        NSArray *secondItemArray = [NSArray arrayWithObjects:@"2017",@"2018",@"2019", nil];
        NSMutableArray *array2 = [NSMutableArray array];
        for (int i = 0; i < secondItemArray.count; i++) {
            SGUDropDownListItem *item = [[SGUDropDownListItem alloc] initWithItem:[NSString stringWithFormat:@"i"] itemName:secondItemArray[i]];
            [array2 addObject:item];
        }
        _dropDownMenuView = [[SGUDropDownMenuView alloc] initWithFrame:CGRectMake(5, 3, 190, 40) andTitle:@"学年" andItem:array2];
        _dropDownMenuView.backgroundColor = [UIColor whiteColor];
        _dropDownMenuView.selectedIndex = 0;
        [_dropDownMenuView setDropDownListViewSelectedBlock:^(SGUDropDownMenuView *dropDownView) {
            self.year = dropDownView.selectedItem.itemName;
        }];
        NSLog(@"%@---self.year----", self.year);
        self.backgroundColor = [UIColor whiteColor];
        
        _secondDropDownView = [[SGUDropDownMenuView alloc] initWithFrame:CGRectMake(180, 60, 200, 40) andTitle:@"学期" andItem:array];
        _secondDropDownView.selectedIndex = 0;
        [_secondDropDownView setDropDownListViewSelectedBlock:^(SGUDropDownMenuView *dropDownView) {
            if ([dropDownView.selectedItem.itemName isEqualToString:@"第一学期"]) {
                self.semester = @"1";
            } else if ([dropDownView.selectedItem.itemName isEqualToString:@"第二学期"]) {
                self.semester = @"2";
            }
        }];
        UIView *tableHeadView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, k_screen_width, 180)];
        [tableHeadView addSubview:_dropDownMenuView];
        [tableHeadView addSubview:_secondDropDownView];
        
        
        _selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [tableHeadView addSubview:_selectButton];
        _selectButton.frame = CGRectMake(7 * k_screen_width /  8 - 25, tableHeadView.frame.origin.y + tableHeadView.frame.size.height - 100, k_screen_width / 8 + 20, 40);
        [_selectButton setTitle:@"查询" forState:UIControlStateNormal];
        _selectButton.backgroundColor = [UIColor lightGrayColor];
        _selectButton.layer.cornerRadius = 5;
        _selectButton.layer.masksToBounds = YES;
        [_selectButton addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
        
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
    NSLog(@"%@---self.modelArray[indexPath.row-----", self.modelArray[indexPath.row]);
    [cell reloadCellWithData:self.modelArray[indexPath.row]];
    return cell;
}
- (void)selectClick:(UIButton *)sender {
    if (self.selectCallBlock) {
        self.selectCallBlock(self.year, self.semester);
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
