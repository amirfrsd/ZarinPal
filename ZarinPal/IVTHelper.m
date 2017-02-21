#import "IVTHelper.h"

@implementation IVTHelper

static NSDictionary *dotLocale ;

+(void)initialize
{
    dotLocale = [NSDictionary dictionaryWithObject:@"." forKey:NSLocaleDecimalSeparator];
}

+(DDXMLElement*) getResultElement: (DDXMLElement*) body name:(NSString*)name
{
    DDXMLElement* resultElement=(DDXMLElement*)[body childAtIndex:0];
    if([resultElement childCount]>0)
    {
        DDXMLElement* propertyElement=(DDXMLElement*)[resultElement childAtIndex:0];
        if([propertyElement.localName isEqualToString:name])
        {
            return propertyElement;
        }
    }
    if([resultElement.localName isEqualToString:name])
    {
        return resultElement;
    }
    return body;
}


+(DDXMLElement*) getNode:(DDXMLElement *) node name:(NSString*) name URI:(NSString*) URI
{
    NSArray *items= [node elementsForLocalName:name URI:URI];
    if([items count]>0)
    {
        return [items objectAtIndex:0];
    }
    return nil;
}

+(DDXMLNode*) getAttribute:(DDXMLElement *)node name:(NSString *)name
{
    return [node attributeForName: name];
}

+(DDXMLElement*) getNode:(DDXMLElement *)node name:(NSString *)name
{
    return [self getNode:node name:name index:0];
}

+(DDXMLElement*) getNode:(DDXMLElement *)node name:(NSString *)name index:(int)index
{
    NSArray *items= [node elementsForName:name];
    if([items count]>index)
    {
        DDXMLElement *element= [items objectAtIndex:index];
        return element;
    }
    return nil;
}

+(BOOL) hasAttribute:(DDXMLElement*) node name:(NSString*)name
{
    DDXMLNode* child=[IVTHelper getAttribute:node name:name];
    return child!=nil;
}

+(BOOL) isValue:(DDXMLElement*) node name:(NSString*)name
{
    if([node.localName isEqualToString:name])
    {
        DDXMLNode* nilAttr=[IVTHelper getAttribute:node name:@"nil" url:XSI];
        return nilAttr==nil;
    }
    return NO;
}

+(BOOL) hasValue:(DDXMLElement*) node name:(NSString*)name
{
    return [self hasValue:node name:name index:0];
}

+(BOOL) hasValue:(DDXMLElement*) node name:(NSString*)name index:(int)index
{
    DDXMLElement* child=[IVTHelper getNode:node name:name index:index];
    if(child!=nil)
    {
        DDXMLNode* nilAttr=[IVTHelper getAttribute:child name:@"nil" url:XSI];
        return nilAttr==nil;
    }
    return NO;
}

+(NSString*) toBoolStringFromNumber:(NSNumber*)boolNumber
{
    if(boolNumber!=nil)
    {
        return [boolNumber boolValue]?@"true":@"false";
    }
    return nil;
}

+(NSString*) toBoolStringFromBool:(BOOL)boolValue
{
    return (boolValue ==YES?@"true":@"false");
}

+(NSString*) getStringFromNumber:(NSNumber*) number
{
    return [number descriptionWithLocale:dotLocale];
}

+(NSNumber*) getNumber:(NSString*) stringNumber isDecimal:(BOOL)isDecimal
{
    if(isDecimal)
    {
        return [NSDecimalNumber decimalNumberWithString:stringNumber locale:dotLocale];
    }
    else
    {
        NSNumberFormatter* formatter=[[NSNumberFormatter alloc] init];
        [formatter setDecimalSeparator:@"."];
        return [formatter numberFromString:stringNumber];
    }
}

+(NSDate*) getDate:(NSString*) stringDate
{
    if([stringDate length]>0)
    {
    
        NSArray* formats = [NSArray arrayWithObjects:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ",
            @"yyyy-MM-dd'T'HH:mm:ss.SSS",
            @"yyyy-MM-dd'T'HH:mm:ssZZZZ",
            @"yyyy-MM-dd'T'HH:mm:ssZ",
            @"yyyy-MM-dd'T'HH:mm:ss",
            @"yyyy-MM-dd'T'HH:mmZ",
            @"yyyy-MM-dd'T'HH:mm",
            @"yyyy-MM-ddZZZZ",
            @"yyyy-MM-ddZ",
            @"yyyy-MM-dd",nil];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
        [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
        for (NSString* format in formats) {
            [dateFormatter setDateFormat:format];
            NSDate* date= [dateFormatter dateFromString:stringDate];
            if(date!=nil)
            {
                return date;
            }
        }
    }
    return nil;
}

+(NSString*) getStringFromDate:(NSDate*) date
{
    if(date!=nil)
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
        return [dateFormatter stringFromDate:date];

    }
    return nil;
}

+(NSString*) getStringFromDateTime:(NSDate*) date
{
    if(date!=nil)
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
        [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
        return [dateFormatter stringFromDate:date];

    }
    return nil;
}


+(DDXMLNode*) getAttribute:(DDXMLElement*) node name:(NSString*)name url:(NSString*) url
{
    NSString * fullName=name;
    NSString* prefix=[node resolvePrefixForNamespaceURI:url];
    if([prefix length]>0)
    {
        fullName=[prefix stringByAppendingFormat:@":%@",name];
    }
    DDXMLNode * typeAttr=[node attributeForName:fullName];
    return typeAttr;
}
@end
