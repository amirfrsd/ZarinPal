#import "IVTPaymentGatewayImplementationServiceBinding.h"
#import "IVTHelper.h"

@implementation IVTPaymentGatewayImplementationServiceBinding
@synthesize Url,ShouldAddAdornments,Headers;
@synthesize EnableLogging;

- (id) init {
    if(self = [super init])
    {
        self.Url=@"https://www.zarinpal.com/pg/services/WebGate/service";
        self.ShouldAddAdornments=YES;
    }
    return self;
}

- (id) initWithUrl: (NSString*) url {
    if(self = [self init])
    {
        self.Url=url;
    }
    return self;
}

-(void) sendImplementation:(NSMutableURLRequest*) request requestMgr:(IVTRequestResultHandler*) requestMgr
{
    [requestMgr sendImplementation:request];
}

-(IVTRequestResultHandler*) CreateRequestResultHandler
{
    IVTRequestResultHandler* handler= [[IVTRequestResultHandler alloc]init:SOAPVERSION_11];
    handler.EnableLogging = EnableLogging;
    return handler;
}

-(NSMutableURLRequest*) createRequest:(NSString *)__soapAction __request:(IVTRequestResultHandler*) __request
{
    NSURL *__url = [NSURL URLWithString:Url];
    NSMutableURLRequest *__requestObj = [NSMutableURLRequest requestWithURL:__url];
    [__request prepareRequest:__requestObj];

    [__requestObj addValue: [NSString stringWithFormat:@"\"%@\"", __soapAction] forHTTPHeaderField:@"SOAPAction"];

    for (NSString* key in self.Headers) {
        [__requestObj addValue: [self.Headers objectForKey:key] forHTTPHeaderField:key];
    }
    [__requestObj setHTTPMethod:@"POST"];


    return __requestObj;
}


-(void) sendImplementation:(NSMutableURLRequest*) request requestMgr:(IVTRequestResultHandler*) requestMgr callback:(void (^)(IVTRequestResultHandler *)) callback
{
    [requestMgr sendImplementation:request callbackDelegate:callback];
}

-(void) addAdornments:(DDXMLElement*)__methodElement
{
    if(ShouldAddAdornments)
    {
        [__methodElement addAttribute:[DDXMLNode attributeWithName:@"id" stringValue:@"o0"]];
        [__methodElement addAttribute:[DDXMLNode attributeWithName:@"c:root" stringValue:@"1"]];
    }
}

-(NSMutableURLRequest*) createPaymentRequestRequest:(NSString*) MerchantID Amount:(int) Amount Description:(NSString*) Description Email:(NSString*) Email Mobile:(NSString*) Mobile CallbackURL:(NSString*) CallbackURL __request:(IVTRequestResultHandler*) __request
{
    DDXMLElement *__methodElement=[__request writeElement:@"PaymentRequest" URI:@"http://zarinpal.com/" parent:__request.Body];
    [self addAdornments:__methodElement];
            
    DDXMLElement* __MerchantIDItemElement=[__request writeElement:MerchantID type:[NSString class] name:@"MerchantID" URI:@"http://zarinpal.com/" parent:__methodElement skipNullProperty:NO];
    if(__MerchantIDItemElement!=nil)
    {
        [__MerchantIDItemElement setStringValue:MerchantID];
    }
            
    DDXMLElement* __AmountItemElement=[__request writeElement:@"Amount" URI:@"http://zarinpal.com/" parent:__methodElement];
    [__AmountItemElement setStringValue: [NSString stringWithFormat:@"%i", Amount]];
            
    DDXMLElement* __DescriptionItemElement=[__request writeElement:Description type:[NSString class] name:@"Description" URI:@"http://zarinpal.com/" parent:__methodElement skipNullProperty:NO];
    if(__DescriptionItemElement!=nil)
    {
        [__DescriptionItemElement setStringValue:Description];
    }
            
    DDXMLElement* __EmailItemElement=[__request writeElement:Email type:[NSString class] name:@"Email" URI:@"http://zarinpal.com/" parent:__methodElement skipNullProperty:YES];
    if(__EmailItemElement!=nil)
    {
        [__EmailItemElement setStringValue:Email];
    }
            
    DDXMLElement* __MobileItemElement=[__request writeElement:Mobile type:[NSString class] name:@"Mobile" URI:@"http://zarinpal.com/" parent:__methodElement skipNullProperty:YES];
    if(__MobileItemElement!=nil)
    {
        [__MobileItemElement setStringValue:Mobile];
    }
            
    DDXMLElement* __CallbackURLItemElement=[__request writeElement:CallbackURL type:[NSString class] name:@"CallbackURL" URI:@"http://zarinpal.com/" parent:__methodElement skipNullProperty:NO];
    if(__CallbackURLItemElement!=nil)
    {
        [__CallbackURLItemElement setStringValue:CallbackURL];
    }
    
    NSMutableURLRequest* __requestObj= [self createRequest:@"#PaymentRequest"  __request:__request];
    return __requestObj;
}
    
