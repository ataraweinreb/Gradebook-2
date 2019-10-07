//
//  ViewController.m
//  Practice
//
//  Created by Atara Weinreb on 10/7/19.
//  Copyright © 2019 Atara Weinreb. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

