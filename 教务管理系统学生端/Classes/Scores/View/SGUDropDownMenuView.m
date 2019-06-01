//
//  SGUDropDownMenuView.m
//  教务管理系统学生端
//
//  Created by 强淑婷 on 2019/5/13.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import "SGUDropDownMenuView.h"
#import <Masonry.h>

@implementation SGUDropDownListItem
- (instancetype)initWithItem:(NSString *)itemID itemName:(NSString *)itemName {
    if(self = [super init]) {
        _itemID = itemID;
        _itemName = itemName;
    }
    return self;
}

- (instancetype) init {
    return [self initWithItem:nil itemName:nil];
}
@end

@interface SGUDropDownMenuView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UILabel *itemLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *dropDownButton;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) SGUDropDownViewSelectedBlock selectedBlock;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSArray *itemArray;
@property (nonatomic, assign)NSInteger flag;

@end

@implementation SGUDropDownMenuView

- (instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title andItem:(NSArray *)itemArray{
    if(self = [super initWithFrame:frame]) {
        self.titleLabel = [[UILabel alloc] init];
        [self addSubview:_titleLabel];
        
        self.itemLabel = [[UILabel alloc] init];
        [self addSubview:_itemLabel];
        
        self.dropDownButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_dropDownButton];
        
        self.title = [[NSString alloc] init];
        self.title = title;
        self.itemArray = [NSArray array];
        self.itemArray = itemArray;
        
        self.flag = 1;
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(0, 0, 40, 30);
    self.titleLabel.text = _title;
    self.titleLabel.font = [UIFont systemFontOfSize:18];
    
    [self.itemLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_right).offset(3);
        make.top.mas_equalTo(self.titleLabel.mas_top);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(40);
    }];
    self.itemLabel.textColor = [UIColor blackColor];
    self.itemLabel.layer.borderColor = [UIColor grayColor].CGColor;
    self.itemLabel.layer.borderWidth = 0.5;
    self.itemLabel.layer.cornerRadius = 10;
    self.itemLabel.layer.masksToBounds = YES;
    
    [self.dropDownButton mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.mas_equalTo(self.itemLabel.mas_right).offset(-30);
        make.top.equalTo(self.itemLabel.mas_top).offset(5);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
    }];
    [self.dropDownButton setImage:[UIImage imageNamed:@"xiala"] forState:UIControlStateNormal];
    [_dropDownButton addTarget:self action:@selector(dropDownClick:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)dropDownClick:(UIButton *)sender {
    if (self.flag) {
        [self rotateArrowImage];
        [self addSubview:self.tableView];
        _tableView.frame = CGRectMake(48, 40, 140, _itemArray.count * 40);
    } else {
        [self rotateArrowImage];
        [_tableView removeFromSuperview];
    }
    self.flag = !self.flag;
}
- (void)rotateArrowImage {
    //旋转箭头
    _dropDownButton.transform = CGAffineTransformRotate(_dropDownButton.transform, M_PI);
}
- (UITableView *)tableView {
    if(!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.layer.shadowOffset = CGSizeMake(4, 4);
        _tableView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        _tableView.layer.shadowOpacity = 0.8;
        _tableView.layer.borderColor = [UIColor grayColor].CGColor;
        _tableView.layer.borderWidth = 0.5;
        _tableView.layer.cornerRadius = 3;
        _tableView.clipsToBounds = NO;
        _tableView.rowHeight = 40;
    }
    return _tableView;
}

#pragma mark - Methods
- (void)setDropDownListViewSelectedBlock:(SGUDropDownViewSelectedBlock)block {
    _selectedBlock = block;
}

- (void)setViewBorder:(CGFloat)width borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.borderWidth = width;
    self.layer.borderColor = borderColor.CGColor;
}

- (void)selectedItemAtIndex:(NSInteger)index {
    _selectedIndex = index;
    if(index < _itemArray.count) {
        SGUDropDownListItem *item = _itemArray[index];
        _selectedItem = item;
        _itemLabel.text = item.itemName;
    }
}
#pragma mark - tableView
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.font = _font;
    cell.textLabel.textColor = _textColor;
    SGUDropDownListItem *item = _itemArray[indexPath.row];
    cell.textLabel.text = item.itemName;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self selectedItemAtIndex:indexPath.row];
    if (_selectedBlock) {
        _selectedBlock(self);
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _itemArray.count;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
