#import "IVTPaymentRequestResponse.h"
#import "IVTPaymentRequestWithExtraResponse.h"
#import "IVTPaymentVerificationResponse.h"
#import "IVTHelper.h"
#import "IVTRequestResultHandler.h"
#import "IVTSoapError.h"


@protocol IVTSoapServiceResponse < NSObject>
- (void) onSuccess: (id) value methodName:(NSString*)methodName;
- (void) onError: (NSError*) error;
@end
@implementation IVTRequestResultHandler

@synthesize Header,Body;
@synthesize OutputHeader,OutputBody,OutputFault;
@synthesize EnableLogging;
static NSDictionary* classNames;

- (id) init {
    if(self = [self init:SOAPVERSION_11])
    {
    }
    return self;
}

-(id)init:(int)version {
    if ((self=[super init])) {
        soapVersion=version;
        envNS=(soapVersion==SOAPVERSION_12?@"http://www.w3.org/2003/05/soap-envelope":@"http://schemas.xmlsoap.org/soap/envelope/");
        namespaces=[NSMutableDictionary dictionary];
        [self createEnvelopeXml];

        if(!classNames)
        {
            classNames = [NSDictionary dictionaryWithObjectsAndKeys:    
            [IVTPaymentRequestResponse class],@"http://zarinpal.com/^^PaymentRequestResponse",
            [IVTPaymentRequestWithExtraResponse class],@"http://zarinpal.com/^^PaymentRequestWithExtraResponse",
            [IVTPaymentVerificationResponse class],@"http://zarinpal.com/^^PaymentVerificationResponse",
            nil]; 

        }
    }
    return self;
}

    
-(NSString*) getEnvelopeString
{
    return [[xml rootElement] XMLString];
}

-(DDXMLDocument*) createEnvelopeXml
{
    NSString *envelope=nil;
    if(soapVersion==SOAPVERSION_12)
    {
        envelope = [NSString stringWithFormat:@"<soap:Envelope xmlns:c=\"http://www.w3.org/2003/05/soap-encoding\" xmlns:soap=\"%@\"></soap:Envelope>",envNS];
    }
    else
    {
        envelope = [NSString stringWithFormat:@"<soap:Envelope xmlns:c=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:soap=\"%@\"></soap:Envelope>",envNS];
    }
    
    xml = [[DDXMLDocument alloc] initWithXMLString:envelope options:0 error:nil];
    
    DDXMLElement *root=[xml rootElement];
    Header=[[DDXMLElement alloc] initWithName:@"soap:Header"];
    Body=[[DDXMLElement alloc] initWithName:@"soap:Body"];
    [root addChild:Header];
    [root addChild:Body];
    return xml;
}

-(id)createObject: (DDXMLElement*) node type:(Class) type
{
    
    DDXMLNode* nilAttr=[IVTHelper getAttribute:node name:@"nil" url:XSI];
    if(nilAttr!=nil && [[nilAttr stringValue]boolValue])
    {
        return nil;
    }

    DDXMLNode* typeAttr=[IVTHelper getAttribute:node name:@"type" url:XSI];
    if(typeAttr !=nil)
    {
        NSString* attrValue=[typeAttr stringValue];
        NSArray* splitString=[attrValue componentsSeparatedByString:@":"];
        DDXMLNode* namespace=[node resolveNamespaceForName:attrValue];
        NSString* typeName=[splitString count]==2?[splitString objectAtIndex:1]:attrValue;
        if(namespace!=nil)
        {
            NSString* classType=[NSString stringWithFormat:@"%@^^%@",[namespace stringValue],typeName];
            Class temp=[classNames objectForKey: classType];
            if(temp!=nil)
            {
                type=temp;
            }
        }
    }

    DDXMLNode* hrefAttr=[IVTHelper getAttribute:node name:@"href" url:@""];
    if(hrefAttr==nil)
    {
        hrefAttr=[IVTHelper getAttribute:node name:@"ref" url:@""];
    }
    if(hrefAttr!=nil)
    {
        NSString* hrefId=[[hrefAttr stringValue] substringFromIndex:1];
        NSString* xpathQuery=[NSString stringWithFormat:@"//*[@id='%@']",hrefId];
        NSArray *nodes=[node.rootDocument nodesForXPath:xpathQuery error:nil];

        if([nodes count]>0)
        {
            node=[nodes objectAtIndex:0];
        }
    }

    id obj=[self createInstance:type node:node request:self];
   
    return obj;
}