-(IVTRequestResultHandler*) PaymentRequestAsync:(NSString*) MerchantID Amount:(int) Amount Description:(NSString*) Description Email:(NSString*) Email Mobile:(NSString*) Mobile CallbackURL:(NSString*) CallbackURL __target:(id) __target __handler:(SEL) __handler
{
    IVTRequestResultHandler* __request = [self CreateRequestResultHandler];
    NSMutableURLRequest *__requestObj=[self createPaymentRequestRequest:MerchantID Amount: Amount Description: Description Email: Email Mobile: Mobile CallbackURL: CallbackURL __request:__request];
    [self sendImplementation:__requestObj requestMgr:__request callback:^(IVTRequestResultHandler *__requestMgr) {
    id __res;
    if(__requestMgr.OutputFault==nil)
    {
        DDXMLElement *__result=[IVTHelper getResultElement:__request.OutputBody name:@"PaymentRequestResponse"];
        __res= (IVTPaymentRequestResponse*)[__request createObject:__result type:[IVTPaymentRequestResponse class]];
    }
    else
    {
        __res=__requestMgr.OutputFault;
    }
    
    IMP imp = [__target methodForSelector:__handler];
    void (*func)(id, SEL,id) = (void *)imp;
    func(__target, __handler,__res);
    }];
    return __request;
}

-(IVTRequestResultHandler*) PaymentRequestAsync:(NSString*) MerchantID Amount:(int) Amount Description:(NSString*) Description Email:(NSString*) Email Mobile:(NSString*) Mobile CallbackURL:(NSString*) CallbackURL __target:(id<IVTSoapServiceResponse>) __target
{
    IVTRequestResultHandler* __request = [self CreateRequestResultHandler];
    NSMutableURLRequest *__requestObj=[self createPaymentRequestRequest:MerchantID Amount: Amount Description: Description Email: Email Mobile: Mobile CallbackURL: CallbackURL __request:__request];
    [self sendImplementation:__requestObj requestMgr:__request callback:^(IVTRequestResultHandler *__requestMgr) {
    if(__requestMgr.OutputFault==nil)
    {
        DDXMLElement *__result=[IVTHelper getResultElement:__request.OutputBody name:@"PaymentRequestResponse"];
        [__target onSuccess:(IVTPaymentRequestResponse*)[__request createObject:__result type:[IVTPaymentRequestResponse class]] methodName:@"PaymentRequest"];
    }
    else
    {
        [__target onError:__requestMgr.OutputFault];
    }
    }];
    return __request;
}
-(IVTRequestResultHandler*) PaymentRequestAsyncWithBlock:(NSString*) MerchantID Amount:(int) Amount Description:(NSString*) Description Email:(NSString*) Email Mobile:(NSString*) Mobile CallbackURL:(NSString*) CallbackURL __handler:(void(^) (id)) __handler
{
    IVTRequestResultHandler* __request = [self CreateRequestResultHandler];
    NSMutableURLRequest *__requestObj=[self createPaymentRequestRequest:MerchantID Amount: Amount Description: Description Email: Email Mobile: Mobile CallbackURL: CallbackURL __request:__request];
    [self sendImplementation:__requestObj requestMgr:__request callback:^(IVTRequestResultHandler *__requestMgr) {
    id __res;
    if(__requestMgr.OutputFault==nil)
    {
        DDXMLElement *__result=[IVTHelper getResultElement:__request.OutputBody name:@"PaymentRequestResponse"];
        __res= (IVTPaymentRequestResponse*)[__request createObject:__result type:[IVTPaymentRequestResponse class]];
    }
    else
    {
        __res=__requestMgr.OutputFault;
    }
    
    __handler(__res);
    }];
    return __request;
    }

