//
//  ViewController.m
//  FirstApp
//
//  Created by CICCC1 on 2016-02-16.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *txtName;

@property (weak, nonatomic) IBOutlet UITextField *txtEmail;

@property (weak, nonatomic) IBOutlet UILabel *lblResult;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.lblResult.text = @"";
}

- (IBAction)btnSendClick:(UIButton *)sender
{
    self.lblResult.text = [NSString stringWithFormat:@"Name: %@ Email: %@", self.txtName.text, self.txtEmail.text];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
