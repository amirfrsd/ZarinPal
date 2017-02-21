#import <Foundation/Foundation.h>

#import "IVTPaymentRequestResponse.h"
#import "IVTPaymentRequestWithExtraResponse.h"
#import "IVTPaymentVerificationResponse.h"
#import "DDXML.h"

#import "IVTRequestResultHandler.h"

@interface IVTPaymentGatewayImplementationServiceBinding : NSObject
    
@property (retain, nonatomic) NSDictionary* Headers;
@property (retain, nonatomic) NSString* Url;
@property (nonatomic) BOOL ShouldAddAdornments;
@property BOOL EnableLogging;

- (id) init;
- (id) initWithUrl: (NSString*) url;

-(NSMutableURLRequest*) createPaymentRequestRequest:(NSString*) MerchantID Amount:(int) Amount Description:(NSString*) Description Email:(NSString*) Email Mobile:(NSString*) Mobile CallbackURL:(NSString*) CallbackURL __request:(IVTRequestResultHandler*) __request;
-(IVTPaymentRequestResponse*) PaymentRequest:(NSString*) MerchantID Amount:(int) Amount Description:(NSString*) Description Email:(NSString*) Email Mobile:(NSString*) Mobile CallbackURL:(NSString*) CallbackURL __error:(NSError**) __error __attribute__ ((deprecated("UsePaymentRequestAsync method instead")));
-(IVTRequestResultHandler*) PaymentRequestAsync:(NSString*) MerchantID Amount:(int) Amount Description:(NSString*) Description Email:(NSString*) Email Mobile:(NSString*) Mobile CallbackURL:(NSString*) CallbackURL __target:(id) __target __handler:(SEL) __handler;
-(IVTRequestResultHandler*) PaymentRequestAsync:(NSString*) MerchantID Amount:(int) Amount Description:(NSString*) Description Email:(NSString*) Email Mobile:(NSString*) Mobile CallbackURL:(NSString*) CallbackURL __target:(id<IVTSoapServiceResponse>) __target;
-(IVTRequestResultHandler*) PaymentRequestAsyncWithBlock:(NSString*) MerchantID Amount:(int) Amount Description:(NSString*) Description Email:(NSString*) Email Mobile:(NSString*) Mobile CallbackURL:(NSString*) CallbackURL __handler:(void(^) (id)) __handler;
-(NSMutableURLRequest*) createPaymentRequestWithExtraRequest:(NSString*) MerchantID Amount:(int) Amount Description:(NSString*) Description AdditionalData:(NSString*) AdditionalData Email:(NSString*) Email Mobile:(NSString*) Mobile CallbackURL:(NSString*) CallbackURL __request:(IVTRequestResultHandler*) __request;
-(IVTPaymentRequestWithExtraResponse*) PaymentRequestWithExtra:(NSString*) MerchantID Amount:(int) Amount Description:(NSString*) Description AdditionalData:(NSString*) AdditionalData Email:(NSString*) Email Mobile:(NSString*) Mobile CallbackURL:(NSString*) CallbackURL __error:(NSError**) __error __attribute__ ((deprecated("UsePaymentRequestWithExtraAsync method instead")));
-(IVTRequestResultHandler*) PaymentRequestWithExtraAsync:(NSString*) MerchantID Amount:(int) Amount Description:(NSString*) Description AdditionalData:(NSString*) AdditionalData Email:(NSString*) Email Mobile:(NSString*) Mobile CallbackURL:(NSString*) CallbackURL __target:(id) __target __handler:(SEL) __handler;
-(IVTRequestResultHandler*) PaymentRequestWithExtraAsync:(NSString*) MerchantID Amount:(int) Amount Description:(NSString*) Description AdditionalData:(NSString*) AdditionalData Email:(NSString*) Email Mobile:(NSString*) Mobile CallbackURL:(NSString*) CallbackURL __target:(id<IVTSoapServiceResponse>) __target;
-(IVTRequestResultHandler*) PaymentRequestWithExtraAsyncWithBlock:(NSString*) MerchantID Amount:(int) Amount Description:(NSString*) Description AdditionalData:(NSString*) AdditionalData Email:(NSString*) Email Mobile:(NSString*) Mobile CallbackURL:(NSString*) CallbackURL __handler:(void(^) (id)) __handler;
-(NSMutableURLRequest*) createPaymentVerificationRequest:(NSString*) MerchantID Authority:(NSString*) Authority Amount:(int) Amount __request:(IVTRequestResultHandler*) __request;
-(IVTPaymentVerificationResponse*) PaymentVerification:(NSString*) MerchantID Authority:(NSString*) Authority Amount:(int) Amount __error:(NSError**) __error __attribute__ ((deprecated("UsePaymentVerificationAsync method instead")));
-(IVTRequestResultHandler*) PaymentVerificationAsync:(NSString*) MerchantID Authority:(NSString*) Authority Amount:(int) Amount __target:(id) __target __handler:(SEL) __handler;
-(IVTRequestResultHandler*) PaymentVerificationAsync:(NSString*) MerchantID Authority:(NSString*) Authority Amount:(int) Amount __target:(id<IVTSoapServiceResponse>) __target;
-(IVTRequestResultHandler*) PaymentVerificationAsyncWithBlock:(NSString*) MerchantID Authority:(NSString*) Authority Amount:(int) Amount __handler:(void(^) (id)) __handler;
-(NSString*) PaymentVerificationWithExtra:(NSString*) MerchantID Authority:(NSString*) Authority Amount:(NSString*) Amount __error:(NSError**) __error __attribute__ ((deprecated("UsePaymentVerificationWithExtraAsync method instead")));
-(IVTRequestResultHandler*) PaymentVerificationWithExtraAsync:(NSString*) MerchantID Authority:(NSString*) Authority Amount:(NSString*) Amount __target:(id) __target __handler:(SEL) __handler;
-(IVTRequestResultHandler*) PaymentVerificationWithExtraAsync:(NSString*) MerchantID Authority:(NSString*) Authority Amount:(NSString*) Amount __target:(id<IVTSoapServiceResponse>) __target;
-(IVTRequestResultHandler*) PaymentVerificationWithExtraAsyncWithBlock:(NSString*) MerchantID Authority:(NSString*) Authority Amount:(NSString*) Amount __handler:(void(^) (id)) __handler;
-(NSString*) GetUnverifiedTransactions:(NSString*) MerchantID __error:(NSError**) __error __attribute__ ((deprecated("UseGetUnverifiedTransactionsAsync method instead")));
-(IVTRequestResultHandler*) GetUnverifiedTransactionsAsync:(NSString*) MerchantID __target:(id) __target __handler:(SEL) __handler;
-(IVTRequestResultHandler*) GetUnverifiedTransactionsAsync:(NSString*) MerchantID __target:(id<IVTSoapServiceResponse>) __target;
-(IVTRequestResultHandler*) GetUnverifiedTransactionsAsyncWithBlock:(NSString*) MerchantID __handler:(void(^) (id)) __handler;
-(NSString*) RefreshAuthority:(NSString*) MerchantID Authority:(NSString*) Authority ExpireIn:(NSString*) ExpireIn __error:(NSError**) __error __attribute__ ((deprecated("UseRefreshAuthorityAsync method instead")));
-(IVTRequestResultHandler*) RefreshAuthorityAsync:(NSString*) MerchantID Authority:(NSString*) Authority ExpireIn:(NSString*) ExpireIn __target:(id) __target __handler:(SEL) __handler;
-(IVTRequestResultHandler*) RefreshAuthorityAsync:(NSString*) MerchantID Authority:(NSString*) Authority ExpireIn:(NSString*) ExpireIn __target:(id<IVTSoapServiceResponse>) __target;
-(IVTRequestResultHandler*) RefreshAuthorityAsyncWithBlock:(NSString*) MerchantID Authority:(NSString*) Authority ExpireIn:(NSString*) ExpireIn __handler:(void(^) (id)) __handler;
-(IVTRequestResultHandler*) CreateRequestResultHandler;   
-(NSMutableURLRequest*) createRequest :(NSString*) soapAction __request:(IVTRequestResultHandler*) __request; 
-(void) sendImplementation:(NSMutableURLRequest*) request requestMgr:(IVTRequestResultHandler*) requestMgr; 
-(void) sendImplementation:(NSMutableURLRequest*) request requestMgr:(IVTRequestResultHandler*) requestMgr callback:(void (^)(IVTRequestResultHandler *)) callback;

@end