-(id) createInstance:(Class) type node: (DDXMLElement*)node request :(IVTRequestResultHandler *)request
{
    SEL initSelector=@selector(loadWithXml:__request:);
    id allocObj=[[type alloc] init];


    IMP imp = [allocObj methodForSelector:initSelector];
    void (*func)(id, SEL, DDXMLNode*, IVTRequestResultHandler *) = (void *)imp;
    func(allocObj, initSelector, node, self);
    return allocObj;
}

-(NSString*) getNamespacePrefix:(NSString*) url propertyElement:(DDXMLElement*) propertyElement
{
    if([url length]==0)
    {
        return nil;
    }
    DDXMLElement* rootElement= [[propertyElement rootDocument] rootElement];
    NSString* prefix= [namespaces valueForKey:url];
    if(prefix==nil)
    {
        prefix=[NSString stringWithFormat:@"n%u",[namespaces count]+1];
        DDXMLNode* ns=[DDXMLNode namespaceWithName:prefix stringValue:url];
        [rootElement addNamespace:ns];
        [namespaces setValue:prefix forKey:url];
    }
    return prefix;
}
        
-(NSString*) getXmlFullName:(NSString*) name URI:(NSString*) URI propertyElement:(DDXMLElement*) propertyElement
{
    NSString *prefix=[self getNamespacePrefix:URI propertyElement:propertyElement];
    NSString *fullname=name;
    if(prefix!=nil)
    {
        fullname=[NSString stringWithFormat:@"%@:%@",prefix,name];
    }
    return fullname;
}
    
-(DDXMLNode*) addAttribute:(NSString*) name URI:(NSString*) URI stringValue:(NSString*) stringValue element:(DDXMLElement*) element
{
    NSString *fullname=[self getXmlFullName:name URI:URI propertyElement:element];
    DDXMLNode *refAttr=[DDXMLNode attributeWithName:fullname stringValue:stringValue];
    [element addAttribute:refAttr];
    return refAttr;
}

-(DDXMLElement*) writeElement:(NSString*)name URI: (NSString*) URI parent:(DDXMLElement*) parent
{
    NSString *fullname=[self getXmlFullName:name URI:URI propertyElement:parent];
    DDXMLElement* propertyElement=[[DDXMLElement alloc] initWithName:fullname];
    [parent addChild:propertyElement];
    return propertyElement;
}


