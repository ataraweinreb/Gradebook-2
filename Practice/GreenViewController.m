//
//  GreenViewController.m
//  Practice
//
//  Created by Atara Weinreb on 10/7/19.
//  Copyright © 2019 Atara Weinreb. All rights reserved.
//

#import "GreenViewController.h"
#import "StudentInfo.h"

@interface GreenViewController ()
@property (weak, nonatomic) IBOutlet UILabel *studentName;
@property (weak, nonatomic) IBOutlet UILabel *studentAddress;
@property (weak, nonatomic) IBOutlet UILabel *studentAverage;
@property (weak, nonatomic) IBOutlet UIImageView *studentImage;

@end

@implementation GreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _studentName.text = _nameFromSegue;
    _studentAddress.text = _addressFromSegue;
    
    if (_pendingFromSegue || _averageFromSegue == -999) { //score is pending
        _studentAverage.text = @"Pending";
    }
    else {
        _studentAverage.text = [NSString stringWithFormat:@"%.1f", _averageFromSegue];
    }
    _studentImage.image = [UIImage imageNamed:_imageFromSegue];
}

@end
