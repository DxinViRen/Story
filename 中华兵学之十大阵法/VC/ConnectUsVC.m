//
//  ConnectUsVC.m
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/8/3.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "ConnectUsVC.h"
#import "MainCollectionCell.h"
#import "MainSectionController.h"
#import "connectUsCell.h"
@interface ConnectUsVC ()

@end

@implementation ConnectUsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.leftView.hidden = NO;
    self.rightView.hidden = NO;
    [self setBar];
    self.navigationItem.title = @"给我反馈";
    [self configData];
    [self.adapter reloadDataWithCompletion:nil];
}
- (void)setBar{
    [self.rightView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UIButton *ribtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [ribtn addTarget:self action:@selector(riAction:) forControlEvents:UIControlEventTouchUpInside];
    [ribtn setImage:[UIImage imageNamed:@"index"] forState:UIControlStateNormal];
    [self.rightView addSubview:ribtn];
}

- (void)configData{
    
    MainCellModel *model = [[MainCellModel alloc]init];
    model.cellClassName = NSStringFromClass([connectUsCell class]);
    model.cellHeight = 200;
    model.title = @"联系我一起学习:QQ:1544094867.欢迎来信汉语典故博大精深，完全体现我国汉语的精髓，学习典故可以加深对汉语的理解，但是本人水平有限，有很多不到之处，敬请了解，如有宝贵意见请加我的QQ联系本人修改，多谢。";
    MainSectionModel *secM = [[MainSectionModel alloc]initWithArray:[@[model] mutableCopy]];
    self.dataArray = [@[secM] mutableCopy];
}

- (void)riAction:(UIButton *)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
    return self.dataArray;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    MainSectionController *mcs =  [[MainSectionController alloc]init];
    mcs.didSelectCellBlock = ^(id<MainSectionModelProtocol>  _Nonnull model, NSInteger index) {
        
    };
    
    mcs.configCellBlock = ^(id<MainSectionModelProtocol>  _Nonnull model, NSInteger index, UICollectionViewCell * _Nonnull cell) {
        
    };
    
    return mcs;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
