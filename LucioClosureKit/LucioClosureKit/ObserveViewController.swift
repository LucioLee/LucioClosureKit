//
//  ObserveViewController.swift
//  LucioClosureKit
//
//  Created by 李新新 on 16/7/12.
//
//

import UIKit


class Person: NSObject {
    dynamic var name:String = "1"
    dynamic var age: Int = 0
}

class ObserveViewController: UIViewController {
    
    var person = Person()
    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var ageInput: UITextField!
    
    @IBOutlet weak var commitbtn: UIButton!
    // 仅作测试就不校验了，不要胡乱输入
    @IBAction func commit(sender: AnyObject) {
        person.name = nameInput.text!.trim.isEmpty ? "小明" : nameInput.text!.trim
        person.age = ageInput.text!.trim.isEmpty ? 18 : (ageInput.text!.trim.isPureInt ? Int(ageInput.text!.trim)! : 18)
        commitbtn.postEvent(event: "commitButtonClickedNotification")
    }
    override func viewDidLoad() {
         super.viewDidLoad()

        // KVO
        self.observe(object: person, keyPath: "name", options:[.New,.Old]) { (object, keyPath, changes) in
            print("object is \(object), keyPath is \(keyPath) change is \(changes)")
        }
        self.observe(object: person, keyPath: "age", options:[.New,.Old]) { (object, keyPath, changes) in
            print("object is \(object), keyPath is \(keyPath) change is \(changes)")
        }

        self.observe { (notification) in
            print("监听所有通知：name is \(notification.name)")
        }
        self.observe(event: "commitButtonClickedNotification") { (notification) in
            print("根据通知名监听通知：name is \(notification.name)")
        }
        self.observe(event: "commitButtonClickedNotification", object: commitbtn) { (notification) in
            print("监听指定对象的指定通知：name is \(notification.name), object is \(notification.object)")
        }
    }
    
    deinit {
        // 需要手动释放keyPath observe
        unObserve(object: person)
        // 可选释放
        unObserveEvent()
    }
}

extension String {
    public var trim: String {
        return stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
    
    public var isPureInt: Bool {
        let scanner = NSScanner(string: self)
        var value: Int32 = 0 //从下标0开始，扫描到的数字，碰到非数字就停止。比如 string = "12ss",则value = 12
        return scanner.scanInt(&value) && scanner.atEnd
    }
}
