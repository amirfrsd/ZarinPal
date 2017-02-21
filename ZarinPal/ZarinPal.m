//
//  ZarinPal.m
//  ZarinPal
//
//  Created by Amir on 1/10/17.
//  Copyright © 2017 Emersad. All rights reserved.
//

#import "ZarinPal.h"
@implementation ZarinPal 


- (id)initWithMerchantID:(NSString *)merchantID {
    self.merchantID = merchantID;
    return self;
}


- (void)startPaymentWithAmount:(NSNumber *)amount callBackURL:(NSString *)callback description:(NSString *)desc mobile:(NSString *)mobile email:(NSString *)mail paymentBlock:(paymentBlock) paymentBlock {
    IVTPaymentGatewayImplementationServiceBinding *service = [[IVTPaymentGatewayImplementationServiceBinding alloc] init];
    [service PaymentRequestAsync:self.merchantID Amount:amount.intValue Description:desc Email:mail Mobile:mobile CallbackURL:callback __target:self __handler:@selector(handler:)];
    paymentBlock(YES);
}

-(void) handler:(id)obj {
    if ([obj isKindOfClass:[IVTPaymentRequestResponse class]]) {
        IVTPaymentRequestResponse *result = (IVTPaymentRequestResponse *)obj;
        NSDictionary *dict = @{
                               @"Type":@"paymentRequest",
                               @"Authority":[obj valueForKey:@"Authority"]
                               };
        [[NSNotificationCenter defaultCenter] postNotificationName:@"responseReceived" object:dict];
    } else if ([obj isKindOfClass:[IVTPaymentVerificationResponse class]]) {
        IVTPaymentVerificationResponse *result = (IVTPaymentVerificationResponse *)obj;
        if ([obj valueForKey:@"Status"] == 100) {
            NSDictionary *dict = @{
                                   @"Type":@"verificationRequest",
                                   @"Status":@"1"
                                   };
            [[NSNotificationCenter defaultCenter] postNotificationName:@"responseReceived" object:dict];
        } else {
            NSDictionary *dict = @{
                                   @"Type":@"verificationRequest",
                                   @"Status":@"0"
                                   };
            [[NSNotificationCenter defaultCenter] postNotificationName:@"responseReceived" object:dict];
        }
    } else {
        NSError *err = (NSError *)obj;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"responseReceived" object:@{@"Type":@"failed"}];
    }
}

- (void)verifyPaymentWithAmount:(NSString *)amount authority:(NSString *)authority verificationBlock:(verificationBlock) verificationBlock {
    IVTPaymentGatewayImplementationServiceBinding *service = [[IVTPaymentGatewayImplementationServiceBinding alloc] init];
    [service PaymentVerificationAsync:self.merchantID Authority:authority Amount:amount __target:self __handler:@selector(handler:)];
    verificationBlock(YES);
}


@end
