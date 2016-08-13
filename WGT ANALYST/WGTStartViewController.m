//
//  WGTStartViewController.m
//  WGT ANALYST
//
//  Created by Kostya on 10.08.16.
//  Copyright © 2016 Stolyarenko K.S. All rights reserved.
//

#import "WGTStartViewController.h"

@interface WGTStartViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *wotl;

@end

@implementation WGTStartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
[[self navigationController] setNavigationBarHidden:YES animated:YES];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval: 3.0
                                                      target: self
                                                    selector:@selector(logoTwoAnimation)
                                                    userInfo: nil repeats:YES];
}

-(void)logoTwoAnimation
{
   // [self.wotl pulse:NULL];
    [self.wotl bounce:NULL];
}

@end
