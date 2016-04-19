//
//  ADPresidentsViewController.m
//  NAV
//
//  Created by andong on 16/4/19.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADPresidentsViewController.h"
#import "ADPresident.h"
#import "ADPresidentDetailTableVC.h"

@interface ADPresidentsViewController ()

@property (nonatomic,strong)NSMutableArray *list;
@property (nonatomic,strong)ADPresident    *President;

@end

@implementation ADPresidentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载数据
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"Presidents" ofType:@"plist"];
//    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
//    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
//    NSMutableArray *array = [unarchiver decodeObjectForKey:@"Presidents"];
//    self.list = array;
    
    _President = [[ADPresident alloc]init];
    _President.number       = 1;
    _President.name         = @"Theodore Roosevelt";
    _President.fromYear     = @"1901";
    _President.toYear       = @"1909";
    _President.party        = @"Republican";
    _list = [NSMutableArray arrayWithObject:_President];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseId = @"PresidentsCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseId];
    }
    
    _President                = _list[indexPath.row];
    cell.textLabel.text       = _President.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@",_President.fromYear,_President.toYear];
    
    //取消默认选中行的颜色
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ADPresidentDetailTableVC *PresidentDetailVC = [[ADPresidentDetailTableVC alloc]initWithStyle:UITableViewStyleGrouped];
    _President = _list[indexPath.row];
    PresidentDetailVC.president = _President;
    PresidentDetailVC.title = _President.name;
    [self.navigationController pushViewController:PresidentDetailVC animated:YES];
    
}
@end
