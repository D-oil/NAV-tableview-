//
//  ADDisclosureButtonController.m
//  NAV
//
//  Created by andong on 16/4/18.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADDisclosureButtonController.h"
#import "ADDisclosureButtonViewController.h"

@interface ADDisclosureButtonController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSArray *array ;

@end

@implementation ADDisclosureButtonController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _array = [NSArray arrayWithObjects:@"Toy Story",@"A Bug's Life",@"Toy Story 2",@"Monsters,Inc.",@"Finding Nemo",@"The Incredibles",@"Cars",@"Toy Story",@"A Bug's Life",@"Toy Story 2",@"Monsters,Inc.",@"Finding Nemo",@"The Incredibles",@"Cars", nil];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseId = @"CELL";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseId];
    }
    
    cell.textLabel.text = [_array objectAtIndex:indexPath.row];
    cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ADDisclosureButtonViewController *buttonVC = [[ADDisclosureButtonViewController alloc]init];
    buttonVC.title = _array[indexPath.row];
    [self.navigationController pushViewController:buttonVC animated:YES];
}
@end
