//
//  ADFirstLevelViewController.m
//  NAV
//
//  Created by andong on 16/4/18.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADFirstLevelViewController.h"
#import "ADSecondLevelTableViewController.h"
#import "ADDisclosureButtonController.h"
#import "ADCheckListViewController.h"
#import "ADRowControllerViewController.h"
#import "ADMoveMeViewController.h"
#import "ADDeleteMeViewController.h"
#import "ADPresidentsViewController.h"

@interface ADFirstLevelViewController ()

@property (nonatomic,strong) NSMutableArray *subControllers;

@end

@implementation ADFirstLevelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"First Level";
    
    _subControllers = [NSMutableArray array];
    
    ADDisclosureButtonController *disclosureButtonVC = [[ADDisclosureButtonController alloc]initWithStyle:UITableViewStylePlain];
    disclosureButtonVC.title = @"Disclosure Buttons";
    disclosureButtonVC.rowImage = [UIImage imageNamed:@"btn_share"];
    [_subControllers addObject:disclosureButtonVC];
    
    ADCheckListViewController *CheckListVC = [[ADCheckListViewController alloc]initWithStyle:UITableViewStylePlain];
    CheckListVC.title = @"Check List";
    CheckListVC.rowImage = [UIImage imageNamed:@"btn_stop"];
    [_subControllers addObject:CheckListVC];
    
    
    ADRowControllerViewController *RowControllerVC = [[ADRowControllerViewController alloc]initWithStyle:UITableViewStylePlain];
    RowControllerVC.title = @"Row Controller";
    RowControllerVC.rowImage = [UIImage imageNamed:@"btn_story-del-pre"];
    [_subControllers addObject:RowControllerVC];
    
    ADMoveMeViewController *MoveRowVC = [[ADMoveMeViewController alloc]initWithStyle:UITableViewStylePlain];
    MoveRowVC.title = @"Move Row";
    MoveRowVC.rowImage = [UIImage imageNamed:@"btn_story-pause-dis"];
    [_subControllers addObject:MoveRowVC];
    
    ADDeleteMeViewController *DeleteMeVC = [[ADDeleteMeViewController alloc]initWithStyle:UITableViewStylePlain];
    DeleteMeVC.title = @"Delete Me";
    DeleteMeVC.rowImage = [UIImage imageNamed:@"btn_story-del-dis"];
    [_subControllers addObject:DeleteMeVC];
    
    ADPresidentsViewController *PresidentsVC = [[ADPresidentsViewController alloc]initWithStyle:UITableViewStylePlain];
    PresidentsVC.title = @"Detail Edit";
    PresidentsVC.rowImage = [UIImage imageNamed:@"btn_stop-pre"];
    [_subControllers addObject:PresidentsVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _subControllers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseId = @"tableView";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    
    ADSecondLevelTableViewController *secondVC = _subControllers[indexPath.row];
    cell.imageView.image = secondVC.rowImage;
    cell.textLabel.text  = secondVC.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ADSecondLevelTableViewController *nextController = [self.subControllers objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:nextController animated:YES];
}
@end
