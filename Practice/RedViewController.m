//
//  RedViewController.m
//  Practice
//
//  Created by Atara Weinreb on 10/7/19.
//  Copyright © 2019 Atara Weinreb. All rights reserved.
//

#import "RedViewController.h"
#import "StudentInfo.h"

@interface RedViewController ()
@property (weak, nonatomic) IBOutlet UITextField *studentName;
@property (weak, nonatomic) IBOutlet UITextField *studentAddress;
@property (weak, nonatomic) IBOutlet UITextField *midterm;
@property (weak, nonatomic) IBOutlet UITextField *final;
@property (weak, nonatomic) IBOutlet UITextField *hw1;
@property (weak, nonatomic) IBOutlet UITextField *hw2;
@property (weak, nonatomic) IBOutlet UITextField *hw3;
@property (weak, nonatomic) IBOutlet UITextField *photoFile;
@end

@implementation RedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)submitButtom:(UIButton *)sender {
    if (_studentName.text == nil || _studentAddress.text == nil) {
        //Add alert vc later
        NSLog(@"There is missing data.");
    }
    else {
        _redStudentName = _studentName.text;
        _redStudentAddress = _studentAddress.text;
        if (_midterm.text == nil || _final.text == nil || _hw1.text == nil || _hw2.text == nil || _hw3.text == nil) {
            _pending = YES;
        }
        _redHW1 = _hw1.text;
        _redHW2 = _hw2.text;
        _redHW3 = _hw3.text;
        if (_photoFile.text == nil) {
            _redPhotoName = @"person.jpg";
        }
        else {
            _redPhotoName = _photoFile.text;
        }
        //save person to array
        StudentInfo *redStudent = [[StudentInfo alloc] init];
        redStudent.Name = _redStudentName;
        redStudent.Address = _redStudentAddress;
        redStudent.Midterm = [_redMidterm intValue];
        redStudent.Final = [_redFinal intValue];
        redStudent.Homework1 = [_redHW1 floatValue];
        redStudent.Homework2 = [_redHW2 floatValue];
        redStudent.Homework3 = [_redHW3 floatValue];
        redStudent.Img = _redPhotoName;
        [_passedMyArray addObject:redStudent];
        
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