-(DDXMLElement*) writeElement:(id)obj type:(Class)type name: (NSString*)name URI: (NSString*) URI parent:(DDXMLElement*) parent skipNullProperty:(BOOL)skipNullProperty
{
    if(obj==nil && skipNullProperty)
    {
        return nil;
    }
    DDXMLElement* propertyElement=[self writeElement:name URI:URI parent:parent];
    
    if(obj==nil)
    {
        [self addAttribute:@"nil" URI:XSI stringValue:@"true" element:propertyElement];
        return nil;
    }

    Class currentType=[obj class];
    if(currentType!=type)
    {
        NSString* xmlType=(NSString*)[[classNames allKeysForObject:currentType] lastObject];//add namespace?
        if(xmlType!=nil)
        {
            
            NSArray* splitType=[xmlType componentsSeparatedByString:@"^^"];
            NSString *fullname=[self getXmlFullName:[splitType objectAtIndex:1] URI:[splitType objectAtIndex:0] propertyElement:propertyElement];
            [self addAttribute:@"type" URI:XSI stringValue:fullname element:propertyElement];
        }
        
    }
    return propertyElement;
}


        
-(void)setResponse:(NSData *)responseData response:(NSURLResponse*) response
{
    if(self.EnableLogging) {
        NSString* strResponse = [[NSString alloc] initWithData: responseData encoding: NSUTF8StringEncoding];
        NSLog(@"%@\n", strResponse);
    }
    DDXMLDocument *__doc=[[DDXMLDocument alloc] initWithData:responseData options:0 error:nil];
    DDXMLElement *__root=[__doc rootElement];
    if(__root==nil)
    {
        NSString* errorMessage=[[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding ];
        OutputFault=[NSError  errorWithDomain:errorMessage code:0 userInfo:nil];
        return;
    }
    OutputBody=[IVTHelper getNode:__root  name:@"Body" URI:envNS];
    OutputHeader=[IVTHelper getNode:__root  name:@"Header" URI:envNS];
    DDXMLElement* fault=[IVTHelper getNode:OutputBody  name:@"Fault" URI:envNS];
    if(fault!=nil)
    {
        DDXMLElement* faultString=[IVTHelper getNode:fault name:@"faultstring"];
        if(faultString == nil)
        {
            faultString=[IVTHelper getNode:fault name:@"Reason"];
            if(faultString!=nil)
            {
                faultString = [IVTHelper getNode:faultString name:@"Text"];
            }
        }
        id faultObj=nil;
        DDXMLElement* faultDetail=[IVTHelper getNode:fault name:@"detail"];
        if(faultDetail!=nil)
        {
            DDXMLElement* faultClass=(DDXMLElement*)[faultDetail childAtIndex:0];
            if(faultClass!=nil)
            {
                NSString * typeName=[faultClass localName];
                DDXMLNode* namespaceNode=[faultClass resolveNamespaceForName:typeName];
                NSString* namespace=nil;
                if(namespaceNode==nil)
                {
                    namespace=[faultClass URI];
                }
                else
                {
                    namespace=[namespaceNode stringValue];
                }
                NSString* classType=[NSString stringWithFormat:@"%@^^%@",namespace,typeName];
                Class temp=[classNames objectForKey: classType];
                if(temp!=nil)
                {
                    faultObj= [self createInstance:temp node:faultClass request:self];
                }
            }
        }
        
        OutputFault=[[IVTSoapError alloc] initWithDetails:[faultString stringValue] details:faultObj];
    }
}

-(void) sendImplementation:(NSMutableURLRequest*) request
{
    if(self.EnableLogging) {
        NSString* strRequest = [[NSString alloc] initWithData: request.HTTPBody encoding: NSUTF8StringEncoding];
        NSLog(@"%@\n", strRequest);
    }
    
    __block NSURLResponse * response;
    __block NSError * innerError;
    __block NSData *  data;

   dispatch_semaphore_t sem = dispatch_semaphore_create(0);

   NSURLSession* connection=[self createNSURLSession];
   [[connection dataTaskWithRequest:request
   completionHandler:^(NSData *responseData, NSURLResponse *responseObj, NSError *error) {
       if(error!=nil)
       {
           innerError = error;
       }
       if(response!=nil)
       {
           response = responseObj;
       }

       if(error==nil)
       {
           data=responseData;
       }
       dispatch_semaphore_signal(sem);
       }] resume];

   dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    

    if(data==nil)
    {
        OutputFault = innerError;
    }
    else
    {
        [self setResponse:data response:response];
    }
}

-(NSURLSession*) createNSURLSession
{
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *connection = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    return connection;
}

-(void) sendImplementation:(NSMutableURLRequest*) request callbackDelegate:(IVTCLB) callbackDelegate
{
    if(self.EnableLogging) {
        NSString* strRequest = [[NSString alloc] initWithData: request.HTTPBody encoding: NSUTF8StringEncoding];
        NSLog(@"%@\n", strRequest);
    }
    NSURLSession* connection=[self createNSURLSession];
    networkTask=[connection dataTaskWithRequest:request
                  completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                      OutputFault=error;
                      if(error==nil)
                      {
                          [self setResponse:data response:response];
                      }
                      if(error==nil || error.code!=NSURLErrorCancelled)
                      {
                          callbackDelegate(self);
                      }

                      networkTask = nil;
                  }];

    [networkTask resume];
}

-(void)Cancel
{
    if(networkTask!=nil)
    {

        [networkTask cancel];
        networkTask=nil;
    }
}
-(void) prepareRequest:(NSMutableURLRequest*)__requestObj
{
    NSData *__soapMessageData=nil;
    {
        __soapMessageData=[[self getEnvelopeString] dataUsingEncoding:NSUTF8StringEncoding];
        [__requestObj addValue: soapVersion==SOAPVERSION_12?@"application/soap+xml; charset=utf-8":@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    }

    NSString *msgLength = [NSString stringWithFormat:@"%u", [__soapMessageData length]];
    [__requestObj addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [__requestObj setHTTPBody: __soapMessageData];
}
 



@end
