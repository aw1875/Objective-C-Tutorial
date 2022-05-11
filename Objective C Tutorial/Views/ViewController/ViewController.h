//
//  ViewController.h
//  Objective C Tutorial
//
//  Created by Adam Wolf on 5/9/22.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController

/*!
 @brief Fetch course data from API and set self courses to serialized data
 */
- (void)fetchCourses;

@end

