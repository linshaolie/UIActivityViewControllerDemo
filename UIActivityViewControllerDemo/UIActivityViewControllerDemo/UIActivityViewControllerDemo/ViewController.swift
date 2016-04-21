//
//  ViewController.swift
//  UIActivityViewControllerDemo
//
//  Created by Shaolie on 15/9/22.
//  Copyright © 2015年 LinShaoLie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchShowButton(sender: UIButton) {
        let image = UIImage(named: "seed")
        let str = "hello iOS9"
        let url = NSURL(string: "http://helloseed.io")
        let items:[AnyObject] = [image!, str, url!];
        
        let weibo = WeiboActivity()
        let copylink = CopyLinkActivity()
        let wechatSession = WechatSessionActivity()
        let wechatTimeline = WechatTimelineActivity()
        
        let vc = UIActivityViewController(activityItems: items, applicationActivities: [weibo, copylink, wechatTimeline, wechatSession])
        vc.excludedActivityTypes = [UIActivityTypeMail, UIActivityTypeAddToReadingList, UIActivityTypeAssignToContact];
        self.presentViewController(vc, animated: true, completion: nil)
        
        vc.completionWithItemsHandler = {(activityType:String?, completed:Bool, returnedItems:[AnyObject]?, activityError:NSError?) -> Void in
            if completed {
                self.alert("成功")
            }
            vc.completionWithItemsHandler = nil
        }
    }
    
    func alert(msg: String!) {
        let alertControler = UIAlertController(title: "提示", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        self.presentViewController(alertControler, animated: true, completion: nil)
        dispatch_after(UInt64(Double(NSEC_PER_SEC)*0.7), dispatch_get_main_queue()) { () -> Void in
            alertControler.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}

