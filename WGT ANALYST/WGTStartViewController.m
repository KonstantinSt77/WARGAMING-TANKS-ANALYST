//
//  WGTStartViewController.m
//  WGT ANALYST
//
//  Created by Kostya on 10.08.16.
//  Copyright © 2016 Stolyarenko K.S. All rights reserved.
//

#import "WGTStartViewController.h"

@interface WGTStartViewController ()

@end

@implementation WGTStartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
[[self navigationController] setNavigationBarHidden:YES animated:YES];

}


- (IBAction)pushViewController:(id)sender
{
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.title = @"Pushed Controller";
    viewController.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
