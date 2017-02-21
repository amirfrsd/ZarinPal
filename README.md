# ZarinPal
request/verify payments from ZarinPal for iOS

requirements: Zarinpal Merchant ID

Examples are included :-)

# How should i use this?

Simply Add a notification Observer 

```
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(responseReceived:)
                                                 name:@"responseReceived"
                                               object:nil];

```

Payment Request
```
     ZarinPal *zarinPalObject = [[ZarinPal alloc] initWithMerchantID:@"MERCHANT-ID"];
    [zarinPalObject startPaymentWithAmount:@"AMOUNT IN TOMANS" callBackURL:@"CALLBACK URL" description:@"DESCRIPTION" mobile:@"MOBILE" email:@"EMAIL" paymentBlock:^(BOOL paymentRequestSent) {
        if (paymentRequestSent) {
            NSLog(@"request sent");
        }
    }];
```
Payment Verification Request
```
    ZarinPal *zarinPalObject = [[ZarinPal alloc] initWithMerchantID:@"MERCHANT-ID"];
    [zarinPalObject verifyPaymentWithAmount:@"AMOUNT IN TOMANS" authority:@"AUTHORITY" verificationBlock:^(BOOL verificationRequestSent) {
        if (verificationRequestSent) {
            NSLog(@"request sent");
        } else {
            //oops!
        }
    }];
```
And wait for response: 
```
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

```
