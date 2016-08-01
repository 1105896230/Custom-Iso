//
//  BullerManage.m
//  CustomDemo
//
//  Created by 否命题 on 16/7/31.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "BullerManage.h"
#import "BullerView.h"
@interface BullerManage()
//数据
@property(nonatomic,strong)NSMutableArray *datasource;
//弹幕使用过的数组变量
@property(nonatomic,strong)NSMutableArray *bullerComments;
//存储view的数组变量
@property(nonatomic,strong)NSMutableArray *bullerViews;
@end

@implementation BullerManage

-(void)start{
    [self.bullerComments removeAllObjects];
    [self.bullerComments addObjectsFromArray:self.datasource];
    
    [self initBullerComments];
}

-(void)initBullerComments{
    NSMutableArray *trajectorys=[NSMutableArray arrayWithObjects:@[@(0),@(1),@(2)]];
    for (int i=0;i<3;i++) {
//通过随机数获取到弹幕到轨迹
        NSInteger index=arc4random()%trajectorys.count;
        int trajectory=[[trajectorys objectAtIndex:index]integerValue];
        [trajectorys removeObjectAtIndex:index];
        
//       从弹幕数组中逐一取出弹幕数据
        
        NSString *comment=[self.bullerComments firstObject];
        [self.bullerComments removeObjectAtIndex:0];
        
    }
}

-(void)createBullerView:(NSString *)comment traobjectory:(int) trajectory{
    BullerView *view=[[BullerView alloc]init];
    view.trajectory=trajectory;
    [self.bullerViews addObject:view];
    
    view.moveStatuesBlock=^{
//        移除资源
        [view stopAnimation];
        [self.bullerViews removeObject:view];
    };
    
}


-(NSMutableArray *)datasource{
    if (!_datasource) {
        _datasource=[NSMutableArray arrayWithArray:nil];
    }
    return _datasource;
}

-(NSMutableArray *)bulletCommments{
    if (!_datasource) {
        _datasource=[NSMutableArray array];
    }
    return _datasource;
}
-(NSMutableArray *)bulletViews{
    if (!_datasource) {
        _datasource=[NSMutableArray array];
    }
    return _datasource;
}

@end
