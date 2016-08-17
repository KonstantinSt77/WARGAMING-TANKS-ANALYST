//
//  WGTServersViewController.m
//  WGT ANALYST
//
//  Created by Kostya on 15.08.16.
//  Copyright © 2016 Stolyarenko K.S. All rights reserved.
//

#import "WGTServersViewController.h"
static NSString *const ServersNameUrl = @"https://api.worldoftanks.ru/wgn/servers/info/?application_id=1cf23eee894da3308fcf5e31a140fa5f";


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
@property (weak, nonatomic) IBOutlet UIView *dote7;
@property (weak, nonatomic) IBOutlet UIView *dote8;
@property (weak, nonatomic) IBOutlet UIView *dote9;
@property (weak, nonatomic) IBOutlet UIView *dote10;

@property (weak, nonatomic) IBOutlet UILabel *server1;
@property (weak, nonatomic) IBOutlet UILabel *people1;

@property (weak, nonatomic) IBOutlet UILabel *server2;
@property (weak, nonatomic) IBOutlet UILabel *people2;

@property (weak, nonatomic) IBOutlet UILabel *server3;
@property (weak, nonatomic) IBOutlet UILabel *people3;

@property (weak, nonatomic) IBOutlet UILabel *server4;
@property (weak, nonatomic) IBOutlet UILabel *people4;

@property (weak, nonatomic) IBOutlet UILabel *server5;
@property (weak, nonatomic) IBOutlet UILabel *people5;

@property (weak, nonatomic) IBOutlet UILabel *server6;
@property (weak, nonatomic) IBOutlet UILabel *people6;

@property (weak, nonatomic) IBOutlet UILabel *server7;
@property (weak, nonatomic) IBOutlet UILabel *people7;

@property (weak, nonatomic) IBOutlet UILabel *server8;
@property (weak, nonatomic) IBOutlet UILabel *people8;

@property (weak, nonatomic) IBOutlet UILabel *server9;
@property (weak, nonatomic) IBOutlet UILabel *people9;

@property (weak, nonatomic) IBOutlet UILabel *server10;
@property (weak, nonatomic) IBOutlet UILabel *people10;

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
    
    [self AFNRequest];
NSTimer *data = [NSTimer scheduledTimerWithTimeInterval: 5.0
                                                      target: self
                                                    selector:@selector(AFNRequest)
                                                    userInfo: nil repeats:YES];
    
    
    
}


-(void)serversAnimation
{
    
    [self.dote1 expandIntoView:self.viewtoanimate finished:NULL];
    [self.dote2 expandIntoView:self.viewtoanimate finished:NULL];
    [self.dote3 expandIntoView:self.viewtoanimate finished:NULL];
    [self.dote4 expandIntoView:self.viewtoanimate finished:NULL];
    [self.dote5 expandIntoView:self.viewtoanimate finished:NULL];
    [self.dote6 expandIntoView:self.viewtoanimate finished:NULL];
    [self.dote7 expandIntoView:self.viewtoanimate finished:NULL];
    [self.dote8 expandIntoView:self.viewtoanimate finished:NULL];
    [self.dote9 expandIntoView:self.viewtoanimate finished:NULL];
    [self.dote10 expandIntoView:self.viewtoanimate finished:NULL];
    
}


- (void)configurationScreenWithDictionary:(NSDictionary *)infoDictionary {
    dispatch_async(dispatch_get_main_queue(), ^{
        
        NSDictionary *data = infoDictionary[@"data"];
        NSArray *wot = data[@"wot"];
        NSDictionary *server0 = wot[0];
        NSDictionary *server1 = wot[1];
        NSDictionary *server2 = wot[2];
        NSDictionary *server3 = wot[3];
        NSDictionary *server4 = wot[4];
        NSDictionary *server5 = wot[5];
        NSDictionary *server6 = wot[6];
        NSDictionary *server7 = wot[7];
        NSDictionary *server8 = wot[8];
        NSDictionary *server9 = wot[9];
        
        NSString *players0 = server0[@"players_online"];
        NSString *players1 = server1[@"players_online"];
        NSString *players2 = server2[@"players_online"];
        NSString *players3 = server3[@"players_online"];
        NSString *players4 = server4[@"players_online"];
        NSString *players5 = server5[@"players_online"];
        NSString *players6 = server6[@"players_online"];
        NSString *players7 = server7[@"players_online"];
        NSString *players8 = server8[@"players_online"];
        NSString *players9 = server9[@"players_online"];
        
        NSInteger play0 = [players0 integerValue];
        NSInteger play1 = [players1 integerValue];
        NSInteger play2 = [players2 integerValue];
        NSInteger play3 = [players3 integerValue];
        NSInteger play4 = [players4 integerValue];
        NSInteger play5 = [players5 integerValue];
        NSInteger play6 = [players6 integerValue];
        NSInteger play7 = [players7 integerValue];
        NSInteger play8 = [players8 integerValue];
        NSInteger play9 = [players9 integerValue];
        
        self.people1.text = [@(play0) description];
        self.people2.text = [@(play1) description];
        self.people3.text = [@(play2) description];
        self.people4.text = [@(play3) description];
        self.people5.text = [@(play4) description];
        self.people6.text = [@(play5) description];
        self.people7.text = [@(play6) description];
        self.people8.text = [@(play7) description];
        self.people9.text = [@(play8) description];
        self.people10.text = [@(play9) description];
        
        self.server1.text = @"RU8";
        self.server2.text = @"RU7";
        self.server3.text = @"RU2";
        self.server4.text = @"RU1";
        self.server5.text = @"RU3";
        self.server6.text = @"RU6";
        self.server7.text = @"RU5";
        self.server8.text = @"RU4";
        self.server9.text = @"RU9";
        self.server10.text = @"RU10";
        
        
        [self.server1 pulse:NULL];
        [self.server2 pulse:NULL];
        [self.server3 pulse:NULL];
        [self.server4 pulse:NULL];
        [self.server5 pulse:NULL];
        [self.server6 pulse:NULL];
        [self.server7 pulse:NULL];
        [self.server8 pulse:NULL];
        [self.server9 pulse:NULL];
        [self.server10 pulse:NULL];
        
        [self.people1 pulse:NULL];
        [self.people2 pulse:NULL];
        [self.people3 pulse:NULL];
        [self.people4 pulse:NULL];
        [self.people5 pulse:NULL];
        [self.people6 pulse:NULL];
        [self.people7 pulse:NULL];
        [self.people8 pulse:NULL];
        [self.people9 pulse:NULL];
        [self.people10 pulse:NULL];
       
    });
}

-(BOOL)AFNRequest
{
    
    NSURLSessionConfiguration *configuration3 = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration3];
    NSString *urlString3 = ServersNameUrl;
    NSURL *url3 = [NSURL URLWithString:urlString3];
    [manager GET:url3.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSDictionary *json3 = responseObject;
        [self configurationScreenWithDictionary:json3];
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    return YES;
}
@end
