//
//  ADRowControllerViewController.m
//  NAV
//
//  Created by andong on 16/4/18.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADRowControllerViewController.h"

@interface ADRowControllerViewController ()

@property (nonatomic,strong)NSArray *array ;



@end

@implementation ADRowControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _array = [NSArray arrayWithObjects:@"Toy Story",@"A Bug's Life",@"Toy Story 2",@"Monsters,Inc.",@"Finding Nemo",@"The Incredibles",@"Cars",@"Toy Story",@"A Bug's Life",@"Toy Story 2",@"Monsters,Inc.",@"Finding Nemo",@"The Incredibles",@"Cars", nil];

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
        
        UIButton *button = [[UIButton alloc]init];
        UIImage *normalImage = [UIImage imageNamed:@"btn_story-del-pre"];
        UIImage *highImage   = [UIImage imageNamed:@"btn_story-del-dis"];
        [button setFrame:CGRectMake(0, 0, normalImage.size.width, normalImage.size.height)];
        [button setImage:normalImage forState:UIControlStateNormal];
        [button setImage:highImage forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(buttonTap:) forControlEvents:UIControlEventTouchUpInside];
        
        cell.accessoryView = button;
    }
    
    cell.textLabel.text = _array[indexPath.row];
    
    //取消默认选中行的颜色
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return cell;
}
- (void)buttonTap:(UIButton *)sender
{
    UITableViewCell *cell = (UITableViewCell *)[sender superview];
    
    NSString *message = [NSString stringWithFormat:@"You Tap The Button for %@",cell.textLabel.text];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"You Tap the Button" message:message delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
    [alert show];
    
}
@end
