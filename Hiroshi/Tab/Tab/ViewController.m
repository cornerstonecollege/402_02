//
//  ViewController.m
//  Tab
//
//  Created by Hiroshi on 2/22/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface ViewController () <UITabBarDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTab];
}

- (void)createTab
{
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    UITabBarItem *firstItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:0];
    firstVC.tabBarItem = firstItem;
    
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    UITabBarItem *secondItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:1];
    secondVC.tabBarItem = secondItem;
    
    self.viewControllers = @[firstVC, secondVC];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
