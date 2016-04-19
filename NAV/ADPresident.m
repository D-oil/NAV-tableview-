//
//  ADPresident.m
//  NAV
//
//  Created by andong on 16/4/19.
//  Copyright © 2016年 com.AnDong. All rights reserved.
//

#import "ADPresident.h"

#define kPresidentNumberKey   @"Number"
#define kPresidentNameKey     @"Name"
#define kPresidentFromYearKey @"FromYear"
#define kPresidentToYearKey   @"ToYear"
#define kPresidentPartyKey    @"Party"

@implementation ADPresident

-(void)encodeWithCoder:(NSCoder *)enCoder
{
    [enCoder encodeInt:self.number forKey:kPresidentNumberKey];
    [enCoder encodeObject:self.name forKey:kPresidentNameKey];
    [enCoder encodeObject:self.fromYear forKey:kPresidentFromYearKey];
    [enCoder encodeObject:self.toYear forKey:kPresidentToYearKey];
    [enCoder encodeObject:self.party forKey:kPresidentPartyKey];
}

- (instancetype)initWithCoder:(NSCoder *)decoder
{
    if (self= [super init]) {
        self.number   = [decoder decodeIntForKey:kPresidentNumberKey];
        self.name     = [decoder decodeObjectForKey:kPresidentNameKey];
        self.fromYear = [decoder decodeObjectForKey:kPresidentFromYearKey];
        self.toYear   = [decoder decodeObjectForKey:kPresidentToYearKey];
        self.party    = [decoder decodeObjectForKey:kPresidentPartyKey];
    }
    return self;
}

@end
