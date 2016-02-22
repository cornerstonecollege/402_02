//
//  ViewController.m
//  UITabControllerExample
//
//  Created by CICCC1 on 2016-02-22.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "TabBarViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface TabBarViewController () <UITabBarDelegate>

@end

@implementation TabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createTab];
}

- (void) createTab
{
    FirstViewController *fVC = [[FirstViewController alloc] init];
    UITabBarItem *item = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:0];
    fVC.tabBarItem = item;
    
    SecondViewController *sVC = [[SecondViewController alloc] init];
    UITabBarItem *item2 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:1];
    sVC.tabBarItem = item2;
    
    self.viewControllers = @[fVC, sVC];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
