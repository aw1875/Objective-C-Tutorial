//
//  ViewController.m
//  Objective C Tutorial
//
//  Created by Adam Wolf on 5/9/22.
//

#import "ViewController.h"
#import "Course.h"
#import "CourseTableViewCell.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray<Course *> *courses;

@end

@implementation ViewController

NSString *cellId = @"cellId";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Get courses from API
    [self fetchCourses];
    
    // Setup NavigationViewController Title
    self.navigationItem.title = @"Courses";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    
    // Register nib with custom table view cell
    [self.tableView registerNib:[UINib nibWithNibName:@"CourseTableViewCell" bundle:nil] forCellReuseIdentifier:cellId];
}

- (void)fetchCourses {
    
    NSURL *url = [NSURL URLWithString:@"https://api.letsbuildthatapp.com/jsondecodable/courses"];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *err;
        NSArray *coursesJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        
        if (err) {
            NSLog(@"Failed serializtion JSON data: %@", err);
            return;
        }
        
        NSMutableArray<Course *> *courses = NSMutableArray.new;
        
        for (NSDictionary *coursesDict in coursesJSON) {
            
            Course *course = [Course initFromDictionary:coursesDict];
            
            if (course) {
                [courses addObject:course];
            }
        }
        
        self.courses = courses;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    }] resume];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.courses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Course *course = self.courses[indexPath.row];
    
    // Dequeue custom table cell
    CourseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    // Get Image Data from course imageUrl
    NSData *imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: course.imageUrl]];
    
    // Set cell information with course information
    cell.courseImage.image = [UIImage imageWithData:imageData];
    cell.courseName.text = course.name;
    cell.courseLessons.text = [NSString stringWithFormat:@"%@ lessons", course.numberOfLessons];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UIScreen.mainScreen.bounds.size.height / 3;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Course *course = self.courses[indexPath.row];
    NSLog(@"%@", [Course toString: course]);
}


@end
