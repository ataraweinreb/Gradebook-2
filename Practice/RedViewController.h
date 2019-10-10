//
//  RedViewController.h
//  Practice
//
//  Created by Atara Weinreb on 10/7/19.
//  Copyright © 2019 Atara Weinreb. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RedViewController : UIViewController
@property int passedIndex;
@property (nonatomic, weak) NSMutableArray *passedMyArray;
@property (nonatomic, weak) NSString *redStudentName;
@property (nonatomic, weak) NSString *redStudentAddress;
@property (nonatomic, weak) NSString *redMidterm;
@property (nonatomic, weak) NSString *redFinal;
@property (nonatomic, weak) NSString *redHW1;
@property (nonatomic, weak) NSString *redHW2;
@property (nonatomic, weak) NSString *redHW3;
@property (nonatomic, weak) NSString *redPhotoName;
@property Boolean pending;
@end

NS_ASSUME_NONNULL_END
