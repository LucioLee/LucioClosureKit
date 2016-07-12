# LucioClosureKit

LucioClosureKit is a simple closure-Handle Util (Swift Version of The APBlockKit)
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
self.observe { (notification) in
print("监听所有通知：name is \(notification.name)")
}
self.observe(event: "commitButtonClickedNotification") { (notification) in
print("根据通知名监听通知：name is \(notification.name)")
}
self.observe(event: "commitButtonClickedNotification", object: commitbtn) { (notification) in
print("监听指定对象的指定通知：name is \(notification.name), object is \(notification.object)")
}
```

###效果：
![Animating](readme_images/animating.gif)

###来源：
OC原版是 [RQShineLabel](https://github.com/zipme/RQShineLabel)