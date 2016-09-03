//
//  ViewController.m
//  CHTPickerViewDemo
//
//  Created by mac on 16/9/3.
//  Copyright © 2016年 Roy Chan. All rights reserved.
//

#import "ViewController.h"
#import "CHTPickerView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<CHTPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *showBtn;

@property (nonatomic, strong) CHTPickerView *pickerView;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, assign) NSInteger selectRow;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _dataArray = @[@"aaa",
                   @"bbb",
                   @"ccc",
                   @"ddd",
                   @"eee"];
    
}

- (IBAction)show:(id)sender {
    
    _pickerView = [[CHTPickerView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT / 2, SCREEN_WIDTH, SCREEN_HEIGHT / 2)
                                            dataArray:_dataArray
                                            selectRow:_selectRow];
    _pickerView.delegate = self;
    [[UIApplication sharedApplication].keyWindow addSubview:_pickerView];
    
}

- (void)cht_pickerView:(CHTPickerView *)pickerView didSelectConfirmButtonWithRow:(NSInteger)row{
    
    if (_pickerView == pickerView) {
        
        _selectRow = row;
        
        [_showBtn setTitle:_dataArray[row] forState:UIControlStateNormal];
        
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
