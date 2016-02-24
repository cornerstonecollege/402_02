//
//  DetailViewController.m
//  Table
//
//  Created by Hiroshi on 2/23/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [NSString stringWithFormat:@"Details of %@", self.name];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
