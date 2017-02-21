#import <Foundation/Foundation.h>
    
@interface IVTSoapError : NSError

@property (retain,nonatomic) id Details;
    
-(id)initWithDetails:(NSString*) faultString details:(id)details;
@end