-(IVTPaymentRequestResponse*) PaymentRequest:(NSString*) MerchantID Amount:(int) Amount Description:(NSString*) Description Email:(NSString*) Email Mobile:(NSString*) Mobile CallbackURL:(NSString*) CallbackURL __error:(NSError**) __error
{
    IVTRequestResultHandler* __request = [self CreateRequestResultHandler];
    NSMutableURLRequest *__requestObj=[self createPaymentRequestRequest:MerchantID Amount: Amount Description: Description Email: Email Mobile: Mobile CallbackURL: CallbackURL __request:__request];
    [self sendImplementation:__requestObj requestMgr:__request ];
    if(__request.OutputFault!=nil)
    {
        if(__error)
        {
            *__error=__request.OutputFault;
        }
        return nil;
    }
    DDXMLElement *__result=[IVTHelper getResultElement:__request.OutputBody name:@"PaymentRequestResponse"];
    return (IVTPaymentRequestResponse*)[__request createObject:__result type:[IVTPaymentRequestResponse class]];
}
-(NSMutableURLRequest*) createPaymentRequestWithExtraRequest:(NSString*) MerchantID Amount:(int) Amount Description:(NSString*) Description AdditionalData:(NSString*) AdditionalData Email:(NSString*) Email Mobile:(NSString*) Mobile CallbackURL:(NSString*) CallbackURL __request:(IVTRequestResultHandler*) __request
{
    DDXMLElement *__methodElement=[__request writeElement:@"PaymentRequestWithExtra" URI:@"http://zarinpal.com/" parent:__request.Body];
    [self addAdornments:__methodElement];
            
    DDXMLElement* __MerchantIDItemElement=[__request writeElement:MerchantID type:[NSString class] name:@"MerchantID" URI:@"http://zarinpal.com/" parent:__methodElement skipNullProperty:NO];
    if(__MerchantIDItemElement!=nil)
    {
        [__MerchantIDItemElement setStringValue:MerchantID];
    }
            
    DDXMLElement* __AmountItemElement=[__request writeElement:@"Amount" URI:@"http://zarinpal.com/" parent:__methodElement];
    [__AmountItemElement setStringValue: [NSString stringWithFormat:@"%i", Amount]];
            
    DDXMLElement* __DescriptionItemElement=[__request writeElement:Description type:[NSString class] name:@"Description" URI:@"http://zarinpal.com/" parent:__methodElement skipNullProperty:NO];
    if(__DescriptionItemElement!=nil)
    {
        [__DescriptionItemElement setStringValue:Description];
    }
            
    DDXMLElement* __AdditionalDataItemElement=[__request writeElement:AdditionalData type:[NSString class] name:@"AdditionalData" URI:@"http://zarinpal.com/" parent:__methodElement skipNullProperty:NO];
    if(__AdditionalDataItemElement!=nil)
    {
        [__AdditionalDataItemElement setStringValue:AdditionalData];
    }
            
    DDXMLElement* __EmailItemElement=[__request writeElement:Email type:[NSString class] name:@"Email" URI:@"http://zarinpal.com/" parent:__methodElement skipNullProperty:YES];
    if(__EmailItemElement!=nil)
    {
        [__EmailItemElement setStringValue:Email];
    }
            
    DDXMLElement* __MobileItemElement=[__request writeElement:Mobile type:[NSString class] name:@"Mobile" URI:@"http://zarinpal.com/" parent:__methodElement skipNullProperty:YES];
    if(__MobileItemElement!=nil)
    {
        [__MobileItemElement setStringValue:Mobile];
    }
            
    DDXMLElement* __CallbackURLItemElement=[__request writeElement:CallbackURL type:[NSString class] name:@"CallbackURL" URI:@"http://zarinpal.com/" parent:__methodElement skipNullProperty:NO];
    if(__CallbackURLItemElement!=nil)
    {
        [__CallbackURLItemElement setStringValue:CallbackURL];
    }
    
    NSMutableURLRequest* __requestObj= [self createRequest:@"#PaymentRequestWithExtra"  __request:__request];
    return __requestObj;
}
    
