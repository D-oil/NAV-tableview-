//
//  ADPresidentDetailTableVC.m
//  NAV
//
//  Created by andong on 16/4/19.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADPresidentDetailTableVC.h"
#import "ADPresidentDetailCell.h"

#define kNumberOfEdittableRows 4
#define kNameRowIndex          0
#define kFromYearRowIndex      1
#define kToYearRowIndex        2
#define kPartyRowIndex         3

@interface ADPresidentDetailTableVC () <UITextFieldDelegate>

@property (nonatomic,strong) NSArray *array;

@end

@implementation ADPresidentDetailTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _array = [NSArray arrayWithObjects:@"Name:",@"From:",@"To:",@"Party:", nil];
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]initWithTitle:@"save" style:UIBarButtonItemStylePlain target:self action:@selector(saveInfo:)];
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]initWithTitle:@"cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancel:)];
    self.navigationItem.leftBarButtonItem = cancelButton;
    self.navigationItem.rightBarButtonItem = saveButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return kNumberOfEdittableRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseId = @"PresidentDetailCell";
    //注册XIB
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ADPresidentDetailCell class]) bundle:nil] forCellReuseIdentifier:reuseId];

    ADPresidentDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    cell.Detail.delegate = self;
    
    switch (indexPath.row) {
        case kNameRowIndex:
            cell.title.text = _array[kNameRowIndex];
            cell.Detail.text = _president.name;
            cell.Detail.tag = kNameRowIndex;
            break;
        case kFromYearRowIndex:
            cell.title.text = _array[kFromYearRowIndex];
            cell.Detail.text = _president.fromYear;
            cell.Detail.tag = kFromYearRowIndex;
            break;
        case kToYearRowIndex:
            cell.title.text = _array[kToYearRowIndex];
            cell.Detail.text = _president.toYear;
            cell.Detail.tag = kToYearRowIndex;
            break;
        case kPartyRowIndex:
            cell.title.text = _array[kPartyRowIndex];
            cell.Detail.text = _president.party;
            cell.Detail.tag = kPartyRowIndex;
            break;
        default:
            break;
    }
    
    //取消默认选中行的颜色
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        return indexPath;
}

- (void)saveInfo:(id)sender
{
    
    NSString *message = [NSString stringWithFormat:@"Name : %@ From : %@ To : %@,Party : %@",_president.name,_president.fromYear,_president.toYear,_president.party];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"SAVE INFO"  message:message delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil];
    
    [alert show];
}
- (void)cancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    switch (textField.tag) {
        case kNameRowIndex:
            _president.name     = textField.text;
            break;
        case kFromYearRowIndex:
            _president.fromYear = textField.text;
            break;
        case kToYearRowIndex:
            _president.toYear   = textField.text;
            break;
        case kPartyRowIndex:
            _president.party    = textField.text;
            break;
        default:
            break;
    }
}


@end
