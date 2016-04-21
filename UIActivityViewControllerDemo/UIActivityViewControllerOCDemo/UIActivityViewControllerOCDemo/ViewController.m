//
//  ViewController.m
//  UIActivityViewControllerOCDemo
//
//  Created by Shaolie on 15/10/5.
//  Copyright © 2015年 LinShaoLie. All rights reserved.
//

#import "ViewController.h"
#import "WeiboActivity.h"
#import "WechatSessionActivity.h"
#import "WechatTimelineActivity.h"
#import "CopyLinkActivity.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchShowButton:(id)sender {
    NSArray *selectors = @[
                           @"shareToWeibo",
                           @"shareToWeChatTimeline",
                           @"shareToWechatSession"
                           ];
    
    //添加Share
    Class classes[3] = {
        [WeiboActivity class],
        [WechatTimelineActivity class],
        [WechatSessionActivity class]
    };
    NSMutableArray *activitys = [NSMutableArray arrayWithCapacity:3];
    for (int i = 0; i < 3; i++) {
        id activity = [[classes[i] alloc] init];
        [activity setPerformActivityBlock:^{
            #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [self performSelector:NSSelectorFromString(selectors[i]) withObject:nil];
        }];
        [activitys addObject:activity];
    }
    
    //添加Action
    CopyLinkActivity *copyLinkActivity = [[CopyLinkActivity alloc] init];
    [copyLinkActivity setPerformActivityBlock:^{
        [self copyLink:@"http://helloseed.io"];
    }];
    [activitys addObject:copyLinkActivity];

/*
    NSString *textToShare = @"分享的文字";
    UIImage *image = [UIImage imageNamed:@"seed"];
    NSURL *urlToShare = [NSURL URLWithString:@"http://helloseed.io"];
    NSArray *activityItems = @[urlToShare, image, textToShare];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:activitys];
    
    activityVC.excludedActivityTypes = @[UIActivityTypePrint, UIActivityTypeCopyToPasteboard,
                                         UIActivityTypeAssignToContact,UIActivityTypeMessage, UIActivityTypePostToWeibo, UIActivityTypeSaveToCameraRoll,UIActivityTypePostToTwitter,UIActivityTypeMail,
                                         UIActivityTypePostToFlickr,UIActivityTypePostToFacebook];
    activityVC.completionWithItemsHandler = ^(NSString *activityType, BOOL completed, NSArray *returnedItems, NSError *activityError) {
        [self alert:@"成功"];
    };
 */
    NSArray *activityItems = @[];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:activitys];
    
    [self presentViewController:activityVC animated:YES completion:nil];
}

//拷贝链接
- (void)copyLink:(NSString *)link {
    [self alert:@"拷贝成功"];
}

//分享到微博
- (void)shareToWeibo {
    [self alert:@"成功分享到微博"];
}

//分享到微信朋友
- (void)shareToWeChatTimeline {
    [self alert:@"成功分享到微信朋友"];
}

//分享到微信朋友圈
- (void)shareToWechatSession {
        [self alert:@"成功分享到微信朋友圈"];
}

//弹出框
- (void)alert:(NSString *)text {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:text preferredStyle:(UIAlertControllerStyleAlert)];
    [self presentViewController:alertVC animated:YES completion:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [alertVC dismissViewControllerAnimated:YES completion:nil];
    });
    
}
@end
