//
//  WeiboActivity.swift
//  UIActivityViewControllerDemo
//
//  Created by Shaolie on 15/10/1.
//  Copyright © 2015年 LinShaoLie. All rights reserved.
//

import UIKit

class WeiboActivity: CustomActivity {
    override func activityTitle() -> String? {
        return "新浪微博"
    }
    
    override func activityImage() -> UIImage? {
        return UIImage(named: "weibo")
    }
    
//    override func performActivity() {
//        super.performActivity()
//        //将需要分享的数据通过微博SDK进行分享
//        //...
//        print("share to weibo");
//        self.activityDidFinish(true)
//    }
}
