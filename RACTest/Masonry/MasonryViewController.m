//
//  MasonryViewController.m
//  RACTest
//
//  Created by anfa on 2019/4/15.
//  Copyright © 2019 anfa. All rights reserved.
//

#import "MasonryViewController.h"
#import "MasonryBasicVC.h"

@interface MasonryViewController ()

@property (weak, nonatomic) IBOutlet UITableView *masonryTable;

@property (nonatomic,strong)NSMutableArray *masonryArr;

@end

@implementation MasonryViewController

-(NSMutableArray *)masonryArr{
    if (!_masonryArr) {
        _masonryArr = [NSMutableArray arrayWithArray:@[@"Masonry基本使用"]];
    }
    return _masonryArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Masonry";
}

#pragma mark - UITableViewDelegate and DataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.masonryArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 定义唯一标识
    static NSString *CellIdentifier = @"Cell";
    // 通过唯一标识创建cell实例
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    // 判断为空进行初始化  --（当拉动页面显示超过主页面内容的时候就会重用之前的cell，而不会再次初始化）
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = self.masonryArr[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return .1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return .1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.row == 0) {
        //基本使用
        [self.navigationController pushViewController:[MasonryBasicVC new] animated:YES];
    }else if (indexPath.row == 1){
        
    }
}
@end
