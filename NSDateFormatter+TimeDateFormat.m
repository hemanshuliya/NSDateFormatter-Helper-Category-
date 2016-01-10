//
//  NSDateFormatter+TimeDateFormat.m
//  EventApp
//
//  Created by Hemanshu Liya on 10/01/16.
//  Copyright © 2016 Hemanshu Liya. All rights reserved.
//

#import "NSDateFormatter+TimeDateFormat.h"


@implementation NSDateFormatter (TimeDateFormat)

//@dynamic selectedTimezone;

+ (NSDateFormatter *) getInstance {
    static dispatch_once_t onceMark;
    static NSDateFormatter *formatter = nil;
    
    dispatch_once(&onceMark, ^{
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MMM dd yyyy, hh:mm a"];
    });
    
    return formatter;
}

-(NSString *)setDateAccordingToTimeZone:(NSString *)selectedTimeZone andDate:(NSDate *)date{
    NSTimeZone *currentTimeZone = [NSTimeZone localTimeZone];
    NSTimeZone *utcTimeZone = [NSTimeZone timeZoneWithName:selectedTimeZone];
    
    NSInteger currentGMTOffset = [currentTimeZone secondsFromGMTForDate:[NSDate date]];
    NSInteger gmtOffset = [utcTimeZone secondsFromGMTForDate:[NSDate date]];
    NSTimeInterval gmtInterval = currentGMTOffset - gmtOffset;
    gmtInterval = gmtInterval*-1;
    
    NSDate *newDate = [[NSDate alloc] initWithTimeInterval:gmtInterval sinceDate:[NSDate date]] ;
    return  [self stringFromDate:newDate];
    
}

@end
