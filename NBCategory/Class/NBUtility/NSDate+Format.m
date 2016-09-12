//
//  NSDate+Format.m
//  NBCategory
//
//  Created by 刘彬 on 16/3/19.
//  Copyright © 2016年 NewBee. All rights reserved.
//

#import "NSDate+Format.h"

@implementation NSDate (Format)

+ (NSDate *)nb_dateWithString:(NSString *)timeStr format:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    if ([format length]) {
        formatter.dateFormat = format;
    }
    NSDate *timeStrDate = [formatter dateFromString:timeStr];
    return timeStrDate;
}

+ (NSString *)nb_currentTimeWithFormat:(NSString *)format {
    NSDate *now = [[NSDate alloc] init];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    if ([format length]) {
        formatter.dateFormat = format;
    }
    NSString *time = [formatter stringFromDate:now];
    return time;
}

+ (NSString *)nb_currentTimeInterval{
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
    return [NSString stringWithFormat:@"%.0f", [date timeIntervalSince1970]];
}

- (NSDate *)nb_dateByAppendingYears:(NSInteger)years{
    if (years <= 0){
        return self;
    }
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setYear:years];
    return [gregorian dateByAddingComponents:offsetComponents toDate:self options:0];
}

- (NSDate *)nb_dateByAppendingMonths:(NSInteger)months{
    if (months <= 0){
        return self;
    }
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMonth:months];
    return [gregorian dateByAddingComponents:offsetComponents toDate:self options:0];
}

- (NSDate *)nb_dateByAppendingDays:(NSInteger)days{
    if (days <= 0){
        return self;
    }
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:days];
    
    return [gregorian dateByAddingComponents:offsetComponents toDate:self options:0];
}

- (NSDate *)nb_dateByAppendingHours:(NSInteger)hours{
    if (hours <= 0){
        return self;
    }
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setHour:hours];
    return [gregorian dateByAddingComponents:offsetComponents toDate:self options:0];
}

- (NSDate *)nb_dateByAppendingMinutes:(NSInteger)minutes{
    if (minutes <= 0){
        return self;
    }
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMinute:minutes];
    return [gregorian dateByAddingComponents:offsetComponents toDate:self options:0];
}

- (NSDate *)nb_dateByAppendingSeconds:(NSInteger)seconds{
    if (seconds <= 0){
        return self;
    }
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setSecond:seconds];
    return [gregorian dateByAddingComponents:offsetComponents toDate:self options:0];
}

- (NSString *)nb_briefString{
    NSTimeInterval dateTime = [self timeIntervalSince1970] * 1;
    long long milliseconds = (long long)dateTime*1000;
    return [NSDate nb_briefStringWithTimeInterval:milliseconds];
}

+ (NSString *)nb_briefStringWithTimeInterval:(long long)time{
    NSDate *nowDate = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval nowTime = [nowDate timeIntervalSince1970] * 1;
    NSTimeInterval publishTime = time/1000.0;
    NSTimeInterval spacingTime = nowTime - publishTime;
    
    NSString *timeString = @"";
    
    if (spacingTime < 10) {
        timeString = [NSString stringWithFormat:@"刚刚"];
    }
    else if (spacingTime >= 10 && spacingTime < 60) {
        timeString = [NSString stringWithFormat:@"%f", spacingTime];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString = [NSString stringWithFormat:@"%@秒前", timeString];
    }
    else if (spacingTime >= 60 && spacingTime < 3600) {
        timeString = [NSString stringWithFormat:@"%f", spacingTime/60];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString = [NSString stringWithFormat:@"%@分钟前", timeString];
    }
    else if (spacingTime >= 3600 && spacingTime < 86400) {
        timeString = [NSString stringWithFormat:@"%f", spacingTime/3600];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString = [NSString stringWithFormat:@"%@小时前", timeString];
    }
    else if (spacingTime >= 86400 && spacingTime < 86400*3)
    {
        timeString = [NSString stringWithFormat:@"%f", spacingTime/86400];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString = [NSString stringWithFormat:@"%@天前", timeString];
    }
    else
    {
        NSDate *publishDate = [[NSDate alloc] initWithTimeInterval:-spacingTime sinceDate:nowDate];
        NSDateFormatter *formatter =[[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        NSString *publishDateString = [formatter stringFromDate:publishDate];
        NSString *publishYearString = [publishDateString substringToIndex:4];
        NSString *nowYearString = [[formatter stringFromDate:nowDate] substringToIndex:4];
        if ([nowYearString isEqualToString:publishYearString]) {
            publishDateString = [publishDateString substringFromIndex:5];
        }
        timeString = [NSString stringWithFormat:@"%@", publishDateString];
    }
    return timeString;
}

#pragma mark - getter
- (NSInteger)nb_year {
    NSCalendar* calender = [NSCalendar currentCalendar];
    NSDateComponents* dateComp = [calender components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:self];
    return [dateComp year];
}
- (NSInteger)nb_month {
    NSCalendar* calender = [NSCalendar currentCalendar];
    NSDateComponents* dateComp = [calender components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:self];
    return [dateComp month];
}
- (NSInteger)nb_day {
    NSCalendar* calender = [NSCalendar currentCalendar];
    NSDateComponents* dateComp = [calender components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:self];
    return [dateComp day];
}
- (NSInteger)nb_hour{
    NSCalendar* calender = [NSCalendar currentCalendar];
    NSDateComponents* dateComp = [calender components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:self];
    return [dateComp hour];
}
- (NSInteger)nb_minute
{
    NSCalendar* calender = [NSCalendar currentCalendar];
    NSDateComponents* dateComp = [calender components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:self];
    return [dateComp minute];
}
- (NSInteger)nb_second
{
    NSCalendar* calender = [NSCalendar currentCalendar];
    NSDateComponents* dateComp = [calender components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:self];
    return [dateComp second];
}

@end
