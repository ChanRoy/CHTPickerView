//
//  CHTPickerView.m
//  CHTPickerViewDemo
//
//  Created by mac on 16/9/3.
//  Copyright © 2016年 Roy Chan. All rights reserved.
//

#import "CHTPickerView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define PICKER_ROW_HEIGHT   40
#define TOOLBAR_HEIGHT      49

@interface CHTPickerView () <UIPickerViewDelegate, UIPickerViewDataSource, UIGestureRecognizerDelegate>

@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, assign) NSInteger selectRow;

@end

@implementation CHTPickerView{
    
    UIPickerView *_pickerView;
    UIToolbar *_toolBar;
    CGRect _frame;
}

- (instancetype)initWithFrame:(CGRect)frame dataArray:(NSArray *)dataArray selectRow:(NSInteger)selectRow
{
    self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    if (self) {
        
        _frame = frame;
        _dataArray = dataArray;
        _selectRow = selectRow;
        
        [self initialize];
        
        [self setupContentView];
        
        [self setupToolBar];
        
        [self setupPickerView];
        
        [_pickerView selectRow:_selectRow inComponent:0 animated:YES];
    }
    return self;
}

- (void)initialize{
    
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onceTap:)];
    tap.delegate = self;
    [self addGestureRecognizer:tap];
}

- (void)setupContentView{
    
    _contentView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMinX(_frame), SCREEN_HEIGHT, CGRectGetWidth(_frame), CGRectGetHeight(_frame))];
    _contentView.backgroundColor = [UIColor clearColor];
    [self addSubview:_contentView];
}

- (void)setupToolBar{
    
    _toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(_contentView.frame), TOOLBAR_HEIGHT)];
    [_contentView addSubview:_toolBar];
    
    CGFloat btnW = 60;
    CGFloat btnH = 40;
    CGFloat btnX = CGRectGetWidth(_toolBar.frame) - 15 - btnW;
    CGFloat btnY = (CGRectGetHeight(_toolBar.frame) - btnH) / 2;
    
    UIButton * confirmBtn = [[UIButton alloc]initWithFrame:CGRectMake(btnX, btnY, btnW, btnH)];
    [confirmBtn setTitle:@"確定" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:self.tintColor forState:UIControlStateNormal];
    [confirmBtn addTarget:self action:@selector(confirmBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_toolBar addSubview:confirmBtn];
    
}

- (void)setupPickerView{
    
    _pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_toolBar.frame), CGRectGetWidth(_contentView.frame), CGRectGetHeight(_contentView.frame) - CGRectGetHeight(_toolBar.frame))];
    _pickerView.backgroundColor = [UIColor whiteColor];
    _pickerView.delegate   = self;
    _pickerView.dataSource = self;
    [_contentView addSubview:_pickerView];
    
}

- (void)dismiss{
    
    [UIView animateWithDuration:0.25 animations:^{
        
        CGRect frame = _contentView.frame;
        frame.origin.y = SCREEN_HEIGHT;
        _contentView.frame = frame;
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
}

- (void)show{
    
    [UIView animateWithDuration:0.25 animations:^{
        
        _contentView.frame = _frame;
        
    }];
}

- (void)willMoveToWindow:(UIWindow *)newWindow{
    
    [super willMoveToWindow:newWindow];
    
    [self show];
}

#pragma mark - btn event
- (void)confirmBtnClick:(UIButton *)confirmBtn{
    
    if (_delegate) {
        [_delegate cht_pickerView:self didSelectConfirmButtonWithRow:_selectRow];
    }
    [self dismiss];
}

#pragma mark - gesture delegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    
    if ([touch.view isKindOfClass:[self class]]) {
        return YES;
    }
    return NO;
}

#pragma mark - pickerview delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return self.dataArray.count;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    _selectRow = row;
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return self.dataArray[row];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    
    return PICKER_ROW_HEIGHT;
}

#pragma mark - gesture
- (void)onceTap:(UITapGestureRecognizer *)tap{
    
    if ([tap.view isKindOfClass:self.class]) {
        
        [self dismiss];
    }
    
}



@end
