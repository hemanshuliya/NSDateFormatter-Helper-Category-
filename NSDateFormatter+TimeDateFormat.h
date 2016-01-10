//
//  NSDateFormatter+TimeDateFormat.h
//  EventApp
//
//  Created by Hemanshu Liya on 10/01/16.
//  Copyright © 2016 Hemanshu Liya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (TimeDateFormat)


+ (NSDateFormatter *) getInstance;
-(NSString *)setDateAccordingToTimeZone:(NSDate *)date withTimeZone:(NSString *)selectedTimeZone;

@end
