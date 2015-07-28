//
//  DatePickerView.m
//  GQ_IOS_MobileHospital
//
//  Created by buyangyang on 14-6-18.
//  Copyright (c) 2014年 Gary. All rights reserved.
//

#import "DatePickerView.h"

@interface DatePickerView()

@property (nonatomic, strong)UIView *bottomActionSheet;
@property (nonatomic, strong)UIToolbar *toolBar;

@end

@implementation DatePickerView

-(id)init
{
    if (self = [super init])
    {
        [self setDatePicker];
    }
    return self;
}

-(void)setDatePicker
{
    self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    self.bottomActionSheet = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-214, self.frame.size.width, 214)];
    self.bottomActionSheet.backgroundColor = [UIColor whiteColor];
    self.toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
    self.toolBar.barStyle = UIBarStyleDefault;
    
    UIBarButtonItem *spaceItemRight = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    
    UIBarButtonItem *cancelItem  = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleBordered target:self action:@selector(dismissPicker)];
    
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleBordered target:self action:@selector(submitDate)];
    
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    NSMutableArray *items = [NSMutableArray arrayWithObjects:spaceItemRight,cancelItem, spaceItem, doneItem,spaceItemRight, nil];
    _toolBar.items = items;
    
    _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 25, [UIScreen mainScreen].bounds.size.width, 189)];
    _datePicker.datePickerMode = UIDatePickerModeDate;
    _datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"Chinese"];
    [_datePicker setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [self.bottomActionSheet addSubview:_toolBar];
    [self.bottomActionSheet addSubview:self.datePicker];
    [self addSubview:self.bottomActionSheet];
}

-(void)showDatePicker
{
    [[UIApplication sharedApplication].delegate.window.rootViewController.view addSubview:self];
}

-(void)submitDate
{
    [self dismissPicker];
    if (_delegate && [_delegate respondsToSelector:@selector(datePickerYMD:dateResult:)])
    {
        [self.delegate datePickerYMD:self dateResult:self.datePicker.date];
    }
}

-(void)dismissPicker
{
    [UIView animateWithDuration:0.25 animations:^{
        [self.bottomActionSheet setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 0)];
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        [self.bottomActionSheet setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-214, self.frame.size.width, 214)];
        self.alpha = 1;
    }];
    
}

@end
