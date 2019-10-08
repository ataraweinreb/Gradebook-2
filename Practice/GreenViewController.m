//
//  GreenViewController.m
//  Practice
//
//  Created by Atara Weinreb on 10/7/19.
//  Copyright © 2019 Atara Weinreb. All rights reserved.
//

#import "GreenViewController.h"

@interface GreenViewController ()
@property (weak, nonatomic) IBOutlet UILabel *studentName;
@property (weak, nonatomic) IBOutlet UILabel *studentAddress;
@property (weak, nonatomic) IBOutlet UILabel *studentAverage;
@property (weak, nonatomic) IBOutlet UIImageView *studentImage;

@end

@implementation GreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _studentName.text = _passedName;
    _studentAddress.text = _passedAddress;
    _studentAverage.text = [NSString stringWithFormat:@"%.1f", _passedAverage];
    _studentImage.image = [UIImage imageNamed:_passedImage];
}

@end
