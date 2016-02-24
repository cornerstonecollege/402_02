//
//  ViewController.m
//  Table
//
//  Created by Hiroshi on 2/23/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) UITableView *tableView;
@property (nonatomic) NSArray *arrValues;

@end

@implementation ViewController

#define REUSABLE_IDENTIFIER @"HIROIdentifier"

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Table";
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, self.view.bounds.size.height - 50) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.arrValues = @[@"row1", @"row2", @"row3", @"row4", @"row5", @"row6", @"row7", @"row8", @"row9"];
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrValues.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:REUSABLE_IDENTIFIER];
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:REUSABLE_IDENTIFIER];
    }
    
    cell.textLabel.text = self.arrValues[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailsController = [[DetailViewController alloc] init];
    detailsController.name = self.arrValues[indexPath.row];
    [self.navigationController pushViewController:detailsController animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