-(IVTRequestResultHandler*) PaymentRequestWithExtraAsync:(NSString*) MerchantID Amount:(int) Amount Description:(NSString*) Description AdditionalData:(NSString*) AdditionalData Email:(NSString*) Email Mobile:(NSString*) Mobile CallbackURL:(NSString*) CallbackURL __target:(id) __target __handler:(SEL) __handler
{
    IVTRequestResultHandler* __request = [self CreateRequestResultHandler];
    NSMutableURLRequest *__requestObj=[self createPaymentRequestWithExtraRequest:MerchantID Amount: Amount Description: Description AdditionalData: AdditionalData Email: Email Mobile: Mobile CallbackURL: CallbackURL __request:__request];
    [self sendImplementation:__requestObj requestMgr:__request callback:^(IVTRequestResultHandler *__requestMgr) {
    id __res;
    if(__requestMgr.OutputFault==nil)
    {
        DDXMLElement *__result=[IVTHelper getResultElement:__request.OutputBody name:@"PaymentRequestWithExtraResponse"];
        __res= (IVTPaymentRequestWithExtraResponse*)[__request createObject:__result type:[IVTPaymentRequestWithExtraResponse class]];
    }
    else
    {
        __res=__requestMgr.OutputFault;
    }
    
    IMP imp = [__target methodForSelector:__handler];
    void (*func)(id, SEL,id) = (void *)imp;
    func(__target, __handler,__res);
    }];
    return __request;
}

-(IVTRequestResultHandler*) PaymentRequestWithExtraAsync:(NSString*) MerchantID Amount:(int) Amount Description:(NSString*) Description AdditionalData:(NSString*) AdditionalData Email:(NSString*) Email Mobile:(NSString*) Mobile CallbackURL:(NSString*) CallbackURL __target:(id<IVTSoapServiceResponse>) __target
{
    IVTRequestResultHandler* __request = [self CreateRequestResultHandler];
    NSMutableURLRequest *__requestObj=[self createPaymentRequestWithExtraRequest:MerchantID Amount: Amount Description: Description AdditionalData: AdditionalData Email: Email Mobile: Mobile CallbackURL: CallbackURL __request:__request];
    [self sendImplementation:__requestObj requestMgr:__request callback:^(IVTRequestResultHandler *__requestMgr) {
    if(__requestMgr.OutputFault==nil)
    {
        DDXMLElement *__result=[IVTHelper getResultElement:__request.OutputBody name:@"PaymentRequestWithExtraResponse"];
        [__target onSuccess:(IVTPaymentRequestWithExtraResponse*)[__request createObject:__result type:[IVTPaymentRequestWithExtraResponse class]] methodName:@"PaymentRequestWithExtra"];
    }
    else
    {
        [__target onError:__requestMgr.OutputFault];
    }
    }];
    return __request;
}
-(IVTRequestResultHandler*) PaymentRequestWithExtraAsyncWithBlock:(NSString*) MerchantID Amount:(int) Amount Description:(NSString*) Description AdditionalData:(NSString*) AdditionalData Email:(NSString*) Email Mobile:(NSString*) Mobile CallbackURL:(NSString*) CallbackURL __handler:(void(^) (id)) __handler
{
    IVTRequestResultHandler* __request = [self CreateRequestResultHandler];
    NSMutableURLRequest *__requestObj=[self createPaymentRequestWithExtraRequest:MerchantID Amount: Amount Description: Description AdditionalData: AdditionalData Email: Email Mobile: Mobile CallbackURL: CallbackURL __request:__request];
    [self sendImplementation:__requestObj requestMgr:__request callback:^(IVTRequestResultHandler *__requestMgr) {
    id __res;
    if(__requestMgr.OutputFault==nil)
    {
        DDXMLElement *__result=[IVTHelper getResultElement:__request.OutputBody name:@"PaymentRequestWithExtraResponse"];
        __res= (IVTPaymentRequestWithExtraResponse*)[__request createObject:__result type:[IVTPaymentRequestWithExtraResponse class]];
    }
    else
    {
        __res=__requestMgr.OutputFault;
    }
    
    __handler(__res);
    }];
    return __request;
    }

