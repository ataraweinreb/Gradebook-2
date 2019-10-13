//
//  ViewController.m
//  Practice
//
//  Created by Atara Weinreb on 10/7/19.
//  Copyright © 2019 Atara Weinreb. All rights reserved.
//

//forwards , backwards, display and new studemt

#import "ViewController.h"
#import "StudentInfo.h"
#import "GreenViewController.h"
#import "RedViewController.h"
#import <Foundation/Foundation.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *StudentLabel;
@property (weak, nonatomic) IBOutlet UITextField *AddressLabel;
@property (weak, nonatomic) IBOutlet UITextField *MidtermLabel;
@property (weak, nonatomic) IBOutlet UITextField *FinalLabel;
@property (weak, nonatomic) IBOutlet UITextField *HW1Label;
@property (weak, nonatomic) IBOutlet UITextField *HW2Label;
@property (weak, nonatomic) IBOutlet UITextField *HW3Label;
@property (weak, nonatomic) IBOutlet UIButton *forwards;
@property (weak, nonatomic) IBOutlet UIButton *backwards;
@end

@implementation ViewController

//Student methods
NSMutableArray *myArray;

void removeStudent(StudentInfo *student) {
    if (![myArray containsObject:student]) {
        return;
    }
    [myArray removeObject:student];
}

float studentAverage(StudentInfo *student) {
    if (![myArray containsObject:student])
        return -999;
    float midterm = [student Midterm];
    float final = [student Final];
    int homework1 = [student Homework1];
    int homework2 = [student Homework2];
    int homework3 = [student Homework3];
    int homework = (homework1 + homework2 + homework3) * 10 /3; //homework is graded out of 10
    if ([student pending] || midterm < 0 || final < 0 || homework1 < 0 || homework2 < 0 || homework3 < 0)
        return -999;
    float avg = (midterm * .30) + (final * .40) + (homework * .30);
    return avg;
}

//For debugging
void printObject(StudentInfo *student) {
    NSLog(@"\n****************************************\n\n\n\tName: %@\n\tAddress: %@\n\tMidterm: %.1f\n\tFinal: %.1f\n\tHomework #1: %.d\n\tHomework #2: %d\n\tHomework #3: %d\n\n\n****************************************", (NSString *)student.Name, (NSString *)student.Address, student.Midterm, student.Final, student.Homework1, student.Homework2, student.Homework3);
}

//For debugging
void enumerateAllStudents() {
    for(int i = 0; i < myArray.count; i++) {
        StudentInfo *temp = myArray[i];
        printObject(temp);
    }
}

BOOL addStudent(NSString *name, NSString *address) {
    StudentInfo *student = [[StudentInfo alloc] init];
    [student setName:name];
    [student setAddress:address];
    [student setMidterm:-999];
    [student setFinal:-999];
    [student setHomework1:-999];
    [student setHomework2:-999];
    [student setHomework3:-999];
    [student setImg:@"person.jpg"];
    if (!myArray) {
        myArray = [[NSMutableArray alloc] init];
        [myArray addObject:student];
        return true;
    }
    else if ([myArray containsObject:student]){ //duplicate
        return false;
    }
    else {
        [myArray addObject:student];
        return true;
    }
}

BOOL addTestScore(NSString *name, float score, NSString *test) {
    for (int i = 0; i < myArray.count; i++) {
        if ([myArray[i] Name] == name) {
            if ([test isEqualToString:@"midterm"])
                [myArray[i] setMidterm:score];
            else if ([test isEqualToString:@"final"])
                [myArray[i] setFinal:score];
            else
                return false;
            return true;
        }
    }
    return false;
}

BOOL addHomeworkScore(NSString *student, int assignment, int score) {
    if (assignment < 1 || assignment > 3)
        return false;
    int index = -1;
    for (int i = 0; i < myArray.count; i++) {
        if ([myArray[i] Name] == student)
            index = i;
    }
    if (index == -1)
        return false;
    if (assignment == 1)
        [myArray[index] setHomework1:score];
    else if (assignment == 2)
        [myArray[index] setHomework2:score];
    else if (assignment == 3)
        [myArray[index] setHomework3:score];
    return true;
}

BOOL addImg(NSString *student, NSString *imgName) {
    int index = -1;
    for (int i = 0; i < myArray.count; i++) {
        if ([myArray[i] Name] == student)
            index = i;
    }
    if (index == -1)
        return false;
    [myArray[index] setImg:imgName];
    return true;
}

