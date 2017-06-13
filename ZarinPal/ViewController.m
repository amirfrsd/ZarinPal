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
}

- (void) startPayment {
    ZarinPal *zarinPalObject = [[ZarinPal alloc] initWithMerchantID:@"" sandBoxMode:true];
    [zarinPalObject startPaymentWithAmount:@"" callBackURL:@"" description:@"" mobile:@"" email:@"" paymentBlock:^(BOOL success, NSString *response) {
        if (success) {
            NSLog(@"Authority : %@ So The Payment URL is : https://zarinpal.com/pg/StartPay/%@", response,response);
        } else {
            NSLog(@"Error Code : %@",response);
        }
    }];
}
- (void) verifyPayment {
    ZarinPal *zarinPalObject = [[ZarinPal alloc] initWithMerchantID:@"" sandBoxMode:true];
    [zarinPalObject verifyPaymentWithAmount:@"" authority:@"" verificationBlock:^(BOOL success, NSString *response) {
        if (success) {
            NSLog(@"this is Ref ID : %@",response);
        } else {
            NSLog(@"%@",response);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
