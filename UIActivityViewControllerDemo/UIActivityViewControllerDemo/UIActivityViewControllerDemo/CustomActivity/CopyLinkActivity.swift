//
//  CopyLinkActivity.swift
//  UIActivityViewControllerDemo
//
//  Created by Shaolie on 15/10/1.
//  Copyright © 2015年 LinShaoLie. All rights reserved.
//

import UIKit

class CopyLinkActivity: CustomActivity {
    override class func activityCategory() -> UIActivityCategory {
        return .Action
    }
    
    override func activityTitle() -> String? {
        return "拷贝链接"
    }
    
    override func activityImage() -> UIImage? {
        return UIImage(named: "share_link")
    }
    
    override func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
        //因为是拷贝链接，所有如果不存在NSURL对象，则返回false
        for item in activityItems {
            if let _ = item as? NSURL {
                return true
            }
        }
        return false
    }
    
    override func performActivity() {
        super.performActivity()
        //拷贝需要的链接
        //...
        print("copy link to pasteboard");
        self.activityDidFinish(true)
    }
}