void createInitialData() {
    //Student #0
    addStudent(@"Bob", @"100 Central Ave");
    addTestScore(@"Bob", 85, @"midterm");
    addTestScore(@"Bob", 95, @"final");
    addHomeworkScore(@"Bob", 1, 7);
    addHomeworkScore(@"Bob", 2, 6);
    addHomeworkScore(@"Bob", 3, 10);
    addImg(@"Bob", @"bob.jpg");
    
    //Student #1
    addStudent(@"Molly", @"80 Charles St");
    addTestScore(@"Molly", 79, @"midterm");
    addTestScore(@"Molly", 88, @"final");
    addHomeworkScore(@"Molly", 1, 7);
    addHomeworkScore(@"Molly", 2, 4);
    addHomeworkScore(@"Molly", 3, 9);
    addImg(@"Molly", @"molly.jpg");
    
    //Student #2
    addStudent(@"Carol", @"12 Virginia St");
    addTestScore(@"Carol", 100, @"midterm");
    addTestScore(@"Carol", 98.5, @"final");
    addHomeworkScore(@"Carol", 1, 9);
    addHomeworkScore(@"Carol", 2, 10);
    addHomeworkScore(@"Carol", 3, 10);
    addImg(@"Carol", @"carol.jpg");
    
    //Student #3
    addStudent(@"David", @"44 Crestwood Rd");
    addTestScore(@"David", 77, @"midterm");
    addTestScore(@"David", 82.5, @"final");
    addHomeworkScore(@"David", 1, 10);
    addHomeworkScore(@"David", 2, 3);
    addHomeworkScore(@"David", 3, 6);
    addImg(@"David", @"david.jpg");
    
    //Student #4
    addStudent(@"Sarah", @"111 Woodmere Place");
    addTestScore(@"Sarah", 85, @"midterm");
    addTestScore(@"Sarah", 77, @"final");
    addHomeworkScore(@"Sarah", 1, 6);
    addHomeworkScore(@"Sarah", 2, 2);
    addHomeworkScore(@"Sarah", 3, 4);
    addImg(@"Sarah", @"sarah.jpg");
}

int buttonIndex = 0;
BOOL firstLoad = YES;

- (void)viewDidLoad {
    [super viewDidLoad];

    if (firstLoad) {
        createInitialData();
        firstLoad = NO;
    }
    
    _StudentLabel.text = [myArray[buttonIndex] Name];
    _AddressLabel.text = [myArray[buttonIndex] Address];
    if (!([myArray[buttonIndex] Midterm] == -999) && ![myArray[buttonIndex] midtermPending]){
        _MidtermLabel.text = [NSString stringWithFormat:@"%.1f", [myArray[buttonIndex] Midterm]];
    }
    else {
        _MidtermLabel.text = @"";
    }
    if (!([myArray[buttonIndex] Final] == -999) && ![myArray[buttonIndex] finalPending]){
        _FinalLabel.text = [NSString stringWithFormat:@"%.1f", [myArray[buttonIndex] Final]];
    }
    else {
        _FinalLabel.text = @"";
    }
    if (!([myArray[buttonIndex] Homework1] == -999) && ![myArray[buttonIndex] hw1Pending]){
        _HW1Label.text = [NSString stringWithFormat:@"%d", [myArray[buttonIndex] Homework1]];
    }
    else {
        _HW1Label.text = @"";
    }
    if (!([myArray[buttonIndex] Homework2] == -999) && ![myArray[buttonIndex] hw2Pending]){
        _HW2Label.text = [NSString stringWithFormat:@"%d", [myArray[buttonIndex] Homework2]];
    }
    else {
        _HW2Label.text = @"";
    }
    if (!([myArray[buttonIndex] Homework3] == -999) && ![myArray[buttonIndex] hw3Pending]){
        _HW3Label.text = [NSString stringWithFormat:@"%d", [myArray[buttonIndex] Homework3]];
    }
    else {
        _HW3Label.text = @"";
    }
}

void saveStudentInfo(UITextField *StudentLabel, UITextField *AddressLabel, UITextField *MidtermLabel, UITextField *FinalLabel, UITextField *HW1Label, UITextField *HW2Label, UITextField *HW3Label) {
    //Save changes
    StudentInfo *current = myArray[buttonIndex];
    current.Name = StudentLabel.text;
    current.Address = AddressLabel.text;
    if (MidtermLabel.text.length == 0) {
        current.Midterm = -999;
    }
    else {
        current.Midterm = [MidtermLabel.text floatValue];
    }
    if (FinalLabel.text.length == 0) {
        current.Final = -999;
    }
    else {
        current.Final = [FinalLabel.text floatValue];
    }
    if (HW1Label.text.length == 0) {
        current.Homework1 = -999;
    }
    else {
        current.Homework1 = [HW1Label.text intValue];
    }
    if (HW2Label.text.length == 0) {
        current.Homework2 = -999;
    }
    else {
        current.Homework2 = [HW2Label.text intValue];
    }
    if (HW3Label.text.length == 0) {
        current.Homework3 = -999;
    }
    else {
        current.Homework3 = [HW3Label.text intValue];
    }
    //END OF SAVE
}

