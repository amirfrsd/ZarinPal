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
    PaymentGatewayImplementationServiceBinding *paymentGateway = [PaymentGatewayImplementationService PaymentGatewayImplementationServiceBinding];
    PaymentGatewayImplementationService_PaymentRequest *paymentRequest = [PaymentGatewayImplementationService_PaymentRequest new];
    paymentRequest.Amount = amount;
    paymentRequest.CallbackURL = callback;
    paymentRequest.Description = desc;
    paymentRequest.Mobile = mobile;
    paymentRequest.Email = mail;
    paymentRequest.MerchantID = self.merchantID;
    [paymentGateway PaymentRequestAsyncUsingParameters:paymentRequest delegate:self];
    paymentBlock(YES);
}

- (void)verifyPaymentWithAmount:(NSString *)amount authority:(NSString *)authority verificationBlock:(verificationBlock) verificationBlock {
    PaymentGatewayImplementationServiceBinding *paymentGateway = [PaymentGatewayImplementationService PaymentGatewayImplementationServiceBinding];
    PaymentGatewayImplementationService_PaymentVerification *verificationRequest = [PaymentGatewayImplementationService_PaymentVerification new];
    verificationRequest.Amount = amount;
    verificationRequest.Authority = authority;
    verificationRequest.MerchantID = self.merchantID;
    [paymentGateway PaymentVerificationAsyncUsingParameters:verificationRequest delegate:self];
    verificationBlock(YES);
}

- (void) operation:(PaymentGatewayImplementationServiceBinding *)operation completedWithResponse:(PaymentGatewayImplementationServiceBindingResponse *)response {
    NSArray *responseBody = response.bodyParts;
    for (id bodyPart in responseBody) {
        if ([bodyPart isKindOfClass:[SOAPFault class]]) {
            NSLog(@"error occured");
            continue;
        } else if ([bodyPart isKindOfClass:[PaymentGatewayImplementationService_PaymentRequestResponse class]]) {
            PaymentGatewayImplementationService_PaymentRequestResponse *responseBody = (PaymentGatewayImplementationService_PaymentRequestResponse *)bodyPart;
            NSString *paymentURL = [NSString stringWithFormat:@"https://www.zarinpal.com/pg/StartPay/%@",responseBody.Authority];
            NSLog(@"auth is %@", paymentURL);
            continue;
        } else if ([bodyPart isKindOfClass:[PaymentGatewayImplementationService_PaymentVerificationResponse class]]) {
            PaymentGatewayImplementationService_PaymentVerificationResponse *responseBody = (PaymentGatewayImplementationService_PaymentVerificationResponse *)bodyPart;
            NSString *status = responseBody.Status;
            NSString *refID = responseBody.RefID;
        }
    }
}

@end
