//
//  ViewController.h
//  Digital Clock
//
//  Created by Wilmer sinchi on 12/18/17.
//  Copyright © 2017 Wilmer sinchi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomDigitView.h"

@interface ViewController : UIViewController
{

    IBOutlet UILabel *date;
    IBOutlet UILabel *timeLabel;
    IBOutlet UILabel *amPm;
    

    
    NSDate *currentTime;
    NSDateComponents *dateComponents;
    
    NSCalendar *calendar;
    NSCalendarUnit unitFLags;
    
    
    NSString *seconds;
    NSUInteger minute, hour, second;
    
    Boolean is24Hrs;
    
    
    
}



//- (IBAction)lightgreen:(id)sender;
//- (IBAction)red:(id)sender;
//- (IBAction)blue:(id)sender;
//- (IBAction)green:(id)sender;
//
@end

