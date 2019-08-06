//
//  DetailViewController.m
//  中华兵学之十大阵法
//
//  Created by D.xin on 2019/8/1.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "DetailViewController.h"
#import "UINavigationBar+handle.h"
@interface DetailViewController ()<UITextViewDelegate>
@property (nonatomic,strong)UIImageView *bgImagev;
@property (nonatomic,strong) UIView *rolView ;
@property (nonatomic,strong)UIImageView *lineImageView;
@property (nonatomic,strong)UIImageView *sslopImgview;
@property (nonatomic,strong)UIImageView *fansslopImgview;
@property (nonatomic,strong)UIImageView *monkeyIMageview;
@property (nonatomic,strong)UIImageView *fanmonkeyIMageview;
@property (nonatomic,strong)UIImageView *tcImageview;
@property (nonatomic,strong)UIImageView *wordImageView;
@property (nonatomic,strong)UILabel *wordLabel;
@property (nonatomic,strong)UIView *bgContentView;
@property (nonatomic,strong)UITextView *dTextView;
@end
//fanhouzihouzi  fanslopLineline
@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSubViews];//209  169  112
    //[self setNaviBar];
    self.navigationItem.title = self.itemModel.title;
}


- (void)setNaviBar{
    self.rolView = [[UIView alloc]init];
    self.rolView.backgroundColor = [UIColor blackColor];
    self.rolView.layer.cornerRadius = 10;
    
    
   // [self.navigationController.navigationBar  addSubview:self.rolView];
    [self.rolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.navigationController.navigationBar);
        make.bottom.equalTo(self.navigationController.navigationBar);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
}


- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.rolView.hidden = YES;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar navBarBackGroundColor:[UIColor colorWithRed:190/255.0 green:149/255.0 blue:61/255.0 alpha:1]image:nil isOpaque:NO];
      self.rolView.hidden = NO;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
   
}

- (void)setItemModel:(WordItemModel *)itemModel{
    _itemModel = itemModel;
    self.wordImageView.image = [UIImage imageNamed:itemModel.wordDetail];
    self.dTextView.text = _itemModel.detail;
    self.navigationItem.title = _itemModel.title;
}



- (void)setSubViews{//538 726
    [self.view addSubview:self.lineImageView];
    [self.bgImagev addSubview:self.bgContentView];
    [self.view addSubview:self.sslopImgview];
    [self.view addSubview:self.monkeyIMageview];
    [self.view addSubview:self.fanmonkeyIMageview];
    [self.view addSubview:self.tcImageview];
     [self.view addSubview:self.bgImagev];
    [self.view addSubview:self.fansslopImgview];
   // [self.bgContentView addSubview:self.wordLabel];
    [self.bgContentView addSubview:self.wordImageView];
    [self.bgContentView addSubview:self.dTextView];
    [self.bgImagev mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).inset(16);
        make.right.equalTo(self.view).inset(16);
        make.top.equalTo(self.view).inset(getRectNavAndStatusHight + 20);
        make.height.equalTo(self.bgImagev.mas_width).multipliedBy(726/538.0);
    }];
    
    [self.tcImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgImagev);
        make.top.equalTo(self.bgImagev.mas_top).offset(-30);
        make.size.mas_equalTo(CGSizeMake(30, 60));
    }];
    
    [self.lineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).inset(-2);
        make.bottom.equalTo(self.bgImagev.mas_top);
        make.width.mas_equalTo(10);
    }];
    
    [self.monkeyIMageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bgImagev);
        make.bottom.equalTo(self.bgImagev.mas_top).offset(20);
        make.size.mas_equalTo(CGSizeMake(70, 75));
    }];
    
    [self.fanmonkeyIMageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgImagev);
        make.bottom.equalTo(self.bgImagev.mas_top).offset(20);
        make.size.mas_equalTo(CGSizeMake(70, 75));
    }];
    
    [self.sslopImgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lineImageView.mas_right);
        make.bottom.equalTo(self.bgImagev.mas_top).offset(-20);
        make.top.equalTo(self.view).inset(-10);
        make.right.equalTo(self.monkeyIMageview.mas_left).offset(18);
    }];
    
    [self.fansslopImgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.fanmonkeyIMageview.mas_right).offset(-18);
        make.bottom.equalTo(self.bgImagev.mas_top).offset(-20);
        make.top.equalTo(self.view).inset(-10);
        make.right.equalTo(self.lineImageView.mas_left);
    }];
    
    
    [self.bgContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.bgImagev);
        make.width.equalTo(self.bgImagev).multipliedBy((ScrW-90)/(ScrW-32));
        make.height.equalTo(self.bgContentView.mas_width).multipliedBy(726/538.0);
    }];
    
    [self.wordImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgContentView).inset(15);
        make.right.equalTo(self.bgContentView).inset(15);
        make.height.mas_equalTo(80);
        make.top.equalTo(self.bgContentView).inset(15);
    }];
    
    
    [self.dTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgContentView).inset(20);
        make.right.equalTo(self.bgContentView).inset(20);
        make.top.equalTo(self.wordImageView.mas_bottom).offset(10);
        make.bottom.equalTo(self.bgContentView).inset(30);
    }];
   
}

