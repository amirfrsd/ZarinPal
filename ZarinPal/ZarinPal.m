//
//  ZarinPal.m
//  ZarinPal
//
//  Created by Amir on 1/10/17.
//  Copyright © 2017 Emersad. All rights reserved.
//

#import "ZarinPal.h"
#define SANDBOX @"https://sandbox.zarin.link/pg/StartPay/";
#define DEFAULT @"https://zarin.link/pg/StartPay/";
@implementation ZarinPal 

- (id)initWithMerchantID:(NSString *)merchantID sandBoxMode:(BOOL)sandbox {
    self.merchantID = merchantID;
    self.sandbox = sandbox;
    return self;
}

- (void)startPaymentWithAmount:(NSNumber *)amount callBackURL:(NSString *)callback description:(NSString *)desc mobile:(NSString *)mobile email:(NSString *)mail paymentBlock:(paymentBlock) paymentBlock {
    NSURLSessionConfiguration* sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession* session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:nil];
    NSURL* URL = [NSURL URLWithString:@"https://www.zarinpal.com/pg/rest/WebGate/PaymentRequest.json"];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:URL];
    request.HTTPMethod = @"POST";
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSDictionary* bodyObject = @{
                                 @"Description": desc,
                                 @"Mobile":mobile,
                                 @"Email":mail,
                                 @"CallbackURL": callback,
                                 @"MerchantID": self.merchantID,
                                 @"Amount": amount
                                 };
    NSInteger integer = bodyObject.description.length;
    NSString *length = [NSString stringWithFormat:@"%li",(long)integer];
    [request addValue:length forHTTPHeaderField:@"Content-Length"];
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:bodyObject options:kNilOptions error:NULL];
    NSURLSessionDataTask* task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error == nil) {
            NSLog(@"URL Session Task Succeeded: HTTP %ld", ((NSHTTPURLResponse*)response).statusCode);
            NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            if ([[responseDict valueForKey:@"Status"] intValue] == 100) {
                NSString *str = [responseDict valueForKey:@"Authority"];
                NSString *defaultStr = DEFAULT;
                NSString *sandboxedStr = SANDBOX;
                paymentBlock(YES,[NSString stringWithFormat:@"%@%@",self.sandbox ? sandboxedStr : defaultStr,str]);
            } else {
                NSString *str = [responseDict valueForKey:@"Status"];
                paymentBlock(YES,str);
            }
        }
        else {
            paymentBlock(NO,@"");
            NSLog(@"URL Session Task Failed: %@", [error localizedDescription]);
        }
    }];
    [task resume];
    [session finishTasksAndInvalidate];
}

- (void)verifyPaymentWithAmount:(NSString *)amount authority:(NSString *)authority verificationBlock:(verificationBlock) verificationBlock {
    NSURLSessionConfiguration* sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession* session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:nil];
    NSURL* URL = [NSURL URLWithString:@"https://www.zarinpal.com/pg/rest/WebGate/PaymentVerification.json"];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:URL];
    request.HTTPMethod = @"POST";
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSDictionary* bodyObject = @{
                                 @"MerchantID": self.merchantID,
                                 @"Amount": amount,
                                 @"Authority": authority
                                 };
    NSInteger integer = bodyObject.description.length;
    NSString *length = [NSString stringWithFormat:@"%li",(long)integer];
    [request addValue:length forHTTPHeaderField:@"Content-Length"];
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:bodyObject options:kNilOptions error:NULL];
    NSURLSessionDataTask* task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error == nil) {
            NSLog(@"URL Session Task Succeeded: HTTP %ld", ((NSHTTPURLResponse*)response).statusCode);
            NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            if ([[responseDict valueForKey:@"Status"] intValue] == 100) {
                NSString *str = [responseDict valueForKey:@"RefID"];
                verificationBlock(YES,str);
            } else {
                NSString *str = [responseDict valueForKey:@"Status"];
                verificationBlock(YES,str);
            }
        }
        else {
            verificationBlock(NO,@"");
            NSLog(@"URL Session Task Failed: %@", [error localizedDescription]);
        }
    }];
    [task resume];
    [session finishTasksAndInvalidate];
}


@end
