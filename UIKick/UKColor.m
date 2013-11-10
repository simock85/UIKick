//
//  UKColor.m
//  UIKick
//
//  Created by Simone Marzola on 10/11/13.
//  Copyright (c) 2013 Simock85. All rights reserved.
//

#import "UKColor.h"

@interface UKColorSettings : NSObject{
    @public
    CGFloat firstStepBrightnessMultiplier;
    CGFloat secondStepBrightnessMultiplier;
}

@end

@implementation UKColorSettings

- (id)init{
    self = [super init];
    if (self){
        self->firstStepBrightnessMultiplier = 1.2f;
        self->secondStepBrightnessMultiplier = 1.4f;
    }
    return self;
}

@end

@implementation UKColor

+ (NSMutableDictionary*)colorCache{
    static NSMutableDictionary *cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [NSMutableDictionary dictionary];
    });
    return cache;
}

+ (void)setFirstStepBrightnessMultiplier:(CGFloat)multiplier{
    self.settings->firstStepBrightnessMultiplier = multiplier;
}

+ (void)setSecondStepBrightnessMultiplier:(CGFloat)multiplier{
    self.settings->secondStepBrightnessMultiplier = multiplier;
}

+ (UIColor*)color:(id)color withBrightnessMultiplier:(CGFloat)multiplier{
    CGFloat hue, saturation, brightness, alpha;
    UIColor *actualColor = [self actualColorOrColorFromCache:color];
    if ([actualColor getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha]){
        return [UIColor colorWithHue:hue
                          saturation:saturation
                          brightness:MIN(brightness*multiplier, 1.0)
                               alpha:alpha];
    }
    return nil;
}

+ (UIColor*)lightColorFromColor:(id)color{
    return [self color:color withBrightnessMultiplier:self.settings->firstStepBrightnessMultiplier];
}

+ (UIColor*)lighterColorFromColor:(id)color{
    return [self color:color withBrightnessMultiplier:self.settings->secondStepBrightnessMultiplier];
}

+ (UIColor*)darkColorFromColor:(id)color{
    return [self color:color withBrightnessMultiplier:1.f/self.settings->firstStepBrightnessMultiplier];
}

+ (UIColor*)darkerColorFromColor:(id)color{
    return [self color:color withBrightnessMultiplier:1.f/self.settings->secondStepBrightnessMultiplier];
}

+ (UKColorSettings*)settings{
    static UKColorSettings *settings;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        settings = [[UKColorSettings alloc]init];
    });
    return settings;
}

+ (UIColor*)actualColorOrColorFromCache:(id)color{
    if ([color isKindOfClass:[UIColor class]]){
        return color;
    }else if ([color isKindOfClass:[NSString class]]){
        return UKColor.colorCache[color];
    }else{
        [NSException raise:@"Invalid Color" format:@"color should be an istance of UIColor or NSString"];
    }
    return nil;
}

@end
