//
//  FirstViewController.m
//  Tab
//
//  Created by Hiroshi on 2/22/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import "FirstViewController.h"
#import "ViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGPoint point = CGPointMake(self.view.center.x, self.view.center.y);
    
    if(self.parentViewController && [self.parentViewController isKindOfClass:[ViewController class]])
    {
        ViewController *obj = (ViewController *)self.parentViewController;
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
