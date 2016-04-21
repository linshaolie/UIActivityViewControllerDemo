//
//  WeiboActivity.m
//  ShareSheetTest
//
//  Created by Shaolie on 15/9/6.
//  Copyright (c) 2015年 LinShaoLie. All rights reserved.
//

#import "WeiboActivity.h"

@implementation WeiboActivity

//- (void)performActivity {
//    if (self.performActivityBlock) {
//        self.performActivityBlock();
//    }
//    [self activityDidFinish:YES];
//}

- (UIImage *)activityImage
{
    return [UIImage imageNamed:@"weibo"];
}

- (NSString *)activityTitle
{
    return @"新浪微博";
}


@end
