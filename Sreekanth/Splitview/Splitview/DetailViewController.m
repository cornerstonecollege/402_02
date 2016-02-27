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
@property (nonatomic) UILabel *labelName;
@property (nonatomic) UILabel *labelAge;
@property (nonatomic) UILabel *labelGrade;

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
    if (!self.labelName || !self.labelAge || !self.labelGrade)
    {
        self.labelName = [[UILabel alloc]init];
        self.labelAge = [[UILabel alloc]init];
        self.labelGrade = [[UILabel alloc]init];
    }
    
    self.labelName.text = [NSString stringWithFormat:@"Name: %@",self.student.name ];
    [self.labelName sizeToFit];
    self.labelName.center = CGPointMake(self.labelName.frame.size.width/2+20, self.labelName.frame.size.height+100);
    [self.view addSubview:self.labelName];
    
    self.labelAge.text = [NSString stringWithFormat:@"Age: %lu",(long)self.student.age ];
    [self.labelAge sizeToFit];
    self.labelAge.center = CGPointMake(self.labelAge.frame.size.width/2+20, self.labelAge.frame.size.height+130);
    [self.view addSubview:self.labelAge];
    
    self.labelGrade.text = [NSString stringWithFormat:@"Grade: %c",self.student.grade];
    [self.labelGrade sizeToFit];
    self.labelGrade.center = CGPointMake(self.labelGrade.frame.size.width/2+20, self.labelGrade.frame.size.height+160);
    [self.view addSubview:self.labelGrade];
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
