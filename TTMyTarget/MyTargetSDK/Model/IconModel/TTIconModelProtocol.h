//
//  TTIconModelProtocol.h
//  TTMyTarget
//
//  Created by Ivan Novikov on 31.05.16.
//  Copyright © 2016 inov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TTIconModelProtocol <NSObject>

@property(nonatomic, strong) NSString *iconLink;
@property(nonatomic, assign) NSInteger iconWidth;
@property(nonatomic, assign) NSInteger iconHeight;

- (instancetype)initWith:(NSString *)link
               iconWidth:(NSInteger)width
              iconHeight:(NSInteger)height;

@end
