//
//  BullerView.m
//  CustomDemo
//
//  Created by 否命题 on 16/7/31.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "BullerView.h"

#define padding 10
@interface BullerView ()

@property(nonatomic,strong)UILabel *labComment;
@end


@implementation BullerView

-(instancetype)initwithComment:(NSString *)comment{
    if (self==[self init]) {
        self.backgroundColor=[UIColor redColor];
//        计算弹幕的实际宽度
        NSDictionary *attr=@{NSFontAttributeName:[UIFont systemFontOfSize:14]};
        CGFloat width=[comment sizeWithAttributes:attr].width;
        self.bounds=CGRectMake(0, 0, width+2*padding, 30);
        self.labComment.text=comment;
        self.labComment.frame=CGRectMake(padding, 0, width, 30);
    }
    return self;
}
-(void)startAnimation{

    CGFloat screenwidth=[UIScreen mainScreen].bounds.size.width;
    CGFloat duration=4.0f;
    __block CGRect frame=self.frame;
    CGFloat wholeWith=screenwidth+CGRectGetWidth(self.bounds);
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        frame.origin.x-=wholeWith;
        self.frame=frame;
    }completion:^(BOOL finished){
        [self removeFromSuperview];
        if (self.moveStatuesBlock) {
            self.moveStatuesBlock();
        }
    }];
}
-(void)stopAnimation{
    [self.layer removeAllAnimations];
    [self removeFromSuperview];
}
-(UILabel *)labComment{
    if (_labComment==nil) {
        _labComment=[[UILabel alloc]initWithFrame:CGRectZero];
        _labComment.font=[UIFont systemFontOfSize:14];
        _labComment.textColor=[UIColor whiteColor];
        _labComment.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_labComment];
    }
    return _labComment;
}
@end
