# ZarinPal
request/verify payments from ZarinPal for iOS

requirements: Zarinpal Merchant ID

Examples are included :-)

# How should i use this?

Payment Request
```Objective-C
     ZarinPal *zarinPalObject = [[ZarinPal alloc] initWithMerchantID:@"MERCHANT-ID"];
    [zarinPalObject startPaymentWithAmount:@"AMOUNT IN TOMANS" callBackURL:@"CALLBACK URL" description:@"DESCRIPTION" mobile:@"MOBILE" email:@"EMAIL" paymentBlock:^(BOOL success, NSString *response) {
        if (success) {
            NSLog(@"Authority : %@ So The Payment URL is : https://zarinpal.com/pg/StartPay/%@", response,response);
        } else {
            NSLog(@"Error Code : %@",response);
        }
    }];
```

Payment Verification Request
```Objective-C
    ZarinPal *zarinPalObject = [[ZarinPal alloc] initWithMerchantID:@"MERCHANT-ID"];
    [zarinPalObject verifyPaymentWithAmount:@"AMOUNT IN TOMANS" authority:@"AUTHORITY" verificationBlock:^(BOOL success, NSString *response) {
        if (success) {
            NSLog(@"this is Ref ID : %@",response);
        } else {
            NSLog(@"%@",response);
        }
    }];
```
