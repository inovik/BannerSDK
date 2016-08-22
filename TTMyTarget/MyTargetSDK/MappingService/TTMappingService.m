//
//  TTMappingService.m
//  TTMyTarget
//
//  Created by Ivan Novikov on 31.05.16.
//  Copyright © 2016 inov. All rights reserved.
//

#import "TTMappingService.h"
#import "TTJSONSerializingProtocol.h"

@implementation TTMappingService

- (id)modelOfClass:(Class)modelClass fromJSONDictionaries:(NSArray<NSDictionary<NSString *, NSString *> *> *)JSONDictionaries {
    NSMutableArray *result = [NSMutableArray array];
    
    for (id JSONDictionary in JSONDictionaries) {
        NSDictionary *properties = [modelClass JSONKeyPathsByPropertyKey];
        
        id modelObject = [[modelClass alloc] init];
        
        for (NSString *propertyKey in properties.allKeys) {
            NSString *jsonKey = properties[propertyKey];
            id jsonValue = [JSONDictionary valueForKeyPath:jsonKey];
            
            if ([propertyKey containsString:@"."]) {
                NSArray *propertyComponents = [propertyKey componentsSeparatedByString:@"."];
                NSString *rootPropertyName = [propertyComponents firstObject];
                
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                id object = [modelObject performSelector:NSSelectorFromString(rootPropertyName)];
#pragma clang diagnostic pop
                
                if (!object) {
                    NSString *appendString = [NSString stringWithFormat:@"%@Class", rootPropertyName];
                    SEL selectorName = NSSelectorFromString(appendString);
                    
                    if ([modelClass respondsToSelector:selectorName]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                        Class propertyClass = [modelClass performSelector:selectorName];
#pragma clang diagnostic pop
                        
                        object = [[propertyClass alloc] init];
                        [modelObject setValue:object forKey:rootPropertyName];
                    }
                }
                
                [object setValue:jsonValue forKey:[propertyComponents lastObject]];
                
                continue;
            }
            
            if ([jsonValue isKindOfClass:[NSArray class]] || [jsonValue isKindOfClass:[NSDictionary class]]) {
                NSString *appendString = [NSString stringWithFormat:@"%@Class", propertyKey];
                
                SEL selectorName = NSSelectorFromString(appendString);
                
                if ([modelClass respondsToSelector:selectorName]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                    Class propertyClass = [modelClass performSelector:selectorName];
#pragma clang diagnostic pop
                    
                    if ([jsonValue isKindOfClass:[NSArray class]]) {
                        jsonValue = [self modelOfClass:propertyClass fromJSONDictionaries:jsonValue];
                    } else {
                        jsonValue = [self modelOfClass:propertyClass fromJSONDictionary:jsonValue];
                    }
                }
            } else {
                NSString *appendString = [NSString stringWithFormat:@"%@Transform:", propertyKey];
                SEL selectorName = NSSelectorFromString(appendString);
                
                if ([modelClass respondsToSelector:selectorName]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                    jsonValue = [modelClass performSelector:selectorName withObject:jsonValue];
#pragma clang diagnostic pop
                }
            }
            
            [modelObject setValue:jsonValue forKey:propertyKey];
        }
        
        if (modelObject) {
            [result addObject:modelObject];
        }
    }
    
    return result;
}

- (id)modelOfClass:(Class)modelClass fromJSONDictionary:(NSDictionary<NSString *, NSString *> *)JSONDictionary {
    assert(modelClass);
    assert(JSONDictionary);
    
    return [[self modelOfClass:modelClass fromJSONDictionaries:@[JSONDictionary]] firstObject];
}

@end
