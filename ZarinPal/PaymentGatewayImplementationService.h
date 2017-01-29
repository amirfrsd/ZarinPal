#import <Foundation/Foundation.h>
#import "USAdditions.h"
#import <libxml/tree.h>
#import "USGlobals.h"
#import <objc/runtime.h>
@class PaymentGatewayImplementationService_PaymentRequest;
@class PaymentGatewayImplementationService_PaymentRequestResponse;
@class PaymentGatewayImplementationService_PaymentRequestWithExtra;
@class PaymentGatewayImplementationService_PaymentRequestWithExtraResponse;
@class PaymentGatewayImplementationService_PaymentVerification;
@class PaymentGatewayImplementationService_PaymentVerificationResponse;
@class PaymentGatewayImplementationService_PaymentVerificationWithExtra;
@class PaymentGatewayImplementationService_PaymentVerificationWithExtraResponse;
@class PaymentGatewayImplementationService_GetUnverifiedTransactions;
@class PaymentGatewayImplementationService_GetUnverifiedTransactionsResponse;
@class PaymentGatewayImplementationService_RefreshAuthority;
@class PaymentGatewayImplementationService_RefreshAuthorityResponse;
@interface PaymentGatewayImplementationService_PaymentRequest : NSObject <NSCoding> {
SOAPSigner *soapSigner;
/* elements */
	NSString * MerchantID;
	NSNumber * Amount;
	NSString * Description;
	NSString * Email;
	NSString * Mobile;
	NSString * CallbackURL;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (PaymentGatewayImplementationService_PaymentRequest *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
@property (retain) SOAPSigner *soapSigner;
/* elements */
@property (nonatomic, retain) NSString * MerchantID;
@property (nonatomic, retain) NSNumber * Amount;
@property (nonatomic, retain) NSString * Description;
@property (nonatomic, retain) NSString * Email;
@property (nonatomic, retain) NSString * Mobile;
@property (nonatomic, retain) NSString * CallbackURL;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface PaymentGatewayImplementationService_PaymentRequestResponse : NSObject <NSCoding> {
SOAPSigner *soapSigner;
/* elements */
	NSNumber * Status;
	NSString * Authority;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (PaymentGatewayImplementationService_PaymentRequestResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
@property (retain) SOAPSigner *soapSigner;
/* elements */
@property (nonatomic, retain) NSNumber * Status;
@property (nonatomic, retain) NSString * Authority;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface PaymentGatewayImplementationService_PaymentRequestWithExtra : NSObject <NSCoding> {
SOAPSigner *soapSigner;
/* elements */
	NSString * MerchantID;
	NSNumber * Amount;
	NSString * Description;
	NSString * AdditionalData;
	NSString * Email;
	NSString * Mobile;
	NSString * CallbackURL;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (PaymentGatewayImplementationService_PaymentRequestWithExtra *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
@property (retain) SOAPSigner *soapSigner;
/* elements */
@property (nonatomic, retain) NSString * MerchantID;
@property (nonatomic, retain) NSNumber * Amount;
@property (nonatomic, retain) NSString * Description;
@property (nonatomic, retain) NSString * AdditionalData;
@property (nonatomic, retain) NSString * Email;
@property (nonatomic, retain) NSString * Mobile;
@property (nonatomic, retain) NSString * CallbackURL;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface PaymentGatewayImplementationService_PaymentRequestWithExtraResponse : NSObject <NSCoding> {
SOAPSigner *soapSigner;
/* elements */
	NSNumber * Status;
	NSString * Authority;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (PaymentGatewayImplementationService_PaymentRequestWithExtraResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
@property (retain) SOAPSigner *soapSigner;
/* elements */
@property (nonatomic, retain) NSNumber * Status;
@property (nonatomic, retain) NSString * Authority;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface PaymentGatewayImplementationService_PaymentVerification : NSObject <NSCoding> {
SOAPSigner *soapSigner;
/* elements */
	NSString * MerchantID;
	NSString * Authority;
	NSNumber * Amount;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (PaymentGatewayImplementationService_PaymentVerification *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
@property (retain) SOAPSigner *soapSigner;
/* elements */
@property (nonatomic, retain) NSString * MerchantID;
@property (nonatomic, retain) NSString * Authority;
@property (nonatomic, retain) NSNumber * Amount;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface PaymentGatewayImplementationService_PaymentVerificationResponse : NSObject <NSCoding> {
SOAPSigner *soapSigner;
/* elements */
	NSNumber * Status;
	NSNumber * RefID;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (PaymentGatewayImplementationService_PaymentVerificationResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
@property (retain) SOAPSigner *soapSigner;
/* elements */
@property (nonatomic, retain) NSNumber * Status;
@property (nonatomic, retain) NSNumber * RefID;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface PaymentGatewayImplementationService_PaymentVerificationWithExtra : NSObject <NSCoding> {
SOAPSigner *soapSigner;
/* elements */
	NSString * MerchantID;
	NSString * Authority;
	NSNumber * Amount;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (PaymentGatewayImplementationService_PaymentVerificationWithExtra *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
@property (retain) SOAPSigner *soapSigner;
/* elements */
@property (nonatomic, retain) NSString * MerchantID;
@property (nonatomic, retain) NSString * Authority;
@property (nonatomic, retain) NSNumber * Amount;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface PaymentGatewayImplementationService_PaymentVerificationWithExtraResponse : NSObject <NSCoding> {
SOAPSigner *soapSigner;
/* elements */
	NSNumber * Status;
	NSNumber * RefID;
	NSString * ExtraDetail;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (PaymentGatewayImplementationService_PaymentVerificationWithExtraResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
@property (retain) SOAPSigner *soapSigner;
/* elements */
@property (nonatomic, retain) NSNumber * Status;
@property (nonatomic, retain) NSNumber * RefID;
@property (nonatomic, retain) NSString * ExtraDetail;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface PaymentGatewayImplementationService_GetUnverifiedTransactions : NSObject <NSCoding> {
SOAPSigner *soapSigner;
/* elements */
	NSString * MerchantID;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (PaymentGatewayImplementationService_GetUnverifiedTransactions *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
@property (retain) SOAPSigner *soapSigner;
/* elements */
@property (nonatomic, retain) NSString * MerchantID;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface PaymentGatewayImplementationService_GetUnverifiedTransactionsResponse : NSObject <NSCoding> {
SOAPSigner *soapSigner;
/* elements */
	NSNumber * Status;
	NSString * Authorities;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (PaymentGatewayImplementationService_GetUnverifiedTransactionsResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
@property (retain) SOAPSigner *soapSigner;
/* elements */
@property (nonatomic, retain) NSNumber * Status;
@property (nonatomic, retain) NSString * Authorities;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface PaymentGatewayImplementationService_RefreshAuthority : NSObject <NSCoding> {
SOAPSigner *soapSigner;
/* elements */
	NSString * MerchantID;
	NSString * Authority;
	NSNumber * ExpireIn;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (PaymentGatewayImplementationService_RefreshAuthority *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
@property (retain) SOAPSigner *soapSigner;
/* elements */
@property (nonatomic, retain) NSString * MerchantID;
@property (nonatomic, retain) NSString * Authority;
@property (nonatomic, retain) NSNumber * ExpireIn;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface PaymentGatewayImplementationService_RefreshAuthorityResponse : NSObject <NSCoding> {
SOAPSigner *soapSigner;
/* elements */
	NSNumber * Status;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (PaymentGatewayImplementationService_RefreshAuthorityResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
@property (retain) SOAPSigner *soapSigner;
/* elements */
@property (nonatomic, retain) NSNumber * Status;
/* attributes */
- (NSDictionary *)attributes;
@end
/* Cookies handling provided by http://en.wikibooks.org/wiki/Programming:WebObjects/Web_Services/Web_Service_Provider */
#import <libxml/parser.h>
#import "xsd.h"
#import "PaymentGatewayImplementationService.h"
@class PaymentGatewayImplementationServiceBinding;
@interface PaymentGatewayImplementationService : NSObject {
	
}
+ (PaymentGatewayImplementationServiceBinding *)PaymentGatewayImplementationServiceBinding;
@end
@class PaymentGatewayImplementationServiceBindingResponse;
@class PaymentGatewayImplementationServiceBindingOperation;
@protocol PaymentGatewayImplementationServiceBindingResponseDelegate <NSObject>
- (void) operation:(PaymentGatewayImplementationServiceBindingOperation *)operation completedWithResponse:(PaymentGatewayImplementationServiceBindingResponse *)response;

@end
#define kServerAnchorCertificates   @"kServerAnchorCertificates"
#define kServerAnchorsOnly          @"kServerAnchorsOnly"
#define kClientIdentity             @"kClientIdentity"
#define kClientCertificates         @"kClientCertificates"
#define kClientUsername             @"kClientUsername"
#define kClientPassword             @"kClientPassword"
#define kNSURLCredentialPersistence @"kNSURLCredentialPersistence"
#define kValidateResult             @"kValidateResult"
@interface PaymentGatewayImplementationServiceBinding : NSObject <PaymentGatewayImplementationServiceBindingResponseDelegate> {
	NSURL *address;
	NSTimeInterval timeout;
	NSMutableArray *cookies;
	NSMutableDictionary *customHeaders;
	BOOL logXMLInOut;
	BOOL ignoreEmptyResponse;
	BOOL synchronousOperationComplete;
	id<SSLCredentialsManaging> sslManager;
	SOAPSigner *soapSigner;
}
@property (nonatomic, copy) NSURL *address;
@property (nonatomic) BOOL logXMLInOut;
@property (nonatomic) BOOL ignoreEmptyResponse;
@property (nonatomic) NSTimeInterval timeout;
@property (nonatomic, retain) NSMutableArray *cookies;
@property (nonatomic, retain) NSMutableDictionary *customHeaders;
@property (nonatomic, retain) id<SSLCredentialsManaging> sslManager;
@property (nonatomic, retain) SOAPSigner *soapSigner;
+ (NSTimeInterval) defaultTimeout;
- (id)initWithAddress:(NSString *)anAddress;
- (void)sendHTTPCallUsingBody:(NSString *)body soapAction:(NSString *)soapAction forOperation:(PaymentGatewayImplementationServiceBindingOperation *)operation;
- (void)addCookie:(NSHTTPCookie *)toAdd;
- (NSString *)MIMEType;
- (PaymentGatewayImplementationServiceBindingResponse *)PaymentRequestUsingParameters:(PaymentGatewayImplementationService_PaymentRequest *)aParameters ;
- (void)PaymentRequestAsyncUsingParameters:(PaymentGatewayImplementationService_PaymentRequest *)aParameters  delegate:(id<PaymentGatewayImplementationServiceBindingResponseDelegate>)responseDelegate;
- (PaymentGatewayImplementationServiceBindingResponse *)PaymentRequestWithExtraUsingParameters:(PaymentGatewayImplementationService_PaymentRequestWithExtra *)aParameters ;
- (void)PaymentRequestWithExtraAsyncUsingParameters:(PaymentGatewayImplementationService_PaymentRequestWithExtra *)aParameters  delegate:(id<PaymentGatewayImplementationServiceBindingResponseDelegate>)responseDelegate;
- (PaymentGatewayImplementationServiceBindingResponse *)PaymentVerificationUsingParameters:(PaymentGatewayImplementationService_PaymentVerification *)aParameters ;
- (void)PaymentVerificationAsyncUsingParameters:(PaymentGatewayImplementationService_PaymentVerification *)aParameters  delegate:(id<PaymentGatewayImplementationServiceBindingResponseDelegate>)responseDelegate;
- (PaymentGatewayImplementationServiceBindingResponse *)PaymentVerificationWithExtraUsingParameters:(PaymentGatewayImplementationService_PaymentVerificationWithExtra *)aParameters ;
- (void)PaymentVerificationWithExtraAsyncUsingParameters:(PaymentGatewayImplementationService_PaymentVerificationWithExtra *)aParameters  delegate:(id<PaymentGatewayImplementationServiceBindingResponseDelegate>)responseDelegate;
- (PaymentGatewayImplementationServiceBindingResponse *)GetUnverifiedTransactionsUsingParameters:(PaymentGatewayImplementationService_GetUnverifiedTransactions *)aParameters ;
- (void)GetUnverifiedTransactionsAsyncUsingParameters:(PaymentGatewayImplementationService_GetUnverifiedTransactions *)aParameters  delegate:(id<PaymentGatewayImplementationServiceBindingResponseDelegate>)responseDelegate;
- (PaymentGatewayImplementationServiceBindingResponse *)RefreshAuthorityUsingParameters:(PaymentGatewayImplementationService_RefreshAuthority *)aParameters ;
- (void)RefreshAuthorityAsyncUsingParameters:(PaymentGatewayImplementationService_RefreshAuthority *)aParameters  delegate:(id<PaymentGatewayImplementationServiceBindingResponseDelegate>)responseDelegate;
@end
@interface PaymentGatewayImplementationServiceBindingOperation : NSOperation {
	PaymentGatewayImplementationServiceBinding *binding;
	PaymentGatewayImplementationServiceBindingResponse *response;
	id<PaymentGatewayImplementationServiceBindingResponseDelegate> delegate;
	NSMutableData *responseData;
	NSURLConnection *urlConnection;
}
@property (nonatomic, retain) PaymentGatewayImplementationServiceBinding *binding;
@property (nonatomic, readonly) PaymentGatewayImplementationServiceBindingResponse *response;
@property (nonatomic, assign) id<PaymentGatewayImplementationServiceBindingResponseDelegate> delegate;
@property (nonatomic, retain) NSMutableData *responseData;
@property (nonatomic, retain) NSURLConnection *urlConnection;
- (id)initWithBinding:(PaymentGatewayImplementationServiceBinding *)aBinding delegate:(id<PaymentGatewayImplementationServiceBindingResponseDelegate>)aDelegate;
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;
@end
@interface PaymentGatewayImplementationServiceBinding_PaymentRequest : PaymentGatewayImplementationServiceBindingOperation {
	PaymentGatewayImplementationService_PaymentRequest * parameters;
}
@property (nonatomic, retain) PaymentGatewayImplementationService_PaymentRequest * parameters;
- (id)initWithBinding:(PaymentGatewayImplementationServiceBinding *)aBinding delegate:(id<PaymentGatewayImplementationServiceBindingResponseDelegate>)aDelegate
	parameters:(PaymentGatewayImplementationService_PaymentRequest *)aParameters
;
@end
@interface PaymentGatewayImplementationServiceBinding_PaymentRequestWithExtra : PaymentGatewayImplementationServiceBindingOperation {
	PaymentGatewayImplementationService_PaymentRequestWithExtra * parameters;
}
@property (nonatomic, retain) PaymentGatewayImplementationService_PaymentRequestWithExtra * parameters;
- (id)initWithBinding:(PaymentGatewayImplementationServiceBinding *)aBinding delegate:(id<PaymentGatewayImplementationServiceBindingResponseDelegate>)aDelegate
	parameters:(PaymentGatewayImplementationService_PaymentRequestWithExtra *)aParameters
;
@end
@interface PaymentGatewayImplementationServiceBinding_PaymentVerification : PaymentGatewayImplementationServiceBindingOperation {
	PaymentGatewayImplementationService_PaymentVerification * parameters;
}
@property (nonatomic, retain) PaymentGatewayImplementationService_PaymentVerification * parameters;
- (id)initWithBinding:(PaymentGatewayImplementationServiceBinding *)aBinding delegate:(id<PaymentGatewayImplementationServiceBindingResponseDelegate>)aDelegate
	parameters:(PaymentGatewayImplementationService_PaymentVerification *)aParameters
;
@end
@interface PaymentGatewayImplementationServiceBinding_PaymentVerificationWithExtra : PaymentGatewayImplementationServiceBindingOperation {
	PaymentGatewayImplementationService_PaymentVerificationWithExtra * parameters;
}
@property (nonatomic, retain) PaymentGatewayImplementationService_PaymentVerificationWithExtra * parameters;
- (id)initWithBinding:(PaymentGatewayImplementationServiceBinding *)aBinding delegate:(id<PaymentGatewayImplementationServiceBindingResponseDelegate>)aDelegate
	parameters:(PaymentGatewayImplementationService_PaymentVerificationWithExtra *)aParameters
;
@end
@interface PaymentGatewayImplementationServiceBinding_GetUnverifiedTransactions : PaymentGatewayImplementationServiceBindingOperation {
	PaymentGatewayImplementationService_GetUnverifiedTransactions * parameters;
}
@property (nonatomic, retain) PaymentGatewayImplementationService_GetUnverifiedTransactions * parameters;
- (id)initWithBinding:(PaymentGatewayImplementationServiceBinding *)aBinding delegate:(id<PaymentGatewayImplementationServiceBindingResponseDelegate>)aDelegate
	parameters:(PaymentGatewayImplementationService_GetUnverifiedTransactions *)aParameters
;
@end
@interface PaymentGatewayImplementationServiceBinding_RefreshAuthority : PaymentGatewayImplementationServiceBindingOperation {
	PaymentGatewayImplementationService_RefreshAuthority * parameters;
}
@property (nonatomic, retain) PaymentGatewayImplementationService_RefreshAuthority * parameters;
- (id)initWithBinding:(PaymentGatewayImplementationServiceBinding *)aBinding delegate:(id<PaymentGatewayImplementationServiceBindingResponseDelegate>)aDelegate
	parameters:(PaymentGatewayImplementationService_RefreshAuthority *)aParameters
;
@end
@interface PaymentGatewayImplementationServiceBinding_envelope : NSObject {
}
+ (PaymentGatewayImplementationServiceBinding_envelope *)sharedInstance;
- (NSString *)serializedFormUsingHeaderElements:(NSDictionary *)headerElements bodyElements:(NSDictionary *)bodyElements bodyKeys:(NSArray *)bodyKeys;
@end
@interface PaymentGatewayImplementationServiceBindingResponse : NSObject {
	NSArray *headers;
	NSArray *bodyParts;
	NSError *error;
}
@property (nonatomic, retain) NSArray *headers;
@property (nonatomic, retain) NSArray *bodyParts;
@property (nonatomic, retain) NSError *error;
@end
