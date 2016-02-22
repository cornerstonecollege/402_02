//
//  FirstViewController.m
//  UITabControllerExample
//
//  Created by CICCC1 on 2016-02-22.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "FirstViewController.h"
#import "TabBarViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGPoint point = CGPointMake(self.view.center.x, self.view.center.y);
    
    if (self.parentViewController && [self.parentViewController isKindOfClass:[TabBarViewController class]])
    {
        TabBarViewController *obj = (TabBarViewController *)self.parentViewController;
        point = CGPointMake(self.view.center.x, self.view.center.y - obj.tabBar.frame.size.height);
    }
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    label.text = @"First View Controller";
    [label sizeToFit];
    label.center = point;
    [self.view addSubview:label];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
