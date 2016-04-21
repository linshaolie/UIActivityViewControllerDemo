//
//  CustomActivity.h
//  ShareSheetTest
//
//  Created by Shaolie on 15/9/6.
//  Copyright (c) 2015年 LinShaoLie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomActivity : UIActivity {
    NSString *title;
    UIImage *image;
    NSURL *url;
}

@property (nonatomic, copy) void(^performActivityBlock)();
@end
