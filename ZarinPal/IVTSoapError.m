#import "IVTSoapError.h"

@implementation IVTSoapError
@synthesize Details;

-(id)initWithDetails:(NSString*) faultString details:(id)details
{
    if(self = [self initWithDomain:faultString code:0 userInfo:nil])
    {
        self.Details=details;
    }
    return self;
}
@end
