//
//  SecondViewController.m
//  UITabControllerExample
//
//  Created by CICCC1 on 2016-02-22.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 200, 100)];
    label.text = @"Second View Controller";
    [self.view addSubview:label];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