-(IVTPaymentRequestWithExtraResponse*) PaymentRequestWithExtra:(NSString*) MerchantID Amount:(int) Amount Description:(NSString*) Description AdditionalData:(NSString*) AdditionalData Email:(NSString*) Email Mobile:(NSString*) Mobile CallbackURL:(NSString*) CallbackURL __error:(NSError**) __error
{
    IVTRequestResultHandler* __request = [self CreateRequestResultHandler];
    NSMutableURLRequest *__requestObj=[self createPaymentRequestWithExtraRequest:MerchantID Amount: Amount Description: Description AdditionalData: AdditionalData Email: Email Mobile: Mobile CallbackURL: CallbackURL __request:__request];
    [self sendImplementation:__requestObj requestMgr:__request ];
    if(__request.OutputFault!=nil)
    {
        if(__error)
        {
            *__error=__request.OutputFault;
        }
        return nil;
    }
    DDXMLElement *__result=[IVTHelper getResultElement:__request.OutputBody name:@"PaymentRequestWithExtraResponse"];
    return (IVTPaymentRequestWithExtraResponse*)[__request createObject:__result type:[IVTPaymentRequestWithExtraResponse class]];
}
-(NSMutableURLRequest*) createPaymentVerificationRequest:(NSString*) MerchantID Authority:(NSString*) Authority Amount:(int) Amount __request:(IVTRequestResultHandler*) __request
{
    DDXMLElement *__methodElement=[__request writeElement:@"PaymentVerification" URI:@"http://zarinpal.com/" parent:__request.Body];
    [self addAdornments:__methodElement];
            
    DDXMLElement* __MerchantIDItemElement=[__request writeElement:MerchantID type:[NSString class] name:@"MerchantID" URI:@"http://zarinpal.com/" parent:__methodElement skipNullProperty:NO];
    if(__MerchantIDItemElement!=nil)
    {
        [__MerchantIDItemElement setStringValue:MerchantID];
    }
            
    DDXMLElement* __AuthorityItemElement=[__request writeElement:Authority type:[NSString class] name:@"Authority" URI:@"http://zarinpal.com/" parent:__methodElement skipNullProperty:NO];
    if(__AuthorityItemElement!=nil)
    {
        [__AuthorityItemElement setStringValue:Authority];
    }
            
    DDXMLElement* __AmountItemElement=[__request writeElement:@"Amount" URI:@"http://zarinpal.com/" parent:__methodElement];
    [__AmountItemElement setStringValue: [NSString stringWithFormat:@"%i", Amount]];
    
    NSMutableURLRequest* __requestObj= [self createRequest:@"#PaymentVerification"  __request:__request];
    return __requestObj;
}
    
