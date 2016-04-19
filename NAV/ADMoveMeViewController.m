//
//  ADMoveMeViewController.m
//  NAV
//
//  Created by andong on 16/4/18.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADMoveMeViewController.h"

@interface ADMoveMeViewController ()

@property (nonatomic,strong) NSMutableArray *array;

@end

@implementation ADMoveMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

     _array = [NSMutableArray arrayWithObjects:@"Toy Story",@"A Bug's Life",@"Toy Story 2",@"Monsters,Inc.",@"Finding Nemo",@"The Incredibles",@"Cars",@"Toy Story",@"A Bug's Life",@"Toy Story 2",@"Monsters,Inc.",@"Finding Nemo",@"The Incredibles",@"Cars", nil];
    
    UIBarButtonItem *moveButton = [[UIBarButtonItem alloc]initWithTitle:@"Move" style:UIBarButtonItemStylePlain target:self action:@selector(toggleMove)];
    
    self.navigationItem.rightBarButtonItem = moveButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        cell.showsReorderControl = YES;
    }
    cell.textLabel.text = _array[indexPath.row];
    //取消默认选中行的颜色
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return cell;
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    id obj = _array[destinationIndexPath.row];
    [_array removeObject:obj];
    [_array insertObject:obj atIndex:sourceIndexPath.row];
}

- (void)toggleMove
{
    [self.tableView setEditing:!self.tableView.editing animated:YES];
    
    if (self.tableView.editing) {
        [self.navigationItem.rightBarButtonItem setTitle:@"Down"];
    }
    else
    {
        [self.navigationItem.rightBarButtonItem setTitle:@"move"];
    }
}

@end
