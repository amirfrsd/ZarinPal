//
//  ViewController.m
//  ZarinPal
//
//  Created by Amir on 1/10/17.
//  Copyright © 2017 Emersad. All rights reserved.
//

#import "ViewController.h"
#import "ZarinPal.h"
@interface ViewController () {
    NSString *paymentURL;
    NSString *error;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self startPayment];
    [self verifyPayment];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(responseReceived:)
                                                 name:@"responseReceived"
                                               object:nil];
}

- (void) startPayment {
    ZarinPal *zarinPalObject = [[ZarinPal alloc] initWithMerchantID:@"MERCHANT-ID"];
    [zarinPalObject startPaymentWithAmount:@"AMOUNT IN TOMANS" callBackURL:@"CALLBACK URL" description:@"DESCRIPTION" mobile:@"MOBILE" email:@"EMAIL" paymentBlock:^(BOOL paymentRequestSent) {
        if (paymentRequestSent) {
            NSLog(@"request sent");
        }
    }];
}
- (void) responseReceived: (NSNotification *) notification {
    NSDictionary *dict = notification.object;
    NSString *type = [dict valueForKey:@"Type"];
    if ([type isEqualToString:@"paymentRequest"]) {
        NSString *url = [NSString stringWithFormat:@"https://www.zarinpal.com/pg/StartPay/%@",[dict valueForKey:@"Authority"]];
        NSLog(@"this is url %@", url);
    } else if ([type isEqualToString:@"verificationRequest"]) {
        NSString *response = [dict valueForKey:@"Status"];
        if ([response isEqualToString:@"1"]) {
            NSLog(@"payment done");
        } else {
            //oops :(
        }
    } else if ([type isEqualToString:@"failed"]) {
        //something wrong
    }
}
- (void) verifyPayment {
    ZarinPal *zarinPalObject = [[ZarinPal alloc] initWithMerchantID:@"MERCHANT-ID"];
    [zarinPalObject verifyPaymentWithAmount:@"AMOUNT IN TOMANS" authority:@"AUTHORITY" verificationBlock:^(BOOL verificationRequestSent) {
        if (verificationRequestSent) {
            NSLog(@"request sent");
        } else {
            //oops!
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
