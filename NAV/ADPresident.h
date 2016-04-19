//
//  ADPresident.h
//  NAV
//
//  Created by andong on 16/4/19.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADPresident : NSObject <NSCoding>

@property (nonatomic,assign) int      number;
@property (nonatomic,copy  ) NSString *name;
@property (nonatomic,copy  ) NSString *fromYear;
@property (nonatomic,copy  ) NSString *toYear;
@property (nonatomic,copy  ) NSString *party;

@end
