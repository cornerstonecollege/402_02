//
//  ViewController.m
//  TableView
//
//  Created by CICCC1 on 2016-02-23.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) UITableView *tableView;
@property (nonatomic) NSArray *valuesArr;

@end

@implementation ViewController

#define REUSABLE_IDENTIFIER @"CICCCIdentifier"

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.valuesArr = @[@"Hiroshi", @"Luiz", @"Sreekanth", @"Mohammed", @"Value1", @"Value2",  @"Value3", @"Value4", @"Value5", @"Value6", @"Value7", @"Value8", @"Value9", @"Hiroshi", @"Luiz", @"Sreekanth", @"Mohammed", @"Value1", @"Value2",  @"Value3", @"Value4", @"Value5", @"Value6", @"Value7", @"Value8", @"Value9"];
    
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
    
    cell.textLabel.text = self.valuesArr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@", self.valuesArr[indexPath.row]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
