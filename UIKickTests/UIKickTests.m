//
//  UIKickTests.m
//  UIKickTests
//
//  Created by Simone Marzola on 10/11/13.
//  Copyright (c) 2013 Simock85. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UKColor.h"

@interface UIKickTests : XCTestCase

@end

@implementation UIKickTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testLightColorGeneration{
    UIColor *aColor = [UIColor colorWithRed:20.f/255 green:20.f/255 blue:20.f/255 alpha:1.f];
    UIColor *bColor = [UKColor lightColorFromColor:aColor];
    CGFloat red, green, blue, alpha;
    [bColor getRed:&red green:&green blue:&blue alpha:&alpha];
    XCTAssertEqual(lroundf(red*1000), lroundf((20.f/255)*1200), @"");
}

- (void)testColorCache{
    UIColor *aColor = [UIColor colorWithRed:20.f/255 green:20.f/255 blue:20.f/255 alpha:1.f];
    UKColor.colorCache[@"acolor"] = aColor;
    XCTAssertEqual(aColor, UKColor.colorCache[@"acolor"], @"");
}

@end
