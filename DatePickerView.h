//
//  DatePickerView.h
//  GQ_IOS_MobileHospital
//
//  Created by buyangyang on 14-6-18.
//  Copyright (c) 2014年 Gary. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DatePickerView;

@protocol datePickerDelegate <NSObject>

-(void)datePickerYMD:(DatePickerView *)datePicker dateResult:(NSDate*)dateResult;

@end

@interface DatePickerView : UIView

@property (nonatomic, assign) id<datePickerDelegate> delegate;
@property (nonatomic, strong) UIDatePicker *datePicker;

-(void)showDatePicker;

@end
