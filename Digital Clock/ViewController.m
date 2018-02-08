//
//  ViewController.m
//  Digital Clock
//
//  Created by Wilmer sinchi on 12/18/17.
//  Copyright © 2017 Wilmer sinchi. All rights reserved.
//

#import "ViewController.h"
#import "CustomDigitView.h"


@interface ViewController (){

    
        
    __weak IBOutlet CustomDigitView *hourOne;
    
    
    __weak IBOutlet CustomDigitView *hourTwo;
    
    
    __weak IBOutlet CustomDigitView *minuteOne;
    
    __weak IBOutlet CustomDigitView *minuteTwo;
    
    __weak IBOutlet UIView *semiColon;
   
    __weak IBOutlet UIView *blinkerOne;
    
    __weak IBOutlet UIView *blinkerTwo;
    UIColor *selectedColor;
     NSInteger selectedTimeZoneRow;
    
    BOOL blinkerStatus;
    
    NSDateFormatter *dateFormatter;
    
    
}

@end

@implementation ViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self readData];
//    [self mountainTimeZone];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    unitFLags = NSCalendarUnitHour | NSCalendarUnitMinute| NSCalendarUnitSecond;
    
    NSArray *zones = @[@"MST",@"CST",@"EST",@"CET"];
    
    NSString *zone = zones[selectedTimeZoneRow];
    
    
    NSTimeZone *timezone = [NSTimeZone timeZoneWithName:zone];
    
    
    
    [calendar setTimeZone:timezone];

    
    dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setTimeZone:timezone];
    [dateFormatter setDateFormat:@"EEEE MMMM d"];

    
    [NSTimer scheduledTimerWithTimeInterval: 0.5 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    [self updateTime];
    
    
    
    //    [self readData];
    //[NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)(0.5)  target:self selector:@selector(blink) userInfo:nil repeats:TRUE];
    

}

-(void) readData {
    
    //you will have to call out the NSUSERDEFAULT
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    selectedTimeZoneRow = [defaults integerForKey:@"timezone"];
    
    
    NSData *colorNSData = [defaults objectForKey:@"color"];
    selectedColor = [NSKeyedUnarchiver unarchiveObjectWithData:colorNSData];
 
    
    is24Hrs = [defaults boolForKey:@"hourschange"];

  
}
//




-(void)updateTime {
    
    
    
    
    currentTime = [NSDate date];
    
    dateComponents = [calendar components:unitFLags fromDate:currentTime];
    hour = [dateComponents hour];
    
  //  hour = 23;
//    ;
//    this is test to see if the 24 hour switch was working properly.
    
    minute = [dateComponents minute];
    second = [dateComponents second];
    
    date.text  = [dateFormatter stringFromDate: currentTime];
    
    [hourOne setColor:selectedColor];
    [hourTwo setColor:selectedColor];
    [minuteOne setColor:selectedColor];
    [minuteTwo setColor:selectedColor];
    [blinkerOne setBackgroundColor:selectedColor];
    [blinkerTwo setBackgroundColor:selectedColor];
    
    
//    NSDateFormatter* df_local = [[[NSDateFormatter alloc] init] autorelease];
//    [df_local setTimeZone:[NSTimeZone timeZoneWithName:@"EST"]];
    
    
    
    
    
    

#pragma twentyfourclockchange
    if(hour >=12) {
        [amPm setText:@"PM"];
        
    }
    else {
        [amPm setText:@"AM"];
        
    }
    
    //when you use the NSUserdefault it would chnage the 12 hr to 24 hr based on your ui switch 
    if (is24Hrs) {
        [amPm setText:@""];
        hour = (hour-0);
    }
    else { // 12 Hours format
        
        
        if (hour==0) {
            hour = 12;
        }
        if (hour >=12)
        {
            hour= 12-(24-hour);
        }

        
        
    }
    
#pragma digitview
    
    if (hour<10){
        [hourOne setDigit:0];
        [hourTwo setDigit:(int)hour];
    }else{
        [hourOne setDigit:(int)(hour)/10];
        [hourTwo setDigit:(int)(hour)%10];
    }
    
    if (second<10) {
//        [secondOne setDigit:0];
//        [secondTwo setDigit:(int)(second)/10];
        seconds = [NSString stringWithFormat:@"0%lu", (unsigned long)second];
    } else {
//        [secondTwo setDigit:(int)(second)/10];
//        [second]
        seconds = [NSString stringWithFormat:@"%lu", (unsigned long)second];
    }
    
    
    if (minute<10) {
        [minuteOne setDigit:0];
        [minuteTwo setDigit:(int)minute];
        timeLabel.text = [NSString stringWithFormat: @"%lu:0%lu:%@", (unsigned long)hour, (unsigned long)minute, seconds];
    }
    else {
        [minuteOne setDigit:(int)(minute)/10];
        [minuteTwo setDigit:(int)(minute)%10];
        timeLabel.text = [NSString stringWithFormat: @"%lu:%lu:%@", (unsigned long)hour, (unsigned long)minute, seconds];
    }
    
    
    [self blink];
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)blink
{
    
    
    
    
    //blinkerStatus = FALSE;
    if(blinkerStatus == FALSE){
        blinkerOne.hidden=NO;
        blinkerTwo.hidden=NO;

        blinkerStatus = TRUE;
    }else {
        blinkerOne.hidden=YES;
        blinkerTwo.hidden=YES;

        blinkerStatus = FALSE;
    }
}

//













//-(void)mountainTimeZone{
//    currentTime = [NSDate date];
//    dateComponents = [calendar components:unitFLags fromDate:currentTime];
////    NSTimeZone *MST = [NSTimeZone timeZoneWithName:@"MST"];
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"MST"]];
//    NSString *dateString = [formatter stringFromDate:currentTime];
//    NSLog(@"the current timezone is %@", dateString);
//
//
//
//
//
//    }
////


@end
