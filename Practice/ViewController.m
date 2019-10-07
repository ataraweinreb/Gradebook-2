//
//  ViewController.m
//  Practice
//
//  Created by Atara Weinreb on 10/7/19.
//  Copyright © 2019 Atara Weinreb. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//Display Labels
@property (weak, nonatomic) IBOutlet UILabel *StudentLabel;
@property (weak, nonatomic) IBOutlet UILabel *AddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *MidtermLabel;
@property (weak, nonatomic) IBOutlet UILabel *FinalLabel;
@property (weak, nonatomic) IBOutlet UILabel *HW1Label;
@property (weak, nonatomic) IBOutlet UILabel *HW2Label;
@property (weak, nonatomic) IBOutlet UILabel *HW3Label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//Actions
- (IBAction)backwardsButton:(UIButton *)sender {
}
- (IBAction)forwardsButton:(UIButton *)sender {
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

