//
//  ViewController.m
//  TableView
//
//  Created by CICCC1 on 2016-02-23.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "CICCCStudent.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, UISplitViewControllerDelegate>

@property (nonatomic) UITableView *tableView;
@property (nonatomic) NSArray *valuesArr;

@end

@implementation ViewController

#define REUSABLE_IDENTIFIER @"CICCCIdentifier"

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Beautiful Table";
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < 30; i ++)
    {
        [arr addObject:[CICCCStudent studentRandom]];
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
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:REUSABLE_IDENTIFIER];
    }
    
    cell.textLabel.text =  ((CICCCStudent*) self.valuesArr[indexPath.row]).name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.splitViewController)
    {
        DetailViewController *detailsController = [[DetailViewController alloc] init];
        detailsController.student = self.valuesArr[indexPath.row];
        [self.navigationController pushViewController:detailsController animated:YES];
    }
    else
    {
        self.detailController.student = self.valuesArr[indexPath.row];
        [self.detailController updateScreen];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
