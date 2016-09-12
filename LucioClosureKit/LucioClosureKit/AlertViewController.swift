//
//  ViewController.swift
//  LucioClosureKit
//
//  Created by 李新新 on 16/7/7.
//
//

import UIKit



class AlertViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showActionSheet(_ sender: AnyObject) {
        showActionSheet()
    }
    
    @IBAction func showAlertView(_ sender: AnyObject) {
        showAlert(duration: 0)
    }
    @IBAction func showAlertViewWithDuration(_ sender: AnyObject) {
        showAlert(duration: Double(slider.value) * 10)
    }
    
    func showAlert(duration:TimeInterval) {
        let alertview =  UIAlertView(title: "警告", message: "内存不足,是否退出", cancelButtonTitle: "取消", otherButtonTitles: ["确定"]){(alertview,buttonIndex) in
            print("button clicked")
        }
        alertview.cancel { (alertview) in
            print("alertview cancel button clicked")
        }
        alertview.willPresent { (alertview) in
            print("alertview will present")
        }
        alertview.willDismiss { (alertview, buttonIndex) in
            print("alertview will dismiss with buttonIndex : \(buttonIndex)")
        }
        alertview.didPresent { (alertview) in
            print("alertview did present")
        }
        alertview.didDissmiss { (alertview, buttonIndex) in
            print("alertview did dismiss with buttonIndex : \(buttonIndex)")
        }
        if duration == 0 {
            alertview.show()
        } else {
            alertview.show(duration: duration)
        }
    }
    
    func showActionSheet() {
        let actionSheet = UIActionSheet(title: "actionSheetTest", cancelButtonTitle: "取消", destructiveButtonTitle: "关闭", otherButtonTitles: ["按钮1","按钮2","按钮3"]){(actionSheet,buttonIndex) in
            print("actionSheet clicked button with buttonIndex : \(buttonIndex)")
        }
        actionSheet.cancel { (actionSheet) in
            print("actionSheet's cancel button clicked")
        }
        actionSheet.willPresent { (actionSheet) in
            print("actionSheet will present")
        }
        actionSheet.willDismiss { (actionSheet, buttonIndex) in
            print("actionSheet will dismiss with buttonIndex : \(buttonIndex)")
        }
        actionSheet.didPresent { (actionSheet) in
            print("actionSheet did present")
        }
        actionSheet.didDissmiss { (actionSheet, buttonIndex) in
            print("actionSheet did dismiss with buttonIndex : \(buttonIndex)")
        }
        actionSheet.show(in: view)
    }
}

