#import "IVTHelper.h"
#import "IVTPaymentRequestResponse.h"


@implementation IVTPaymentRequestResponse
@synthesize Status;
@synthesize Authority;

+ (IVTPaymentRequestResponse *)createWithXml:(DDXMLElement *)__node __request:(IVTRequestResultHandler*) __request
{
    if(__node == nil) { return nil; }
    IVTPaymentRequestResponse* obj = [[self alloc] init];
    [obj loadWithXml: __node __request:__request];
    return obj;
}

-(id)init {
    if ((self=[super init])) {
        self.Status =0;
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
             if([__node.localName isEqualToString:@"Authority"])
             {
                if([IVTHelper isValue:__node name:@"Authority"])
                {
                    self.Authority = [__node stringValue];
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
            
    DDXMLElement* __AuthorityItemElement=[__request writeElement:Authority type:[NSString class] name:@"Authority" URI:@"http://zarinpal.com/" parent:__parent skipNullProperty:NO];
    if(__AuthorityItemElement!=nil)
    {
        [__AuthorityItemElement setStringValue:self.Authority];
    }


}
@end
