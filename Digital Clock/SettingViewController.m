//
//  setting.m
//  Digital Clock
//
//  Created by Wilmer sinchi on 1/17/18.
//  Copyright © 2018 Wilmer sinchi. All rights reserved.
//

#import "SettingViewController.h"
#import "ViewController.h"


@interface SettingViewController()
{
   

    NSArray *_pickerData;
    
    UIColor *selectedColor;
    BOOL selectedOnOff24;
    NSInteger selectedTimeZoneRow;
    
    // variable for selected color, onoff, timezone
}
@property (weak, nonatomic) IBOutlet UILabel *labelColor;
@property (weak, nonatomic) IBOutlet UISwitch *clockChange;

@end

@implementation SettingViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    
    
    _pickerData = @[@"Mountain Standard Time", @"Central Standard Time", @"Eastern Standard Time", @"Puerto Rico and US Virgin Islands Time"];
    
    // Connect data
    self.zoneChange.dataSource = self;
    self.zoneChange.delegate = self;
    
    
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //this below here is gather the data that in readData instead of typing all of the code. It's far more organized than just typing all of it
    
    [self readData];
    //READ THE READDATA SECTION
}



- (IBAction)colorClicked:(UIButton *)sender {

    
    NSLog(@"Button: %@", [self hexStringForColor:sender.backgroundColor]
          );
    
    selectedColor = sender.backgroundColor;

    self.labelColor.textColor = selectedColor;
    
    
}
//this is the part on how we get the color code, or colordata, if you want to see the color you click you must convert the data into colors
- (NSString *)hexStringForColor:(UIColor *)color {
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    NSString *hexString=[NSString stringWithFormat:@"%02X%02X%02X", (int)(r * 255), (int)(g * 255), (int)(b * 255)];
    return hexString;
}
//disregard everything below here
- (UIColor *)colorWithHexString1:(NSString *)str {
    const char *cStr = [str cStringUsingEncoding:NSASCIIStringEncoding];
    long col = strtol(cStr+1, NULL, 16);
    unsigned char r, g, b;
    b = col & 0xFF;
    g = (col >> 8) & 0xFF;
    r = (col >> 16) & 0xFF;
    return [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:1];
}

- (UIColor *)colorWithHexString:(NSString *)str_HEX {
    int red = 0;
    int green = 0;
    int blue = 0;
    sscanf([str_HEX UTF8String], "#%02X%02X%02X", &red, &green, &blue);
    return  [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1];
}



// this is an action button to make the clock 24 hours or 12 hours.
- (IBAction)switch24Changed:(UISwitch *)sender {
    selectedOnOff24 = sender.on;
}
//this whole thing below is how your timezome pickerview is created
- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _pickerData.count;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _pickerData[row];
}

// Catpure the picker view selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    selectedTimeZoneRow = row;
    
    //  UIViewController *differentZone = [[ViewController alloc] initWithNibName:nil bundle:nil];
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //this code here is what you should do when the done button is clicked.
    [self saveData];
    
}

-(void) saveData {
    //the very first step of using NSUserDefaults , you would have to set this up but for color you would have to set the color into data in order to save it.
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *colorData = [NSKeyedArchiver archivedDataWithRootObject:selectedColor];
    
    [defaults setInteger:selectedTimeZoneRow forKey:@"timezone"];
    [defaults setBool:selectedOnOff24 forKey: @"hourschange"];
    [defaults setObject:colorData forKey:@"color"];
    
    
    
    [defaults synchronize];

}
// the other step of using the NSUserdefault , almost the same thing as but a lil different. You are reading the data that was save before. and on line 159-164 is what should appear when its read.
-(void) readData {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    NSData *colorNSData = [defaults objectForKey:@"color"];
    selectedColor = [NSKeyedUnarchiver unarchiveObjectWithData:colorNSData];
    selectedTimeZoneRow = [defaults integerForKey:@"timezone"];
    selectedOnOff24 = [defaults boolForKey:@"hourschange"];
    
    self.labelColor.textColor = selectedColor;
    
    [self.zoneChange reloadAllComponents];
    [self.zoneChange selectRow:selectedTimeZoneRow inComponent:0 animated:YES];
    
    [self.clockChange setOn:selectedOnOff24 animated:YES];

}


@end
