//
//  CopyLinkActivity.m
//  Seeds
//
//  Created by Shaolie on 15/9/6.
//  Copyright (c) 2015年 Seed. All rights reserved.
//

#import "CopyLinkActivity.h"

@implementation CopyLinkActivity

+ (UIActivityCategory)activityCategory {
    return UIActivityCategoryAction;
}

- (UIImage *)activityImage {
    return [UIImage imageNamed:@"share_link"];
}

- (NSString *)activityTitle {
    return @"复制链接";
}

@end
