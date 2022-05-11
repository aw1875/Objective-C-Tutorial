//
//  CourseTableViewCell.h
//  Objective C Tutorial
//
//  Created by Adam Wolf on 5/10/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CourseTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *courseImage;
@property (strong, nonatomic) IBOutlet UILabel *courseName;
@property (strong, nonatomic) IBOutlet UILabel *courseLessons;


@end

NS_ASSUME_NONNULL_END
