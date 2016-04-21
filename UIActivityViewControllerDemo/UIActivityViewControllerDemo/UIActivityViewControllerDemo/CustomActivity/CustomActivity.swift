//
//  CustomActivity.swift
//  UIActivityViewControllerDemo
//
//  Created by Shaolie on 15/10/1.
//  Copyright © 2015年 LinShaoLie. All rights reserved.
//

import UIKit

public typealias FinishedBlock = () -> Void

class CustomActivity: UIActivity {
    var title:String?
    var image:UIImage?
    var url:NSURL?
    
    var finishedBlock:FinishedBlock?
    
    override class func activityCategory() -> UIActivityCategory {
        return .Share
    }
    
    override func activityType() -> String? {
        return NSStringFromClass(self.classForCoder)
    }
    
    /**
    返回是否可以执行
    
    - parameter activityItems: 从调用处传进来的items，可以通过这个items里面存放的类型数据来判断是否可以执行
    
    - returns: 返回true，则这个activity就会在controller上出现；否则，则不会出现
    */
    override func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
        //只要items有数据，就返回true。
        if activityItems.count > 0 {
            return true
        }
        return false
    }
    
    /**
    准备数据
    
    - parameter activityItems: 数据对象数组
    */
    override func prepareWithActivityItems(activityItems: [AnyObject]) {
        for activityItem in activityItems {
            if let title = activityItem as? String {
                self.title = title
            } else if let image = activityItem as? UIImage {
                self.image = image
            } else if let url = activityItem as? NSURL {
                self.url = url
            }
        }
    }
    
    /**
    执行点击
    */
    override func performActivity() {
        super.performActivity()
        
        if let block = self.finishedBlock {
            block()
        }
        
        self.activityDidFinish(true)
    }
}
