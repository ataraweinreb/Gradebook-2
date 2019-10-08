//
//  GreenViewController.h
//  Practice
//
//  Created by Atara Weinreb on 10/7/19.
//  Copyright © 2019 Atara Weinreb. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GreenViewController : UIViewController
@property (nonatomic, weak) NSString *passedImage;
@property (nonatomic, weak) NSString *passedName;
@property (nonatomic, weak) NSString *passedAddress;
@property float passedAverage;
@end

NS_ASSUME_NONNULL_END
