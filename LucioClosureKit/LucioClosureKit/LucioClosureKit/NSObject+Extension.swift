//
//  NSObject+Extension.swift
//  LucioClosureKit
//
//  Created by 李新新 on 16/7/11.
//
//

import Foundation

// 是否打印释放时的信息
let showDeinitDescription = true

public extension NSObject {
    /// 发送一条通知
    public func postEvent(event eventName: String, userInfo:[NSObject : AnyObject]? = nil) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: eventName), object: self, userInfo: userInfo)
    }
    /// 监听通知事件
    /// - Note: eventName 为要监听的通知名称；如果eventName为nil,则监听所有通知事件
    /// - Note: object为要监听的对象；如果object为nil,则监听所有对象
    public func observe(event eventName: String? = nil, object: AnyObject? = nil, handler: ((_ notification: Notification) -> Void)) {
        let eventObserver = EventObserver(eventName: eventName, observeredObject: object, handler: handler)
        eventObserver.observer()
        observerManager.eventObservers.append(eventObserver)
    }
    /// 取消监听通知事件
    /// - Note: 监听会在observer deinit时自动取消，不需要显示调用,调用也没关系
    public func unObserveEvent(event eventName: String? = nil, object: AnyObject? = nil) {
        
        if eventName == nil && object == nil {
            observerManager.eventObservers.removeAll()
        } else if eventName != nil && object == nil {
            stride(from: 0, to: observerManager.eventObservers.count, by: 1).filter({ (index) -> Bool in
                let observer = observerManager.eventObservers[index]
                return (observer.eventName != nil && observer.eventName! == eventName!) ? true : false
            }).reversed().forEach{ observerManager.eventObservers.remove(at: $0) }
        } else if eventName == nil && object != nil {
            
            stride(from: 0, to: observerManager.eventObservers.count, by: 1).filter({ (index) -> Bool in
                let observer = observerManager.eventObservers[index]
                return (observer.observeredObject != nil && observer.observeredObject!.isEqual(object!)) ? true : false
            }).reversed().forEach { observerManager.eventObservers.remove(at: $0) }
        } else {
            stride(from: 0, to: observerManager.eventObservers.count, by: 1).filter { (index) in
                let observer = observerManager.eventObservers[index]
                return (observer.eventName != nil && observer.eventName! == eventName! && observer.observeredObject != nil && observer.observeredObject!.isEqual(object!)) ? true : false
                }.reversed().forEach { observerManager.eventObservers.remove(at: $0) }
        }
    }
    
    fileprivate var observerManager: AssociatedObserverManager {
        struct Adapter {
            static var KAssociatedObserverManager = "KAssociatedObserverManager"
        }
        var delegateAdapter = objc_getAssociatedObject(self, &Adapter.KAssociatedObserverManager) as? AssociatedObserverManager
        if delegateAdapter == nil {
            delegateAdapter = AssociatedObserverManager()
            objc_setAssociatedObject(self, &Adapter.KAssociatedObserverManager, delegateAdapter, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        return delegateAdapter!
    }
}
public extension NSObject {
    public func observe(object anObject: NSObject,keyPath: String,options: NSKeyValueObservingOptions,handler:((_ object: NSObject?,_ keyPath:String?,_ changes:[NSKeyValueChangeKey : Any]?) -> Void)) {
        let kvobserver = KVObserver(keyPath: keyPath, object: anObject, options: options,handler: handler)
        kvobserver.observer()
        observerManager.KVObservers.append(kvobserver)
    }
    public func unObserveAllKeyPaths() {
        observerManager.KVObservers.removeAll()
    }
    public func unObserve(object anObject: NSObject) {
        stride(from: 0, to: observerManager.KVObservers.count, by: 1).filter { (index) in
            let kvobserver = observerManager.KVObservers[index]
            return (kvobserver.object!.isEqual(anObject)) ? true : false
            }.reversed().forEach{ observerManager.KVObservers.remove(at: $0)}
    }
    public func unObserve(object anObject: NSObject,keyPath: String) {
        stride(from: 0, to: observerManager.KVObservers.count, by: 1).filter { (index) in
            let kvobserver = observerManager.KVObservers[index]
            return (kvobserver.keyPath == keyPath && kvobserver.object!.isEqual(anObject)) ? true : false
            }.reversed().forEach{ observerManager.KVObservers.remove(at: $0)}
    }
}

private class AssociatedObserverManager {
    lazy var eventObservers = [EventObserver]()
    lazy var KVObservers = [KVObserver]()
}
private class EventObserver {
    var eventName: String?
    weak var observeredObject: AnyObject?
    var handler: ((Notification) -> Void)
    
    init(eventName: String? = nil, observeredObject: AnyObject? = nil, handler: ((_ notification: Notification) -> Void)) {
        self.eventName = eventName
        self.observeredObject = observeredObject
        self.handler = handler
    }
    func observer() {
        NotificationCenter.default.addObserver(self, selector: #selector(EventObserver.handleNotificationEvent(_:)), name: eventName.map { NSNotification.Name(rawValue: $0) }, object: observeredObject)
    }
    func unObserver() {
        NotificationCenter.default.removeObserver(self)
    }
    @objc func handleNotificationEvent(_ notification: Notification) {
        handler(notification)
    }
    deinit {
        if showDeinitDescription {
            print("\(self) deinit, eventName is \(eventName), observeredObj is \(observeredObject)")
        }
        unObserver()
    }
}
private class KVObserver: NSObject {
    var keyPath: String
    weak var object: NSObject!
    var options: NSKeyValueObservingOptions
    var handler:((NSObject?,String?,[NSKeyValueChangeKey : Any]?) -> Void)
    
    init(keyPath: String, object: NSObject, options:NSKeyValueObservingOptions,handler: ((_ object: NSObject?,_ keyPath:String?,_ changes:[NSKeyValueChangeKey : Any]?) -> Void)) {
        self.keyPath = keyPath
        self.object = object
        self.options = options
        self.handler = handler
    }
    func observer() {
        object!.addObserver(self, forKeyPath: keyPath, options: options, context: nil)
    }
    func unObserver() {
        object!.removeObserver(self, forKeyPath: keyPath, context: nil)
    }
    deinit {
        if showDeinitDescription {
            print("\(self) deinit, observeredObj is \(object), keyPath is \(keyPath)")
        }
        unObserver()
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        handler(object as? NSObject,keyPath,change)
    }
}

