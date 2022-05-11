//
//  Course.h
//  Objective C Tutorial
//
//  Created by Adam Wolf on 5/10/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Course : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *link;
@property (strong, nonatomic) NSString *imageUrl;
@property (strong, nonatomic) NSNumber *numberOfLessons;

- (instancetype)init:(NSString *)name link:(NSString *)link imageUrl:(NSString *)imageUrl numberOfLessons:(NSNumber *)numberOfLessions;

+ (Course *)initFromDictionary:(NSDictionary *)dictionary;

+ (NSString *)toString:(Course *)course;

@end

NS_ASSUME_NONNULL_END
