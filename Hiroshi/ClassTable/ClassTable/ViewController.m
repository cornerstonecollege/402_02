//
//  ViewController.m
//  ClassTable
//
//  Created by Hiroshi on 2/25/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import "ViewController.h"
#import "HIROStudent.h"
#import "DetailViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, UISplitViewControllerDelegate>

@property (nonatomic) UITableView *tableView;
@property (nonatomic) NSArray *valuesArr;

@end

@implementation ViewController

#define REUSABLE_IDENTIFIER @"HIROIdentifier"

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Title";
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    NSMutableArray *arr = [NSMutableArray array];
    
    for (int i=0; i<30; i++) {
        [arr addObject:[HIROStudent studentRandom]];
    }
    
    self.valuesArr = [arr copy];
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.valuesArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:REUSABLE_IDENTIFIER];
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:REUSABLE_IDENTIFIER];
    }
    
    cell.textLabel.text = ((HIROStudent*) self.valuesArr[indexPath.row]).name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    // iphone
    if (!self.splitViewController)
    {
        DetailViewController *detailsController = [[DetailViewController alloc] init];
        detailsController.student = self.valuesArr[indexPath.row];
        [self.navigationController pushViewController:detailsController animated:YES];
    }
    // ipad
    else
    {
        self.detailController.student = self.valuesArr[indexPath.row];
        [self.detailController updateScreen];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
