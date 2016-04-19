//
//  ADCheckListViewController.m
//  NAV
//
//  Created by andong on 16/4/18.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADCheckListViewController.h"

@interface ADCheckListViewController ()

@property (nonatomic,strong)NSArray       *array;
@property (nonatomic,assign)NSIndexPath   *lastIndexPath;

@end

@implementation ADCheckListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _array = [NSArray arrayWithObjects:@"Finding Nemo",@"A Bug's Life",@"Toy Story 2",@"Monsters,Inc.",@"Finding Nemo",@"The Incredibles",@"Cars",@"Toy Story",@"A Bug's Life",@"Toy Story 2",@"Monsters,Inc.", @"Toy Story",@"A Bug's Life",@"Toy Story 2",@"Monsters,Inc.",nil];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseId = @"check";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    cell.textLabel.text = [_array objectAtIndex:indexPath.row];
    //取消默认选中行的颜色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType  = UITableViewCellAccessoryNone;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    UITableViewCell *lastcell = [tableView cellForRowAtIndexPath:_lastIndexPath];
    lastcell.accessoryType = UITableViewCellAccessoryNone;
    _lastIndexPath = indexPath;

}
@end
