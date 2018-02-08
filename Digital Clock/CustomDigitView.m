//
//  CustomDigitView.m
//  Digital Clock
//
//  Created by Wilmer sinchi on 12/20/17.
//  Copyright © 2017 Wilmer sinchi. All rights reserved.
//

#import "CustomDigitView.h"

@implementation CustomDigitView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self prepare];
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self prepare];
    }
    return self;
}


- (void)prepare {
    [[NSBundle mainBundle] loadNibNamed:@"CustomDigitView" owner:self options:nil];
    [self addSubview:self.contentView];
    self.contentView.frame = self.bounds;
   
}
-(void)clearDigit{
   
    [self.digitOne setHidden:NO];
    [self.digitTwo setHidden:NO];
     [self.digitThree setHidden:NO];
     [self.digitFour setHidden:NO];
    [self.digitFive setHidden:NO];
     [self.digitSix setHidden:NO];
    [self.digitSeven setHidden:NO];
}


-(void)setColor:(UIColor *) colorValue
{
    
    
    [self.digitOne setBackgroundColor:colorValue];
    [self.digitTwo setBackgroundColor:colorValue];
    [self.digitThree setBackgroundColor:colorValue];
    [self.digitFour setBackgroundColor:colorValue];
    [self.digitFour setBackgroundColor:colorValue];
    [self.digitFive setBackgroundColor:colorValue];
    [self.digitSix setBackgroundColor:colorValue];
    [self.digitSeven setBackgroundColor:colorValue];
    
}



-(void)setDigit:(int) digit{
    [self clearDigit];
    switch (digit) {
        case 0:
             [self.digitFour setHidden:YES];
            break;
            
        case 1:
            [self.digitFour setHidden:YES];
            [self.digitOne setHidden:YES];
            [self.digitTwo setHidden:YES];
            [self.digitFive setHidden:YES];
            [self.digitSeven setHidden:YES];
            break;
            
        case 2:
            [self.digitTwo setHidden:YES];
            [self.digitSix setHidden:YES];
            break;
            
        case 3:
            [self.digitTwo setHidden:YES];
            [self.digitFive setHidden:YES];
            break;
            
        case 4:
            [self.digitOne setHidden:YES];
            [self.digitFive setHidden:YES];
            [self.digitSeven setHidden:YES];
            break;
        case 5:
            [self.digitThree setHidden:YES];
            [self.digitFive setHidden:YES];
            break;
            
        case 6:
             [self.digitThree setHidden:YES];
            break;
            
        case 7:
            [self.digitTwo setHidden:YES];
            [self.digitFour setHidden:YES];
            [self.digitFive setHidden:YES];
            [self.digitSeven setHidden:YES];
            break;
            
        case 8:
            [self.digitOne setHidden:NO];
            [self.digitTwo setHidden:NO];
            [self.digitThree setHidden:NO];
            [self.digitFour setHidden:NO];
            [self.digitFive setHidden:NO];
            [self.digitSeven setHidden:NO];
            [self.digitSix setHidden:NO];
            break;
            
        case 9:
            [self.digitFive setHidden:YES];
            [self.digitSeven setHidden:YES];
            break;
            
        default:
            break;
    }
}



@end
