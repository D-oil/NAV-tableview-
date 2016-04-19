//
//  ADDeleteMeViewController.m
//  NAV
//
//  Created by andong on 16/4/18.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADDeleteMeViewController.h"

@interface ADDeleteMeViewController ()

@property (nonatomic,strong)NSMutableArray *array;

@end

@implementation ADDeleteMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _array = [NSMutableArray arrayWithObjects:@"Toy Story",@"A Bug's Life",@"Toy Story 2",@"Monsters,Inc.",@"Finding Nemo",@"The Incredibles",@"Cars",@"Toy Story",@"A Bug's Life",@"Toy Story 2",@"Monsters,Inc.",@"Finding Nemo",@"The Incredibles",@"Cars", nil];
    
    UIBarButtonItem *DeleteButton = [[UIBarButtonItem alloc]initWithTitle:@"Delete" style:UIBarButtonItemStylePlain target:self action:@selector(toggleMove)];
    
    self.navigationItem.rightBarButtonItem = DeleteButton;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseId = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    
    cell.textLabel.text = _array[indexPath.row];
    //取消默认选中行的颜色
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (void)toggleMove
{
    [self.tableView setEditing:!self.tableView.editing animated:YES];
    
    if (self.tableView.editing)
    {
        [self.navigationItem.rightBarButtonItem setTitle:@"Down"];
    }
    else
    {
        [self.navigationItem.rightBarButtonItem setTitle:@"Delete"];
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_array removeObject:_array[indexPath.row]];

//    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]] withRowAnimation:UITableViewRowAnimationAutomatic];
}
@end
