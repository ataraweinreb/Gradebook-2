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
}

- (IBAction)submitButtom:(UIButton *)sender {
    
    StudentInfo *redStudent = [[StudentInfo alloc] init];
    
    if (_studentName.text.length == 0 || _studentAddress.text.length == 0 ||
        [_studentName.text  isEqualToString:@"Error! Missing student's name!"] || [_studentAddress.text isEqualToString:@"Error! Missing student's address!"]){
        NSLog(@"Error! Missing student's name and/or address!");
        if (_studentName.text.length == 0) {
            _studentName.text = @"Error! Missing student's name!";
        }
        if (_studentAddress.text.length == 0) {
            _studentAddress.text = @"Error! Missing student's address!";
        }
        return;
    }
    redStudent.Name = _studentName.text;
    redStudent.Address = _studentAddress.text;
    
    BOOL midtermPending = NO, finalPending = NO, hw1Pending = NO, hw2Pending = NO, hw3Pending = NO;
    
    if (_midterm.text.length == 0)
        midtermPending = YES;
    if (_final.text.length == 0)
        finalPending = YES;
    if (_hw1.text.length == 0)
        hw1Pending = YES;
    if (_hw2.text.length == 0)
        hw2Pending = YES;
    if (_hw3.text.length == 0)
        hw3Pending = YES;
    if (midtermPending || finalPending || hw1Pending || hw2Pending || hw3Pending)
        _pending = YES;
    
    redStudent.pending = _pending;
    redStudent.midtermPending = midtermPending;
    redStudent.finalPending = finalPending;
    redStudent.hw1Pending = hw1Pending;
    redStudent.hw2Pending = hw2Pending;
    redStudent.hw3Pending = hw3Pending;
    redStudent.Midterm = [_midterm.text floatValue];
    redStudent.Final = [_final.text intValue];
    redStudent.Homework1 = [_hw1.text floatValue];
    redStudent.Homework2 = [_hw2.text floatValue];
    redStudent.Homework3 = [_hw3.text floatValue];
    if (_photoFile.text.length == 0) { //use default picture
        redStudent.Img = @"person.jpg";
    }
    else {
        redStudent.Img = _photoFile.text;
    }
    [_myArrayFromSegue addObject:redStudent];
    [self performSegueWithIdentifier:@"blue" sender:self];
}

@end
