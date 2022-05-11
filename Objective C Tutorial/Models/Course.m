//
//  Course.m
//  Objective C Tutorial
//
//  Created by Adam Wolf on 5/10/22.
//

#import "Course.h"

@implementation Course

- (instancetype)init:(NSString *)name link:(NSString *)link imageUrl:(NSString *)imageUrl numberOfLessons:(NSNumber *)numberOfLessions {
    if (self = [super init]) {
        _name = name;
        _link = link;
        _imageUrl = imageUrl;
        _numberOfLessons = numberOfLessions;
    }
    
    return self;
}

+ (Course *)initFromDictionary:(NSDictionary *)dictionary {
    Course *course = nil;
    
    NSString *name = dictionary[@"name"];
    NSString *link = dictionary[@"link"];
    NSString *imageUrl = dictionary[@"imageUrl"];
    NSNumber *numberOfLessons = dictionary[@"numberOfLessons"];
    
    if (name && link && imageUrl && numberOfLessons) {
        course = [[Course alloc] init:name link:link imageUrl:imageUrl numberOfLessons:numberOfLessons];
    }
    
    return course;
}

+ (NSString *)toString:(Course *)course {
    return [NSString stringWithFormat:@"\rCourse Name: %@\rCourse Link: %@\rCourse ImageUrl: %@\rNumber Of Lessons: %@", course.name, course.link, course.imageUrl, course.numberOfLessons];
}

@end
