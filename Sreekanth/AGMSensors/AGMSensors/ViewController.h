//
//  ViewController.h
//  AGMSensors
//
//  Created by SREEKANTH JAGADEESAN VAZHAPPULLY on 2016-02-29.
//  Copyright © 2016 SREEKANTH JAGADEESAN VAZHAPPULLY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblMagX;

@property (weak, nonatomic) IBOutlet UILabel *lblMagY;

@property (weak, nonatomic) IBOutlet UILabel *lblMagZ;

@end

