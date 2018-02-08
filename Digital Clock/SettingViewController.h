//
//  setting.h
//  Digital Clock
//
//  Created by Wilmer sinchi on 1/17/18.
//  Copyright © 2018 Wilmer sinchi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomDigitView.h"
#import "ViewController.h"
@class ViewController;



@interface SettingViewController: UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

//whatever you want to do here, must be done here in the setting view controller

@property (weak, nonatomic) IBOutlet UIPickerView *zoneChange;
//@property (weak, nonatomic) IBOutlet UISwitch *switch1;
//this code below here is temp for green,
//- (IBAction)usersetting:(id)sender;
////
//

@end


