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
@property (weak, nonatomic) IBOutlet UILabel *authLabel;
@property (weak, nonatomic) IBOutlet UIButton *openButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self startPayment];
    [self verifyPayment];
}

- (void) startPayment {
    ZarinPal *zarinPalObject = [[ZarinPal alloc] initWithMerchantID:@"MERCHANT-ID"];
    [zarinPalObject startPaymentWithAmount:@"" callBackURL:@"" description:@"" mobile:@"" email:@"" paymentBlock:^(BOOL success, NSString *response) {
        if (success) {
            NSLog(@"Authority : %@ So The Payment URL is : https://zarinpal.com/pg/StartPay/%@", response,response);
        } else {
            NSLog(@"Error Code : %@",response);
        }
    }];
}
- (void) verifyPayment {
    ZarinPal *zarinPalObject = [[ZarinPal alloc] initWithMerchantID:@"MERCHANT-ID"];
    [zarinPalObject verifyPaymentWithAmount:@"" authority:@"" verificationBlock:^(BOOL success, NSString *response) {
        if (success) {
            NSLog(@"this is Ref ID : %@",response);
        } else {
            NSLog(@"%@",response);
        }
    }];
   /* [zarinPalObject verifyPaymentWithAmount:@"AMOUNT IN TOMANS" authority:@"AUTHORITY" verificationBlock:^(BOOL verificationRequestSent) {
        if (verificationRequestSent) {
            NSLog(@"request sent");
        } else {
            //oops!
        }
    }];*/
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
