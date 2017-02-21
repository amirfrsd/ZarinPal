#import <Foundation/Foundation.h>

@class IVTHelper;
#import "IVTRequestResultHandler.h"
#import "DDXML.h"



@interface IVTPaymentVerificationResponse : NSObject <IVTISerializableObject>


@property (nonatomic,getter=getStatus) int Status;

@property (retain,nonatomic,getter=getRefID) NSNumber* RefID;
-(id)init;
-(void)loadWithXml: (DDXMLElement*)__node __request:(IVTRequestResultHandler*) __request;
+(IVTPaymentVerificationResponse*) createWithXml:(DDXMLElement*)__node __request:(IVTRequestResultHandler*) __request;
-(void) serialize:(DDXMLElement*)__parent __request:(IVTRequestResultHandler*) __request;
@end
