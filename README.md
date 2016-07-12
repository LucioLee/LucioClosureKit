# LucioClosureKit

LucioClosureKit is a simple closure-Handle Util (The Swift Version of APBlockKit)

LucioClosureKit 是一个简单的闭包化类扩展集合
[Thanks:https://github.com/ChenYim/APBlockKit]

## NSObject+Extension.swift
### demo code：
```
class Person: NSObject {
   dynamic var name:String = "1"
   dynamic var age: Int = 0
}
// KVO
self.observe(object: person, keyPath: "name", options:[.New,.Old]) { (object, keyPath, changes) in
    print("object is \(object), keyPath is \(keyPath) change is \(changes)")
}
self.observe(object: person, keyPath: "age", options:[.New,.Old]) { (object, keyPath, changes) in
    print("object is \(object), keyPath is \(keyPath) change is \(changes)")
}

// Notification Observe
self.observe { (notification) in
    print("监听所有通知：name is \(notification.name)")
}
self.observe(event: "NotificationName") { (notification) in
    print("根据通知名监听通知：name is \(notification.name)")
}
self.observe(event: "NotificationName", object: observedObject) { (notification) in
    print("监听指定对象的指定通知：name is \(notification.name), object is \(notification.object)")
}
```
## UIActionSheet+Extension.swift
### demo code：
```
let actionSheet = UIActionSheet(title: "ActionSheetTitle", cancelButtonTitle: "Cancel", destructiveButtonTitle: "destructiveButtonTitle", otherButtonTitles: ["buttonTitleName1","buttonTitleName2","buttonTitleName3"]){(actionSheet,buttonIndex) in
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
actionSheet.showInView(view)
```
## UIAlertView+Extension.swift
### demo code：
```
let alertview =  UIAlertView(title: "UIAlertViewTitle", message: "UIAlertViewMessage", cancelButtonTitle: "Cancel", otherButtonTitles: ["Sure"]){(alertview,buttonIndex) in
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
// show alert with duration
alertview.show(duration: duration)
```
## UITextField+Extension.swift
### demo code：
```
let textField = UITextField()
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

```
## UITextField+Extension.swift
### demo code：
```
let textView = UITextView()
view.addSubview(textView)

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
```