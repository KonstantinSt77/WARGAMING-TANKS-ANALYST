//
//  WGTRootViewController.m
//  WGT ANALYST
//
//  Created by Kostya on 16.08.16.
//  Copyright © 2016 Stolyarenko K.S. All rights reserved.
//

#import "WGTRootViewController.h"
#import "WGTMenuViewController.h"

@interface WGTRootViewController ()

@end

@implementation WGTRootViewController

- (void)awakeFromNib
{
    self.menuPreferredStatusBarStyle = UIStatusBarStyleLightContent;
    self.contentViewShadowColor = [UIColor blackColor];
    self.contentViewShadowOffset = CGSizeMake(0, 0);
    self.contentViewShadowOpacity = 0.2;
    self.contentViewShadowRadius = 2;
    self.contentViewShadowEnabled = YES;
    self.bouncesHorizontally = NO;
    self.parallaxEnabled =YES;
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentViewController"];
    self.leftMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"leftMenuViewController"];
    self.backgroundImage = [UIImage imageNamed:@"Stars"];
    self.delegate = self;
}

@end
