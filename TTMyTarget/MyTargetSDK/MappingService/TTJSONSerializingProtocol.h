//
//  TTJSONSerializingProtocol.h
//  TTMyTarget
//
//  Created by Ivan Novikov on 02.06.16.
//  Copyright © 2016 inov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TTJSONSerializingProtocol <NSObject>

+ (NSDictionary *)JSONKeyPathsByPropertyKey;

@end
