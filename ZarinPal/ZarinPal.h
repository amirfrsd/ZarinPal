//
//  ZarinPal.h
//  ZarinPal
//
//  Created by Amir on 1/10/17.
//  Copyright © 2017 Emersad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaymentGatewayImplementationService.h"
@interface ZarinPal : NSObject <PaymentGatewayImplementationServiceBindingResponseDelegate>

typedef void(^paymentBlock)(BOOL);
typedef void(^verificationBlock)(BOOL);

@property NSString *merchantID;

- (id)initWithMerchantID:(NSString *)merchantID;

- (void)startPaymentWithAmount:(NSString *)amount callBackURL:(NSString *)callback description:(NSString *)desc mobile:(NSString *)mobile email:(NSString *)mail paymentBlock:(paymentBlock) paymentBlock;
- (void)verifyPaymentWithAmount:(NSString *)amount authority:(NSString *)authority verificationBlock:(verificationBlock) verificationBlock;

@end
