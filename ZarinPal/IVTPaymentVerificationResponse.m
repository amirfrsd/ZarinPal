#import "IVTHelper.h"
#import "IVTPaymentVerificationResponse.h"


@implementation IVTPaymentVerificationResponse
@synthesize Status;
@synthesize RefID;

+ (IVTPaymentVerificationResponse *)createWithXml:(DDXMLElement *)__node __request:(IVTRequestResultHandler*) __request
{
    if(__node == nil) { return nil; }
    IVTPaymentVerificationResponse* obj = [[self alloc] init];
    [obj loadWithXml: __node __request:__request];
    return obj;
}

-(id)init {
    if ((self=[super init])) {
        self.Status =0;
        self.RefID =[NSNumber numberWithInt:0];
    }
    return self;
}

- (void) loadWithXml: (DDXMLElement*) __node __request:(IVTRequestResultHandler*) __request{
    DDXMLNode* node=__node;
    for(int i=0;i< node.childCount;i++)
    {
        DDXMLNode* node=[__node childAtIndex:i];
        if(node.kind==DDXMLElementKind)
        {
            DDXMLElement* __node=(DDXMLElement*)node;
             if([__node.localName isEqualToString:@"Status"])
             {
                if([IVTHelper isValue:__node name:@"Status"])
                {
                    self.Status = [[__node stringValue] intValue];
                }
                continue;
             }
             if([__node.localName isEqualToString:@"RefID"])
             {
                if([IVTHelper isValue:__node name:@"RefID"])
                {
                    self.RefID = [IVTHelper getNumber:[__node stringValue] isDecimal:FALSE];
                }
                continue;
             }
        }
     }
}

-(void) serialize:(DDXMLElement*)__parent __request:(IVTRequestResultHandler*) __request
{

            
    DDXMLElement* __StatusItemElement=[__request writeElement:@"Status" URI:@"http://zarinpal.com/" parent:__parent];
    [__StatusItemElement setStringValue: [NSString stringWithFormat:@"%i", self.Status]];
            
    DDXMLElement* __RefIDItemElement=[__request writeElement:RefID type:[NSNumber class] name:@"RefID" URI:@"http://zarinpal.com/" parent:__parent skipNullProperty:NO];
    if(__RefIDItemElement!=nil)
    {
        [__RefIDItemElement setStringValue:[IVTHelper getStringFromNumber:self.RefID]];
    }


}
@end
