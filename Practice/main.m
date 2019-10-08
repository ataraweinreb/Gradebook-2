//
//  main.m
//  Practice
//
//  Created by Atara Weinreb on 10/7/19.
//  Copyright © 2019 Atara Weinreb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "StudentInfo.h"

NSMutableArray *myArray;

void removeAllStudents() {
    if ([myArray count] == 0)
        return;
    [myArray removeAllObjects];
}

void removeStudent(StudentInfo *student) {
    if (![myArray containsObject:student]) {
        return;
    }
    [myArray removeObject:student];
}

BOOL studentAverage(StudentInfo *student) {
    if (![myArray containsObject:student])
        return false;
    float midterm = [student Midterm];
    float final = [student Final];
    int homework1 = [student Homework1];
    int homework2 = [student Homework2];
    int homework3 = [student Homework3];
    int homework = (homework1 + homework2 + homework3) * 10 /3; //homework is graded out of 10

    if (midterm < 0 || final < 0 || homework1 < 0 || homework2 < 0 || homework3 < 0)
        return false;
    float avg = (midterm * .30) + (final * .40) + (homework * .30);
    NSLog(@"Student average: %.1f", avg);
    return true;
}

void printObject(StudentInfo *student) {
NSLog(@"\n****************************************\n\n\n\tName: %@\n\tAddress: %@\n\tMidterm: %.1f\n\tFinal: %.1f\n\tHomework #1: %.d\n\tHomework #2: %d\n\tHomework #3: %d\n\n\n****************************************", (NSString *)student.Name, (NSString *)student.Address, student.Midterm, student.Final, student.Homework1, student.Homework2, student.Homework3);
}

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

BOOL addTest(NSString *name, float score, NSString *test) {
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

BOOL addHomework(NSString *student, int assignment, int score) {
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

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        //Starter Data
        //Student #1
        addStudent(@"Bob", @"100 Central Ave");
        addTest(@"Bob", 85, @"midterm");
        addTest(@"Bob", 95, @"final");
        addHomework(@"Bob", 1, 7);
        addHomework(@"Bob", 2, 6);
        addHomework(@"Bob", 3, 10);
        addImg(@"Bob", @"bob.jpg");
        
        //Student #2
        addStudent(@"Molly", @"80 Charles St");
        addTest(@"Molly", 70, @"midterm");
        addTest(@"Molly", 65, @"final");
        addHomework(@"Molly", 1, 7);
        addHomework(@"Molly", 2, 4);
        addHomework(@"Molly", 3, 9);
        addImg(@"Molly", @"molly.jpg");
        
        //Student #3
        addStudent(@"Carol", @"12 Virginia St");
        addTest(@"Carol", 100, @"midterm");
        addTest(@"Carol", 98.5, @"final");
        addHomework(@"Carol", 1, 9);
        addHomework(@"Carol", 2, 10);
        addHomework(@"Carol", 3, 10);
        addImg(@"Carol", @"carol.jpg");
        
        //Student #4
        addStudent(@"David", @"44 Crestwood Rd");
        addTest(@"David", 77, @"midterm");
        addTest(@"David", 82.5, @"final");
        addHomework(@"David", 1, 10);
        addHomework(@"David", 2, 3);
        addHomework(@"David", 3, 6);
        addImg(@"David", @"david.jpg");
        
        //Student #5
        addStudent(@"Sarah", @"111 Woodmere Place");
        addTest(@"Sarah", 45, @"midterm");
        addTest(@"Sarah", 55, @"final");
        addHomework(@"Sarah", 1, 6);
        addHomework(@"Sarah", 2, 2);
        addHomework(@"Sarah", 3, 4);
        addImg(@"Sarah", @"sarah.jpg");
        
        enumerateAllStudents();
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
