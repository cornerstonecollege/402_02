//
//  DetailViewController.m
//  TableViewWitHDetails
//
//  Created by CICCC1 on 2016-02-23.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "DetailViewController.h"
#import "CICCCStudent.h"

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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
