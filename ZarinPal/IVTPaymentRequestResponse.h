#import <Foundation/Foundation.h>

#import "IVTRequestResultHandler.h"
#import "DDXML.h"



@interface IVTPaymentRequestResponse : NSObject <IVTISerializableObject>


@property (nonatomic,getter=getStatus) int Status;

@property (retain,nonatomic,getter=getAuthority) NSString* Authority;
-(id)init;
-(void)loadWithXml: (DDXMLElement*)__node __request:(IVTRequestResultHandler*) __request;
+(IVTPaymentRequestResponse*) createWithXml:(DDXMLElement*)__node __request:(IVTRequestResultHandler*) __request;
-(void) serialize:(DDXMLElement*)__parent __request:(IVTRequestResultHandler*) __request;
@end
