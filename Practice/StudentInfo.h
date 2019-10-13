//
//  StudentInfo.h
//  Practice
//
//  Created by Atara Weinreb on 10/7/19.
//  Copyright © 2019 Atara Weinreb. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StudentInfo : NSObject

@property NSString *Name;
@property NSString *Address;
@property float Midterm;
@property float Final;
@property int Homework1;
@property int Homework2;
@property int Homework3;
@property NSString *Img;
@property BOOL pending;
@property BOOL midtermPending;
@property BOOL finalPending;
@property BOOL hw1Pending;
@property BOOL hw2Pending;
@property BOOL hw3Pending;
@end

NS_ASSUME_NONNULL_END
