#import <Foundation/Foundation.h>
#import "DDXML.h"
@protocol IVTIReferenceObject
@end
    
@class IVTRequestResultHandler;
typedef void (^IVTCLB)(IVTRequestResultHandler *);

#define SOAPVERSION_10      1
#define SOAPVERSION_11      2
#define SOAPVERSION_12      3

@interface IVTRequestResultHandler : NSObject
{
    NSURLSessionDataTask* networkTask;    
    NSMutableDictionary* namespaces;
    DDXMLDocument *xml;
    int soapVersion;
    NSString* envNS;
}
@property BOOL EnableLogging;
@property (retain, nonatomic) DDXMLElement* Body;
@property (retain, nonatomic) DDXMLElement* Header;    
@property (retain, nonatomic) DDXMLElement* OutputHeader;
@property (retain, nonatomic) DDXMLElement* OutputBody;
@property (retain, nonatomic) NSError* OutputFault;

-(id) init;
-(id)init:(int) version;
-(id)createObject: (DDXMLElement*) node type:(Class) type;
-(NSString*) getEnvelopeString;
-(DDXMLDocument*) createEnvelopeXml;
-(id) createInstance:(Class) type node: (DDXMLElement*)node request :(IVTRequestResultHandler *)request;
-(DDXMLElement*) writeElement:(NSString*)name URI: (NSString*) URI parent:(DDXMLElement*) parent;
-(DDXMLElement*) writeElement:(id)obj type:(Class)type name: (NSString*)name URI: (NSString*) URI parent:(DDXMLElement*) parent skipNullProperty:(BOOL)skipNullProperty;
-(DDXMLNode*) addAttribute:(NSString*) name URI:(NSString*) URI stringValue:(NSString*) stringValue element:(DDXMLElement*) element;
-(void)setResponse:(NSData *)responseData response:(NSURLResponse*) response;
-(void) sendImplementation:(NSMutableURLRequest*) request callbackDelegate:(IVTCLB) callbackDelegate;
-(void)Cancel;    
-(NSURLSession*) createNSURLSession;
-(void) sendImplementation:(NSMutableURLRequest*) request;

-(void) prepareRequest:(NSMutableURLRequest*)request;
@end

@protocol IVTISerializableObject
-(void) serialize:(DDXMLElement*)__parent __request:(IVTRequestResultHandler*) __request;
@end

@protocol IVTSoapServiceResponse < NSObject>
- (void) onSuccess: (id) value methodName:(NSString*)methodName;
- (void) onError: (NSError*) error;
@end
