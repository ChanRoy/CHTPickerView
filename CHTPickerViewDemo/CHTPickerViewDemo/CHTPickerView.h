//
//  CHTPickerView.h
//  CHTPickerViewDemo
//
//  Created by mac on 16/9/3.
//  Copyright © 2016年 Roy Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CHTPickerView;

@protocol CHTPickerViewDelegate <NSObject>

@optional

- (void)cht_pickerView:(CHTPickerView *)pickerView didSelectConfirmButtonWithRow:(NSInteger)row;

@end

@interface CHTPickerView : UIControl

@property (nonatomic, assign) id <CHTPickerViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame dataArray:(NSArray *)dataArray selectRow:(NSInteger)selectRow;

@end