- (UIImageView *)bgImagev{
    if(!_bgImagev){
        _bgImagev = [[UIImageView alloc]init];
        _bgImagev.userInteractionEnabled = YES;
        _bgImagev.image  = [UIImage imageNamed:@"bgImage"];
    }
    return _bgImagev;
}

- (UIImageView *)lineImageView{
    if(!_lineImageView){
        _lineImageView = [[UIImageView alloc]init];
        //_lineImageView.image = [UIImage imageNamed:@"shengzizizi"];
    }
    return _lineImageView;
}

- (UIImageView *)sslopImgview{
    if (!_sslopImgview) {
        _sslopImgview = [[UIImageView alloc]init];
       // _sslopImgview.backgroundColor = [UIColor redColor];
        _sslopImgview.image = [UIImage  imageNamed:@"slopLineline"];
    }
    return _sslopImgview;
}

- (UIImageView *)monkeyIMageview{
    if(!_monkeyIMageview){
        _monkeyIMageview = [[UIImageView alloc]init];
        _monkeyIMageview.image = [UIImage imageNamed:@"huisehouzi"];
    }
    return _monkeyIMageview;
}

- (UIImageView *)fanmonkeyIMageview{
    if(!_fanmonkeyIMageview){
        _fanmonkeyIMageview = [[UIImageView alloc]init];
        _fanmonkeyIMageview.image = [UIImage imageNamed:@"fanhouzihouzi"];
    }
    return _fanmonkeyIMageview;
}

- (UIImageView *)fansslopImgview{
    if (!_fansslopImgview) {
        _fansslopImgview = [[UIImageView alloc]init];
        // _sslopImgview.backgroundColor = [UIColor redColor];
        _fansslopImgview.image = [UIImage  imageNamed:@"fanslopLineline"];
    }
    return _fansslopImgview;
}

- (UIImageView *)tcImageview{
    if(!_tcImageview){
        _tcImageview.image = [UIImage imageNamed:@"laoshidaochu"];
        _tcImageview.backgroundColor = [UIColor redColor];
    }
    return _tcImageview;
}

- (UIImageView *)wordImageView{
    if(!_wordImageView){
        _wordImageView = [[UIImageView alloc]init];
    }
    return _wordImageView;
}

- (UILabel *)wordLabel{
    if(!_wordLabel){
        _wordLabel = [[UILabel alloc]init];
        _wordLabel.font  = [UIFont fontWithName:ThemeFont size:12];
        _wordLabel.textColor = [UIColor lightTextColor];
        _wordLabel.textAlignment = NSTextAlignmentLeft;
        _wordLabel.numberOfLines = 0;
        _wordLabel.lineBreakMode = NSLineBreakByCharWrapping;
    }
    return _wordLabel;
}

- (UIView *)bgContentView{
    if(!_bgContentView){
        _bgContentView = [[UIView alloc]init];
        _bgContentView.userInteractionEnabled = YES;
        //_bgContentView.backgroundColor = [UIColor redColor];
    }
    return _bgContentView;
}

- (UITextView *)dTextView{
    if(!_dTextView){
        _dTextView = [[UITextView alloc]init];
        _dTextView.delegate = self;
        _dTextView.editable = NO;
        _dTextView.backgroundColor = [UIColor clearColor];
        _dTextView.textColor = [UIColor colorWithRed:54/255.0 green:54/255.0 blue:53/255.0 alpha:1];
        _dTextView.textAlignment= NSTextAlignmentLeft;
        _dTextView.font = [UIFont fontWithName:ThemeFont size:18];
        
    }
    return _dTextView;
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
