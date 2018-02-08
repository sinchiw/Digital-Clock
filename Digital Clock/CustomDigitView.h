//
//  CustomDigitView.h
//  Digital Clock
//
//  Created by Wilmer sinchi on 12/20/17.
//  Copyright © 2017 Wilmer sinchi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingViewController.h"

@interface CustomDigitView : UIView
@property (weak, nonatomic) IBOutlet UIView *digitOne;
@property (weak, nonatomic) IBOutlet UIView *digitTwo;
@property (weak, nonatomic) IBOutlet UIView *digitThree;
@property (weak, nonatomic) IBOutlet UIView *digitFour;
@property (weak, nonatomic) IBOutlet UIView *digitFive;

@property (weak, nonatomic) IBOutlet UIView *digitSix;
@property (weak, nonatomic) IBOutlet UIView *digitSeven;
@property (strong, nonatomic) IBOutlet UIView *contentView;

-(void)setDigit:(int) digit;
-(void)setColor:(UIColor *) colorValue;

@end
