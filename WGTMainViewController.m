//
//  WGTMainViewController.m
//  WGT ANALYST
//
//  Created by Kostya on 10.08.16.
//  Copyright © 2016 Stolyarenko K.S. All rights reserved.
//


//https://api.worldoftanks.ru/wot/account/list/?application_id=1cf23eee894da3308fcf5e31a140fa5f&search=%@
//https://api.worldoftanks.ru/wot/account/info/?application_id=demo&account_id=1398550

#import "WGTMainViewController.h"
static NSString *const WGApiUrl = @"https://api.worldoftanks.ru/wot/account/";
static NSString *const UserNameUrl = @"list/?application_id=1cf23eee894da3308fcf5e31a140fa5f&search=%@";
static NSString *const AccountIDUrl = @"info/?application_id=1cf23eee894da3308fcf5e31a140fa5f&account_id=%@";

@interface WGTMainViewController ()

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *account_id;
@property (weak, nonatomic) IBOutlet UILabel *global_rating;
@property (weak, nonatomic) IBOutlet UILabel *private_credits;
@property (weak, nonatomic) IBOutlet UILabel *private_gold;


@end

@implementation WGTMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    NSString *userCityName = textField.text;
    self.name.text = textField.text;
    userCityName = [userCityName stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    textField.text = userCityName;
    
    //session
    NSURLSession *session = [NSURLSession sharedSession];
    
    //url
    NSString *urlString = [WGApiUrl stringByAppendingString:UserNameUrl];
    urlString = [NSString stringWithFormat:urlString, textField.text];
    NSURL *url = [NSURL URLWithString:urlString];
    
    //request
    __weak typeof(self) weakSelf = self;
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                __strong typeof(weakSelf) strongSelf = weakSelf;
                                                
                                                //parsing request
                                                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                [strongSelf configurationScreenWithDictionary:json];
                                            }];
    [dataTask resume];
    textField.text = nil;
    return YES;
}


//parsing data by name of the city
- (void)configurationScreenWithDictionary:(NSDictionary *)infoDictionary {
    dispatch_async(dispatch_get_main_queue(), ^{
        
        NSArray *user = infoDictionary[@"data"];
        NSDictionary *user2 = user[0];
        NSString *str = user2[@"account_id"];
        NSInteger stri = [str integerValue];
        self.account_id.text = [@(stri) description];
        
        
    });
}


@end
