//
//  FootView.m
//  11-团购案例
//
//  Created by 黄启明 on 16/4/18.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "FootView.h"

@interface FootView ()
@property (weak, nonatomic) IBOutlet UIButton *btnGetMore;
@property (weak, nonatomic) IBOutlet FootView *waitingView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (weak, nonatomic) IBOutlet UILabel *lab;
- (IBAction)btnLoadMoreClick;

@end

@implementation FootView

+ (instancetype)footView{
     return [[[NSBundle mainBundle] loadNibNamed:@"FootView" owner:nil options:nil] firstObject];
}
//加载更多按钮单击事件
- (IBAction)btnLoadMoreClick {
    //1.隐藏“加载更多按钮”
    self.btnGetMore.hidden = YES;
    //2.显示等待指示器view
    self.waitingView.hidden = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //调用代理方法实现下面的功能
        //调用footViewdidLoadMore方法之前，为了保证调用不出错，所以要先判断一下代理对象是否真的实现了这个方法，如果实现了这个方法再调用，否则不调用
        //3.增加一条数据,创建一个模型对象，把模型对象加到goods集合中
        if ([self.delegate respondsToSelector:@selector(footViewdidLoadMore:)]){
            [self.delegate footViewdidLoadMore:self];
        }
        self.btnGetMore.hidden = NO;
        self.waitingView.hidden = YES;
    });
    
    //4.刷新UITableView
}
@end
