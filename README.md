# ZarinPal

request/verify payments from ZarinPal for iOS

requirements: Zarinpal Merchant ID


## Changelog
- [X] SandBox Mode Added - Note: This will only work for payment requests


# Swift

Simply Drag Files to your project (ZarinPal.h,.m) , Then `#import "ZarinPal.h"` in your Bridging header, you are done :P

Payment Request
```Swift
        let zarinPalObject = ZarinPal.init(merchantID: "MERCHANT-ID",sandBoxMode:true)
        zarinPalObject?.startPayment(withAmount: "", callBackURL: "", description: "", mobile: "", email: "", paymentBlock: { (success, response) in
            if success {
               print("Payment URL \(response)")
            } else {
            
            }
        })
```

Payment Verification Request
```Swift
        let zarinPalObject = ZarinPal.init(merchantID: "MERCHANT-ID",sandBoxMode:true)
        zarinPalObject?.verifyPayment(withAmount: "", authority: "", verificationBlock:  { (success, response) in
            if success {
               print(response)
            } else {
            
            }
        })
```

# Objective-C

Payment Request
```Objective-C
    ZarinPal *zarinPalObject = [[ZarinPal alloc] initWithMerchantID:@"MERCHANT-ID" sandBoxMode:true];
    [zarinPalObject startPaymentWithAmount:@"AMOUNT IN TOMANS" callBackURL:@"CALLBACK URL" description:@"DESCRIPTION" mobile:@"MOBILE" email:@"EMAIL" paymentBlock:^(BOOL success, NSString *response) {
        if (success) {
            NSLog(@"Payment URL: %@",response);
        } else {
            NSLog(@"Error Code : %@",response);
        }
    }];
```

Payment Verification Request
```Objective-C
    ZarinPal *zarinPalObject = [[ZarinPal alloc] initWithMerchantID:@"MERCHANT-ID" sandBoxMode:true];
    [zarinPalObject verifyPaymentWithAmount:@"AMOUNT IN TOMANS" authority:@"AUTHORITY" verificationBlock:^(BOOL success, NSString *response) {
        if (success) {
            NSLog(@"this is Ref ID : %@",response);
        } else {
            NSLog(@"%@",response);
        }
    }];
```