-(IVTRequestResultHandler*) PaymentVerificationAsync:(NSString*) MerchantID Authority:(NSString*) Authority Amount:(int) Amount __target:(id) __target __handler:(SEL) __handler
{
    IVTRequestResultHandler* __request = [self CreateRequestResultHandler];
    NSMutableURLRequest *__requestObj=[self createPaymentVerificationRequest:MerchantID Authority: Authority Amount: Amount __request:__request];
    [self sendImplementation:__requestObj requestMgr:__request callback:^(IVTRequestResultHandler *__requestMgr) {
    id __res;
    if(__requestMgr.OutputFault==nil)
    {
        DDXMLElement *__result=[IVTHelper getResultElement:__request.OutputBody name:@"PaymentVerificationResponse"];
        __res= (IVTPaymentVerificationResponse*)[__request createObject:__result type:[IVTPaymentVerificationResponse class]];
    }
    else
    {
        __res=__requestMgr.OutputFault;
    }
    
    IMP imp = [__target methodForSelector:__handler];
    void (*func)(id, SEL,id) = (void *)imp;
    func(__target, __handler,__res);
    }];
    return __request;
}

-(IVTRequestResultHandler*) PaymentVerificationAsync:(NSString*) MerchantID Authority:(NSString*) Authority Amount:(int) Amount __target:(id<IVTSoapServiceResponse>) __target
{
    IVTRequestResultHandler* __request = [self CreateRequestResultHandler];
    NSMutableURLRequest *__requestObj=[self createPaymentVerificationRequest:MerchantID Authority: Authority Amount: Amount __request:__request];
    [self sendImplementation:__requestObj requestMgr:__request callback:^(IVTRequestResultHandler *__requestMgr) {
    if(__requestMgr.OutputFault==nil)
    {
        DDXMLElement *__result=[IVTHelper getResultElement:__request.OutputBody name:@"PaymentVerificationResponse"];
        [__target onSuccess:(IVTPaymentVerificationResponse*)[__request createObject:__result type:[IVTPaymentVerificationResponse class]] methodName:@"PaymentVerification"];
    }
    else
    {
        [__target onError:__requestMgr.OutputFault];
    }
    }];
    return __request;
}
-(IVTRequestResultHandler*) PaymentVerificationAsyncWithBlock:(NSString*) MerchantID Authority:(NSString*) Authority Amount:(int) Amount __handler:(void(^) (id)) __handler
{
    IVTRequestResultHandler* __request = [self CreateRequestResultHandler];
    NSMutableURLRequest *__requestObj=[self createPaymentVerificationRequest:MerchantID Authority: Authority Amount: Amount __request:__request];
    [self sendImplementation:__requestObj requestMgr:__request callback:^(IVTRequestResultHandler *__requestMgr) {
    id __res;
    if(__requestMgr.OutputFault==nil)
    {
        DDXMLElement *__result=[IVTHelper getResultElement:__request.OutputBody name:@"PaymentVerificationResponse"];
        __res= (IVTPaymentVerificationResponse*)[__request createObject:__result type:[IVTPaymentVerificationResponse class]];
    }
    else
    {
        __res=__requestMgr.OutputFault;
    }
    
    __handler(__res);
    }];
    return __request;
    }

-(IVTPaymentVerificationResponse*) PaymentVerification:(NSString*) MerchantID Authority:(NSString*) Authority Amount:(int) Amount __error:(NSError**) __error
{
    IVTRequestResultHandler* __request = [self CreateRequestResultHandler];
    NSMutableURLRequest *__requestObj=[self createPaymentVerificationRequest:MerchantID Authority: Authority Amount: Amount __request:__request];
    [self sendImplementation:__requestObj requestMgr:__request ];
    if(__request.OutputFault!=nil)
    {
        if(__error)
        {
            *__error=__request.OutputFault;
        }
        return nil;
    }
    DDXMLElement *__result=[IVTHelper getResultElement:__request.OutputBody name:@"PaymentVerificationResponse"];
    return (IVTPaymentVerificationResponse*)[__request createObject:__result type:[IVTPaymentVerificationResponse class]];
}
    
-(IVTRequestResultHandler*) PaymentVerificationWithExtraAsync:(NSString*) MerchantID Authority:(NSString*) Authority Amount:(NSString*) Amount __target:(id) __target __handler:(SEL) __handler
{
    /*This feature is available in Premium account, Check http://EasyWsdl.com/Payment/PremiumAccountDetails to see all benefits of Premium account*/
    return nil;
}

