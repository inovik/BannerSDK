//
//  TTResponseSerializer.m
//  TTMyTarget
//
//  Created by Ivan Novikov on 02.06.16.
//  Copyright © 2016 inov. All rights reserved.
//

#import "TTResponseSerializer.h"

@implementation TTResponseSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data {
    id responseObject = nil;

    NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    if (responseString && ![responseString isEqualToString:@" "]) {
        data = [responseString dataUsingEncoding:NSUTF8StringEncoding];

        if (data.length > 0) {
            responseObject = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                NSMutableDictionary *jsonDictionary = [responseObject[@"nativeads"] mutableCopy];
                NSDictionary *bannerDict = [(NSArray *)jsonDictionary[@"banners"] firstObject];
                jsonDictionary[@"banners"] = bannerDict;
                responseObject = [jsonDictionary copy];
            }
        }
    }
    
    return responseObject;
}

@end
