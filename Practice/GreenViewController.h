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
@property (nonatomic, weak) NSString *imageFromSegue;
@property (nonatomic, weak) NSString *nameFromSegue;
@property (nonatomic, weak) NSString *addressFromSegue;
@property BOOL pendingFromSegue;
@property float averageFromSegue;
@end

NS_ASSUME_NONNULL_END
