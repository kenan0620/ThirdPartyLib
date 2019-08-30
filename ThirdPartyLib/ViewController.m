//
//  ViewController.m
//  ThirdPartyLib
//
//  Created by conan on 2019/8/30.
//  Copyright © 2019年 conan. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *homeTableView;
@property (nonatomic, copy) NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dataArray = @[@"SDWebimage Parse",@"Masonry Parse",@"None"];
    [self.view addSubview:self.homeTableView];
    [self.homeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

//MARK: Delegate、DataSource

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *vcTitle = cell.textLabel.text;
    Class VCName = NSClassFromString([NSString stringWithFormat:@"%@VC",[vcTitle stringByReplacingOccurrencesOfString:@" " withString:@""]]);
    ViewController *pushVC = [[VCName alloc]init];
    [self.navigationController pushViewController:pushVC animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@""];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@""];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",self.dataArray[indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

//MARK: Lazy

- (UITableView *)homeTableView{
    if (!_homeTableView) {
        _homeTableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _homeTableView.delegate = self;
        _homeTableView.dataSource = self;
    }
    return _homeTableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
