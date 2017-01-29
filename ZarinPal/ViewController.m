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
    [self startPayment];
}

- (void) startPayment {
    ZarinPal *zarinPalObject = [[ZarinPal alloc] initWithMerchantID:@"XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"];
    [zarinPalObject startPaymentWithAmount:@"1000" callBackURL:@"http://goeogle.com" description:@"test" mobile:@"09126127429" email:@"amir.farsad@gmail.com" paymentBlock:^(BOOL paymentRequestSent) {
        if (paymentRequestSent) {
            NSLog(@"request sent");
        }
    }];
}

- (void) verifyPayment {
    ZarinPal *zarinPalObject = [[ZarinPal alloc] initWithMerchantID:@"XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"];
    [zarinPalObject verifyPaymentWithAmount:@"amount" authority:@"authority" verificationBlock:^(BOOL verificationRequestSent) {
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
