//
//  WGTServersViewController.m
//  WGT ANALYST
//
//  Created by Kostya on 15.08.16.
//  Copyright © 2016 Stolyarenko K.S. All rights reserved.
//

#import "WGTServersViewController.h"

@interface WGTServersViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *redServ;
@property (weak, nonatomic) IBOutlet UIImageView *blueServ;
@property (weak, nonatomic) IBOutlet UIImageView *greenServ;
@property (weak, nonatomic) IBOutlet UIImageView *orangeServ;
@property (weak, nonatomic) IBOutlet UIImageView *yelowServ;
@property (weak, nonatomic) IBOutlet UIImageView *pinkServ;
@property (weak, nonatomic) IBOutlet UIView *dote1;
@property (weak, nonatomic) IBOutlet UIView *dote2;
@property (weak, nonatomic) IBOutlet UIView *dote3;
@property (weak, nonatomic) IBOutlet UIView *dote4;
@property (weak, nonatomic) IBOutlet UIView *dote5;
@property (weak, nonatomic) IBOutlet UIView *dote6;
@property (weak, nonatomic) IBOutlet UIView *viewtoanimate;

@end

@implementation WGTServersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:YES animated:YES];

NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval: 1.0
                                                  target: self
                                                selector:@selector(serversAnimation)
                                                userInfo: nil repeats:YES];
}


-(void)serversAnimation
{
//    [self.redServ pulse:NULL];
//    [self.blueServ pulse:NULL];
//    [self.greenServ pulse:NULL];
//    [self.orangeServ pulse:NULL];
//    [self.yelowServ pulse:NULL];
//    [self.pinkServ pulse:NULL];
    
    [self.dote1 expandIntoView:self.viewtoanimate finished:NULL];
    [self.dote2 expandIntoView:self.viewtoanimate finished:NULL];
    [self.dote3 expandIntoView:self.viewtoanimate finished:NULL];
    [self.dote4 expandIntoView:self.viewtoanimate finished:NULL];
    [self.dote5 expandIntoView:self.viewtoanimate finished:NULL];
    [self.dote6 expandIntoView:self.viewtoanimate finished:NULL];

    
}
@end
