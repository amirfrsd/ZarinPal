//
//  ZarinPal.h
//  ZarinPal
//
//  Created by Amir on 1/10/17.
//  Copyright © 2017 Emersad. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface ZarinPal : NSObject

typedef void(^paymentBlock)(BOOL success,NSString *response);
typedef void(^verificationBlock)(BOOL success,NSString *response);

@property NSString *merchantID;
@property BOOL sandbox;
- (id)initWithMerchantID:(NSString *)merchantID sandBoxMode:(BOOL)sandbox;
- (void)startPaymentWithAmount:(NSString *)amount callBackURL:(NSString *)callback description:(NSString *)desc mobile:(NSString *)mobile email:(NSString *)mail paymentBlock:(paymentBlock) paymentBlock;
- (void)verifyPaymentWithAmount:(NSString *)amount authority:(NSString *)authority verificationBlock:(verificationBlock) verificationBlock;

@end