-(IVTRequestResultHandler*) PaymentVerificationWithExtraAsync:(NSString*) MerchantID Authority:(NSString*) Authority Amount:(NSString*) Amount __target:(id<IVTSoapServiceResponse>) __target
{
    /*This feature is available in Premium account, Check http://EasyWsdl.com/Payment/PremiumAccountDetails to see all benefits of Premium account*/
    return nil;
}
-(IVTRequestResultHandler*) PaymentVerificationWithExtraAsyncWithBlock:(NSString*) MerchantID Authority:(NSString*) Authority Amount:(NSString*) Amount __handler:(void(^) (id)) __handler
{
    /*This feature is available in Premium account, Check http://EasyWsdl.com/Payment/PremiumAccountDetails to see all benefits of Premium account*/
    return nil;
    }

-(NSString*) PaymentVerificationWithExtra:(NSString*) MerchantID Authority:(NSString*) Authority Amount:(NSString*) Amount __error:(NSError**) __error
{
    /*This feature is available in Premium account, Check http://EasyWsdl.com/Payment/PremiumAccountDetails to see all benefits of Premium account*/
    return nil;
}
    
-(IVTRequestResultHandler*) GetUnverifiedTransactionsAsync:(NSString*) MerchantID __target:(id) __target __handler:(SEL) __handler
{
    /*This feature is available in Premium account, Check http://EasyWsdl.com/Payment/PremiumAccountDetails to see all benefits of Premium account*/
    return nil;
}

-(IVTRequestResultHandler*) GetUnverifiedTransactionsAsync:(NSString*) MerchantID __target:(id<IVTSoapServiceResponse>) __target
{
    /*This feature is available in Premium account, Check http://EasyWsdl.com/Payment/PremiumAccountDetails to see all benefits of Premium account*/
    return nil;
}
-(IVTRequestResultHandler*) GetUnverifiedTransactionsAsyncWithBlock:(NSString*) MerchantID __handler:(void(^) (id)) __handler
{
    /*This feature is available in Premium account, Check http://EasyWsdl.com/Payment/PremiumAccountDetails to see all benefits of Premium account*/
    return nil;
    }

-(NSString*) GetUnverifiedTransactions:(NSString*) MerchantID __error:(NSError**) __error
{
    /*This feature is available in Premium account, Check http://EasyWsdl.com/Payment/PremiumAccountDetails to see all benefits of Premium account*/
    return nil;
}
    
-(IVTRequestResultHandler*) RefreshAuthorityAsync:(NSString*) MerchantID Authority:(NSString*) Authority ExpireIn:(NSString*) ExpireIn __target:(id) __target __handler:(SEL) __handler
{
    /*This feature is available in Premium account, Check http://EasyWsdl.com/Payment/PremiumAccountDetails to see all benefits of Premium account*/
    return nil;
}

-(IVTRequestResultHandler*) RefreshAuthorityAsync:(NSString*) MerchantID Authority:(NSString*) Authority ExpireIn:(NSString*) ExpireIn __target:(id<IVTSoapServiceResponse>) __target
{
    /*This feature is available in Premium account, Check http://EasyWsdl.com/Payment/PremiumAccountDetails to see all benefits of Premium account*/
    return nil;
}
-(IVTRequestResultHandler*) RefreshAuthorityAsyncWithBlock:(NSString*) MerchantID Authority:(NSString*) Authority ExpireIn:(NSString*) ExpireIn __handler:(void(^) (id)) __handler
{
    /*This feature is available in Premium account, Check http://EasyWsdl.com/Payment/PremiumAccountDetails to see all benefits of Premium account*/
    return nil;
    }

-(NSString*) RefreshAuthority:(NSString*) MerchantID Authority:(NSString*) Authority ExpireIn:(NSString*) ExpireIn __error:(NSError**) __error
{
    /*This feature is available in Premium account, Check http://EasyWsdl.com/Payment/PremiumAccountDetails to see all benefits of Premium account*/
    return nil;
}

@end
