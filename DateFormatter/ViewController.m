//
//  ViewController.m
//  DateFormatter
//
//  Created by Andrew Zimmer on 5/29/12.
//  Copyright (c) 2012 Modea. All rights reserved.
//

#import "ViewController.h"
#import "NSDateFormatter+Additions.h"

@interface ViewController ()
-(void)updateDate:(NSTimer*)sender;
@end

@implementation ViewController
@synthesize date1;
@synthesize date2;
@synthesize date3;
@synthesize date4;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateDate:nil];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateDate:) userInfo:nil repeats:YES];
}

-(void)updateDate:(NSTimer*)sender {
    NSDate *date = [NSDate date];
    
    date1.text = [NSDateFormatter stringFromDate:date withFormat:
                  [NSString stringWithFormat:@"%@, %@ %@ %@", DAY_OF_WEEK_FORMAT, MONTH_FORMAT, DAY_OF_MONTH_FORMAT_NUM, YEAR_FORMAT_4]];
    
    date2.text = [NSDateFormatter stringFromDate:date withFormat:
                  [NSString stringWithFormat:@"%@:%@:%@ %@", HOUR_FORMAT, MINUTE_FORMAT, SECOND_FORMAT, AM_PM_FORMAT]];
    
    date3.text = [NSDateFormatter stringFromDate:date withFormat:
                  [NSString stringWithFormat:@"%@/%@/%@", DAY_OF_MONTH_FORMAT_NUM, MONTH_FORMAT_NUM, YEAR_FORMAT_2]];
    
    date4.text = [NSDateFormatter stringFromDate:date withFormat:
                  [NSString stringWithFormat:@"%@ - %@", TIMEZONE_FORMAT, BC_AD_FORMAT_FULL]];
}

- (void)viewDidUnload
{
    [self setDate1:nil];
    [self setDate2:nil];
    [self setDate3:nil];
    [self setDate4:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)dealloc {
    [date1 release];
    [date2 release];
    [date3 release];
    [date4 release];
    [super dealloc];
}
@end
