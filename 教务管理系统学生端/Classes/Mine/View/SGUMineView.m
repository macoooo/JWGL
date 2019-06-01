//
//  SGUMineView.m
//  教务管理系统学生端
//
//  Created by 强淑婷 on 2019/4/29.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import "SGUMineView.h"
#import "SGUMineTableViewCell.h"

@interface SGUMineView()<UITableViewDataSource>


@end
@implementation SGUMineView
- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        self.tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        self.tableView.dataSource = self;
        [self addSubview:_tableView];
        
        [self.tableView registerClass:[SGUMineTableViewCell
                                       class] forCellReuseIdentifier:@"topCell"];
    }
    return self;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0) {
        return 1;
    } else {
        return 8;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        SGUMineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"topCell" forIndexPath:indexPath];
        if(!cell) {
            cell = [[SGUMineTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"topCell"];
            
        }
        id data = nil;
        [cell reloadCellWithData:data];
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mineCell"];
        if(!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mineCell"];
            
        }
        cell.textLabel.text = @"11111";
        cell.imageView.image = [UIImage imageNamed:@"bcl_ic_mine_tabBar"];
        
        return cell;
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
