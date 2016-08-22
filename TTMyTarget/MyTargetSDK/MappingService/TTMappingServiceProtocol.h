//
//  TTMappingServiceProtocol.h
//  TTMyTarget
//
//  Created by Ivan Novikov on 31.05.16.
//  Copyright © 2016 inov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTBaseBannerModel.h"

@protocol TTMappingServiceProtocol <NSObject>

- (id)modelOfClass:(Class)modelClass fromJSONDictionary:(NSDictionary<NSString *, NSString *> *)JSONDictionary;

@end
