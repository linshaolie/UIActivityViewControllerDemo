//
//  WechatSessionActivity.swift
//  UIActivityViewControllerDemo
//
//  Created by Shaolie on 15/10/3.
//  Copyright © 2015年 LinShaoLie. All rights reserved.
//

import UIKit

class WechatSessionActivity: CustomActivity {
    override func activityTitle() -> String? {
        return "微信朋友"
    }
    
    override func activityImage() -> UIImage? {
       return UIImage(named: "wechat_session")
    }
}
