//
//  DetailViewController.m
//  ClassTable
//
//  Created by Hiroshi on 2/25/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import "DetailViewController.h"
#import "HIROStudent.h"

@interface DetailViewController ()

@property (nonatomic) UILabel *labelSelect;

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self updateScreen];
}

- (void) updateScreen
{
    if ([self updateTitle])
    {
        [self updateBody];
    }
}

- (BOOL) updateTitle
{
    if (self.student && self.student.name)
    {
        self.title = [NSString stringWithFormat:@"Details of %@", self.student.name];
        if (self.labelSelect)
        {
            [self.labelSelect removeFromSuperview];
            self.labelSelect = nil;
        }
        return true;
    }
    else
    {
        self.title = @"Detail View";
        if (!self.labelSelect)
        {
            self.labelSelect = [[UILabel alloc] init];
            self.labelSelect.text = @"Select a row";
            [self.labelSelect sizeToFit];
            self.labelSelect.center = self.view.center;
            
            [self.view addSubview:self.labelSelect];
        }
        return false;
    }
}

- (void) updateBody
{
    [self createLabelWithSize:CGRectMake(20, 100, 500, 20) andName:self.student.name];
    [self createLabelWithSize:CGRectMake(20, 140, 500, 20) andName:[NSString stringWithFormat: @"%ld", self.student.age]];
    [self createLabelWithSize:CGRectMake(20, 180, 500, 20) andName:[NSString stringWithFormat:@"%c" , self.student.grade]];
}

- (void) createLabelWithSize:(CGRect)frame andName:(NSString*)name
{
    UILabel* label = [[UILabel alloc]init];
    label.frame = frame;
    label.text= name;
    label.font=[UIFont fontWithName:@"Helvetica" size:30 ];
    [self.view addSubview:label];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
