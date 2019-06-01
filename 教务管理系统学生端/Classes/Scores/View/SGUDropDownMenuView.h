//
//  SGUDropDownMenuView.h
//  教务管理系统学生端
//
//  Created by 强淑婷 on 2019/5/13.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SGUDropDownListItem : NSObject

@property (nonatomic, copy, readonly) NSString *itemID;
@property (nonatomic, copy, readonly) NSString *itemName;
- (instancetype)initWithItem:(NSString *)itemID itemName:(NSString *)itemName
NS_DESIGNATED_INITIALIZER;//初始化标记
@end

@class SGUDropDownMenuView;

typedef void (^SGUDropDownViewSelectedBlock)(SGUDropDownMenuView *dropDownView);
@interface SGUDropDownMenuView : UIView
//字体颜色，默认blackColor
@property (nonatomic, strong) UIColor *textColor;
//字体大小14
@property (nonatomic, strong) UIFont *font;
//数据源
@property (nonatomic, strong) NSArray *dataSource;
//默认选中第一个
@property (nonatomic, assign) NSUInteger selectedIndex;
//当前选中的DropDownListItem
@property (nonatomic, strong ,readonly) SGUDropDownListItem *selectedItem;

- (void)setViewBorder:(CGFloat)width borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius;

- (void)setDropDownListViewSelectedBlock:(SGUDropDownViewSelectedBlock)block;
- (instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title andItem:(NSArray *)itemArray;
@end
