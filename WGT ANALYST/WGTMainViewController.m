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
@property (weak, nonatomic) IBOutlet UIImageView *wot;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (strong, nonatomic) NSString *idstring;

@end

@implementation WGTMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
[[self navigationController] setNavigationBarHidden:YES animated:YES];
    [self dataAnimation];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval: 6.0
                                                  target: self
                                                    selector:@selector(logoAnimation)
                                                userInfo: nil repeats:YES];
}

//parsing data by nickname

- (void)configurationScreenWithDictionary:(NSDictionary *)infoDictionary {
    dispatch_async(dispatch_get_main_queue(), ^{
        
        NSArray *user = infoDictionary[@"data"];
        NSDictionary *user2 = user[0];
        NSString *str1 = user2[@"account_id"];
        NSInteger stri = [str1 integerValue];
        self.idstring = [NSString stringWithFormat:@"%ld", (long)stri];
        self.account_id.text = [@(stri) description];
        [self dataAnimation];
    });
}


//parsing data by account_id

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


// NSURLSession request

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
                                    
                                                [self AFNRequest];
                                            }];
    [dataTask resume];
    textField.text = nil;
    return YES;
}

// AFHTTPSessionManager request

-(BOOL)AFNRequest
{
    
    NSURLSessionConfiguration *configuration3 = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration3];
    NSString *urlString3 = [WGApiUrl stringByAppendingString:AccountIDUrl];
    urlString3 = [NSString stringWithFormat:urlString3, self.idstring];
    NSURL *url3 = [NSURL URLWithString:urlString3];
    [manager GET:url3.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSDictionary *json3 = responseObject;
        [self configurationScreenWithDictionary1:json3];
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    return YES;
}


// Animation - https://github.com/daltoniam/DCAnimationKit

-(void)logoAnimation
{
    //[self.wot snapIntoView:self.view direction:DCAnimationDirectionTop];
    //[self.wot bounceIntoView:self.view direction:DCAnimationDirectionTop];
    //[self.wot swing:NULL];
    //[self.wot expandIntoView:self.view finished:NULL];
    //[self.wot expandIntoView:self.view finished:NULL];
    [self.wot pulse:NULL];
    [self.line pulse:NULL];
}
-(void)dataAnimation
{
    [self.wot expandIntoView:self.view finished:NULL];
    [self.name expandIntoView:self.view finished:NULL];
    [self.account_id expandIntoView:self.view finished:NULL];
    [self.global_rating expandIntoView:self.view finished:NULL];
    [self.battels expandIntoView:self.view finished:NULL];
    [self.hits_percents expandIntoView:self.view finished:NULL];
    [self.wot expandIntoView:self.view finished:NULL];
    
    

}


@end
