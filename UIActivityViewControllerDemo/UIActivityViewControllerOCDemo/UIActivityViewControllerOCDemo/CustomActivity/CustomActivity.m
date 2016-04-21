//
//  CustomActivity.m
//  ShareSheetTest
//
//  Created by Shaolie on 15/9/6.
//  Copyright (c) 2015年 LinShaoLie. All rights reserved.
//

#import "CustomActivity.h"

@implementation CustomActivity


+ (UIActivityCategory)activityCategory
{
    return UIActivityCategoryShare;
}

- (NSString *)activityType
{
    return NSStringFromClass([self class]);
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
//    for (id activityItem in activityItems) {
//        if ([activityItem isKindOfClass:[UIImage class]]) {
//            return YES;
//        }
//        if ([activityItem isKindOfClass:[NSURL class]]) {
//            return YES;
//        }
//    }
//    return NO;
    return YES;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
    for (id activityItem in activityItems) {
        if ([activityItem isKindOfClass:[UIImage class]]) {
            image = activityItem;
        }
        if ([activityItem isKindOfClass:[NSURL class]]) {
            url = activityItem;
        }
        if ([activityItem isKindOfClass:[NSString class]]) {
            title = activityItem;
        }
    }
}

- (void)performActivity {
    if (self.performActivityBlock) {
        self.performActivityBlock();
    }
    [self activityDidFinish:YES];
}

@end
