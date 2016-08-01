//
//  BullerView.h
//  CustomDemo
//
//  Created by 否命题 on 16/7/31.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BullerView : UIView
@property(nonatomic,assign) int trajectory;//弹道
@property(nonatomic,copy) void(^moveStatuesBlock)();//弹幕状态的回调
//初始化弹幕
-(instancetype)initwithComment:(NSString *)comment;

//开始动画
-(void)startAnimation;
//结束动画
-(void)stopAnimation;
@end
