//
//  TextViewController.swift
//  LucioClosureKit
//
//  Created by 李新新 on 16/7/12.
//
//

import UIKit

class TextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.lightGrayColor()
        
        let margin:CGFloat = 10
        let screenWidth = UIScreen.mainScreen().bounds.width
        
        let textField = UITextField(frame: CGRect(x: margin, y: 20, width: screenWidth - 2 * margin, height: 40))
        textField.backgroundColor = UIColor.whiteColor()
        textField.clearButtonMode = .Always
        view.addSubview(textField)
        
        textField.shouldBeginEditing { (textField) -> Bool in
            print("textField should begin editing called")
            return true
        }
        textField.didBeginEditing { (textField) in
            print("textField did begin editing called")
        }
        textField.shouldChangeTextInRange { (textView, range, text) -> Bool in
            print("textField should change text : \(text) in range : \(range) called")
            return true
        }
        textField.shouldEndEditing { (textField) -> Bool in
            print("textField should end editing called")
            return true
        }
        textField.didEndEditing { (textField) in
            print("textField did end editing called")
        }
        textField.shouldClear { (textField) -> Bool in
            print("textField should clear called")
            return true
        }
        textField.shouldReturn { (textField) -> Bool in
            print("textField should return called")
            textField.resignFirstResponder()
            return false
        }
        
        let textView = UITextView(frame: CGRect(x: margin, y: 65, width: screenWidth - margin * 2, height: 400))
        textView.backgroundColor = UIColor.whiteColor()
        textView.returnKeyType = UIReturnKeyType.Done
        textView.font = UIFont.systemFontOfSize(16)
        
//        let attrStr = NSMutableAttributedString(string: "This is an example by @marcelofabri_")
//        attrStr.addAttribute(NSLinkAttributeName, value: "username://marcelofabri_", range: (attrStr.string as NSString).rangeOfString("@marcelofabri_"))
//
//        let linkAttrs = [NSForegroundColorAttributeName:UIColor.greenColor(),
//                         NSUnderlineColorAttributeName:UIColor.lightGrayColor(),
//                         NSUnderlineStyleAttributeName:NSUnderlineStyle.PatternSolid.rawValue]
//
//        textView.attributedText = attrStr
//        textView.linkTextAttributes = linkAttrs
//        textView.editable = false //测试 shouldInteractWithURL, shouldInteractWithTextAttachment
        
        textView.shouldBeginEditing { (textView) -> Bool in
            print("textView should begin editing called")
            return true
        }
        textView.didBeginEditing { (textView) in
            print("textView did begin editing called")
        }
        textView.shouldEndEditing { (textView) -> Bool in
            print("textView should end editing called")
            return true
        }
        textView.didEndEditing { (textView) in
            print("textView did end editing called")
        }
        textView.didChangeSelection { (textView) in
            print("textView did Change selection called")
        }
        textView.shouldChangeTextInRange { (textView, range, text) -> Bool in
            print("textView should change text : \(text) in range : \(range) called")
            return true
        }
        textView.shouldReturn { (textView) -> Bool in
            print("textView should return called")
            textView.resignFirstResponder()
            return false
        }
        textView.shouldInteractWithURL { (textView, url, range) -> Bool in
            print("textView should interact with url called")
            return true
        }
        textView.shouldInteractWithTextAttachment { (textView, textAttachment, range) -> Bool in
            print("textView should interact with textAttachment called")
            return true
        }
        view.addSubview(textView)
    }
}
