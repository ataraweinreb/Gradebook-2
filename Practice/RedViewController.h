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
@property (nonatomic, weak) NSMutableArray *myArrayFromSegue;
@property Boolean pending;
@end

NS_ASSUME_NONNULL_END
