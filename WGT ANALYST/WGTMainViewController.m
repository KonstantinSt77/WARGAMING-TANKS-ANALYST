//
//  WGTMainViewController.m
//  WGT ANALYST
//
//  Created by Kostya on 10.08.16.
//  Copyright © 2016 Stolyarenko K.S. All rights reserved.
//


#import "WGTMainViewController.h"
static NSString *const WGApiUrl = @"https://api.worldoftanks.ru/wot/account/";
static NSString *const UserNameUrl = @"list/?application_id=1cf23eee894da3308fcf5e31a140fa5f&search=%@";
static NSString *const AccountIDUrl = @"info/?application_id=1cf23eee894da3308fcf5e31a140fa5f&account_id=%@";

@interface WGTMainViewController ()

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *account_id;
@property (weak, nonatomic) IBOutlet UILabel *global_rating;
@property (weak, nonatomic) IBOutlet UILabel *battels;
@property (weak, nonatomic) IBOutlet UILabel *hits_percents;
@property (weak, nonatomic) NSString *idstring;

@end

@implementation WGTMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

//parsing data by name of the city
- (void)configurationScreenWithDictionary:(NSDictionary *)infoDictionary {
    dispatch_async(dispatch_get_main_queue(), ^{
        
        NSArray *user = infoDictionary[@"data"];
        NSDictionary *user2 = user[0];
        NSString *str1 = user2[@"account_id"];
        NSInteger stri = [str1 integerValue];
        self.idstring = [NSString stringWithFormat:@"%ld", (long)stri];
        self.account_id.text = [@(stri) description];
        
        
    });
}



- (void)configurationScreenWithDictionary1:(NSDictionary *)infoDictionary1 {
    dispatch_async(dispatch_get_main_queue(), ^{
        
        NSDictionary *user = infoDictionary1[@"data"];
        NSLog(@"infa %@",self.idstring);
        
        NSDictionary *arr = user[self.idstring];
        NSLog(@"infa%@",arr);
        
       NSString *str1 = arr[@"global_rating"];
        NSLog(@"infa %@",str1);
   
        NSInteger stri1 = [str1 integerValue];
        self.global_rating.text = [@(stri1) description];
        
        NSDictionary *str44 = arr[@"statistics"];
        NSLog(@"infa %@",str44);
        NSDictionary *str55 = str44[@"all"];
        NSString *str66 = str55[@"battles"];
        
        NSInteger stri66 = [str66 integerValue];
        self.battels.text = [@(stri66) description];
        
        NSString *str77 = str55[@"hits_percents"];
        
        NSInteger stri77 = [str77 integerValue];
        self.hits_percents.text = [@(stri77) description];


        
    });
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
                                                [self request];
                                            }];
    [dataTask resume];
    textField.text = nil;
    

    
    return YES;
}



-(void)request
{

    NSLog(@"hello");
    NSLog(@"id%@",self.idstring);
    //session
    NSURLSession *session1 = [NSURLSession sharedSession];
    
    //url
    NSString *urlString1 = [WGApiUrl stringByAppendingString:AccountIDUrl];
    urlString1 = [NSString stringWithFormat:urlString1,self.idstring];
    NSURL *url1 = [NSURL URLWithString:urlString1];
    
    NSLog(@"url %@",url1);
    
    //request
    __weak typeof(self) weakSelf = self;
    NSURLSessionDataTask *dataTask1 = [session1 dataTaskWithURL:url1
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                __strong typeof(weakSelf) strongSelf = weakSelf;
                                                
                                                //parsing request
                                                NSDictionary *json1 = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                [strongSelf configurationScreenWithDictionary1:json1];
                                                
                                            }];
    [dataTask1 resume];

}




@end
