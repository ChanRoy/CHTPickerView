# CHTPickerView

简易的带确定按钮的pickerView

![] (https://github.com/ChanRoy/CHTPickerView/blob/master/CHTPickerView.gif)

## 简介

*简易的带确定按钮的PickerView， 目前只支持单列*

## 使用

### 初始化

#### 提供一个接口直接初始化

    - (instancetype)initWithFrame:(CGRect)frame
                        dataArray:(NSArray <NSString *>*)dataArray //数据源数组，类型必须为NSString
                        selectRow:(NSInteger)selectRow; //默认选中的行数
                    

### 协议 CHTPickerViewDelegate

#### 协议提供可选的代理方法，表示点确定按钮时选中了第几行

    @protocol CHTPickerViewDelegate <NSObject>

    @optional

    - (void)cht_pickerView:(CHTPickerView *)pickerView didSelectConfirmButtonWithRow:(NSInteger)row;

    @end

## Demo

### 点击按钮显示pickerView

    - (IBAction)show:(id)sender {
    
      _pickerView = [[CHTPickerView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT / 2, SCREEN_WIDTH, SCREEN_HEIGHT / 2)
                                            dataArray:_dataArray
                                            selectRow:_selectRow];
      _pickerView.delegate = self;
      [[UIApplication sharedApplication].keyWindow addSubview:_pickerView];
    
    }

### 点击pickerView中的确定按钮后回显

    - (void)cht_pickerView:(CHTPickerView *)pickerView didSelectConfirmButtonWithRow:(NSInteger)row{
    
      if (_pickerView == pickerView) {
        
          _selectRow = row;
        
          [_showBtn setTitle:_dataArray[row] forState:UIControlStateNormal];
        
      }
    }

## 证书 MIT License

Copyright (c) 2016 

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