//Actions
- (IBAction)backwardsButton:(UIButton *)sender {
    saveStudentInfo(_StudentLabel, _AddressLabel, _MidtermLabel, _FinalLabel, _HW1Label, _HW2Label, _HW3Label);

    if (buttonIndex > 0)
        buttonIndex--;
    
    _StudentLabel.text = [myArray[buttonIndex] Name];
    _AddressLabel.text = [myArray[buttonIndex] Address];
    if (!([myArray[buttonIndex] Midterm] == -999) && ![myArray[buttonIndex] midtermPending]){
        _MidtermLabel.text = [NSString stringWithFormat:@"%.1f", [myArray[buttonIndex] Midterm]];
    }
    else {
        _MidtermLabel.text = @"";
    }
    if (!([myArray[buttonIndex] Final] == -999) && ![myArray[buttonIndex] finalPending]){
        _FinalLabel.text = [NSString stringWithFormat:@"%.1f", [myArray[buttonIndex] Final]];
    }
    else {
        _FinalLabel.text = @"";
    }
    if (!([myArray[buttonIndex] Homework1] == -999) && ![myArray[buttonIndex] hw1Pending]){
        _HW1Label.text = [NSString stringWithFormat:@"%d", [myArray[buttonIndex] Homework1]];
    }
    else {
        _HW1Label.text = @"";
    }
    if (!([myArray[buttonIndex] Homework2] == -999) && ![myArray[buttonIndex] hw2Pending]){
        _HW2Label.text = [NSString stringWithFormat:@"%d", [myArray[buttonIndex] Homework2]];
    }
    else {
        _HW2Label.text = @"";
    }
    if (!([myArray[buttonIndex] Homework3] == -999) && ![myArray[buttonIndex] hw3Pending]){
        _HW3Label.text = [NSString stringWithFormat:@"%d", [myArray[buttonIndex] Homework3]];
    }
    else {
        _HW3Label.text = @"";
    }
}

- (IBAction)forwardsButton:(UIButton *)sender {
    saveStudentInfo(_StudentLabel, _AddressLabel, _MidtermLabel, _FinalLabel, _HW1Label, _HW2Label, _HW3Label);
    
    if (buttonIndex < myArray.count-1)
        buttonIndex++;
    
    _StudentLabel.text = [myArray[buttonIndex] Name];
    _AddressLabel.text = [myArray[buttonIndex] Address];
    if (!([myArray[buttonIndex] Midterm] == -999) && ![myArray[buttonIndex] midtermPending]){
        _MidtermLabel.text = [NSString stringWithFormat:@"%.1f", [myArray[buttonIndex] Midterm]];
    }
    else {
        _MidtermLabel.text = @"";
    }
    if (!([myArray[buttonIndex] Final] == -999) && ![myArray[buttonIndex] finalPending]){
        _FinalLabel.text = [NSString stringWithFormat:@"%.1f", [myArray[buttonIndex] Final]];
    }
    else {
        _FinalLabel.text = @"";
    }
    if (!([myArray[buttonIndex] Homework1] == -999) && ![myArray[buttonIndex] hw1Pending]){
        _HW1Label.text = [NSString stringWithFormat:@"%d", [myArray[buttonIndex] Homework1]];
    }
    else {
        _HW1Label.text = @"";
    }
    if (!([myArray[buttonIndex] Homework2] == -999) && ![myArray[buttonIndex] hw2Pending]){
        _HW2Label.text = [NSString stringWithFormat:@"%d", [myArray[buttonIndex] Homework2]];
    }
    else {
        _HW2Label.text = @"";
    }
    if (!([myArray[buttonIndex] Homework3] == -999) && ![myArray[buttonIndex] hw3Pending]){
        _HW3Label.text = [NSString stringWithFormat:@"%d", [myArray[buttonIndex] Homework3]];
    }
    else {
        _HW3Label.text = @"";
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    saveStudentInfo(_StudentLabel, _AddressLabel, _MidtermLabel, _FinalLabel, _HW1Label, _HW2Label, _HW3Label);
    
    if ([segue.identifier isEqualToString:@"green"]) {
        GreenViewController *greenVC = [segue destinationViewController];
        greenVC.nameFromSegue = [myArray[buttonIndex] Name];
        greenVC.addressFromSegue = [myArray[buttonIndex] Address];
        greenVC.imageFromSegue = [myArray[buttonIndex] Img];
        greenVC.averageFromSegue = studentAverage(myArray[buttonIndex]);
        greenVC.pendingFromSegue = [myArray[buttonIndex] pending];
    }
    else {
        RedViewController *redVC = [segue destinationViewController];
        redVC.myArrayFromSegue = myArray;
    }
}

- (IBAction)SegmentControl:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            break;
        case 1:
            [self performSegueWithIdentifier:@"green" sender:self];
            break;
        default:
             [self performSegueWithIdentifier:@"red" sender:self];
            break;
    }
}

@end

