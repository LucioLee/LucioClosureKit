//
//  UIAlertView+Extension.swift
//  LucioClosureKit
//
//  Created by 李新新 on 16/7/11.
//
//

import UIKit

@available(iOS, introduced: 2.0, deprecated: 9.0, message: "UIAlertView is deprecated. Use UIAlertController with a preferredStyle of UIAlertControllerStyleAlert instead")
public extension UIAlertView {
    
    public convenience init(title: String, message: String, cancelButtonTitle: String?, otherButtonTitles:[String] = [], handler:((_ alertView: UIAlertView,_ buttonIndex: Int) -> Void)? = nil) {
        self.init(title: title, message: message, delegate: nil, cancelButtonTitle: cancelButtonTitle)
        otherButtonTitles.forEach{addButton(withTitle: $0)}
        if handler != nil {
            clickedButton(handler!)
        }
    }
    public func clickedButton(_ handler:((_ alertView: UIAlertView,_ buttonIndex: Int) -> Void)) {
        delegateAdapter.clickedButton = handler
    }
    public func cancel(_ handler:((_ alertView: UIAlertView) -> Void)) {
        delegateAdapter.cancel = handler
    }
    public func willPresent(_ handler:((_ alertView: UIAlertView) -> Void)) {
        delegateAdapter.willPresent = handler
    }
    public func didPresent(_ handler:((_ alertView: UIAlertView) -> Void)) {
        delegateAdapter.didPresent = handler
    }
    public func willDismiss(_ handler:((_ alertView: UIAlertView,_ buttonIndex: Int) -> Void)) {
        delegateAdapter.willDismiss = handler
    }
    public func didDissmiss(_ handler:((_ alertView: UIAlertView,_ buttonIndex: Int) -> Void)) {
        delegateAdapter.didDismiss = handler
    }
    public func shouldEnableFirstOtherButton(_ handler:((_ alertView: UIAlertView) -> Bool)) {
        delegateAdapter.shouldEnableFirstOtherButton = handler
    }
    // 定时消失
    public func show(duration: TimeInterval) {
        show()
        let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, CFAbsoluteTimeGetCurrent() + duration, 0, 0, 0) {[unowned self] _ in
            self.dismiss(withClickedButtonIndex: self.cancelButtonIndex, animated: true)
        }
        RunLoop.current.add(timer!, forMode: RunLoopMode.commonModes)
    }
    fileprivate var delegateAdapter: AlertViewDelegateAdapter {
        struct Adapter {
            static var KAlertViewDelegateAdapter = "KAlertViewDelegateAdapter"
        }
        var delegateAdapter = objc_getAssociatedObject(self, &Adapter.KAlertViewDelegateAdapter) as? AlertViewDelegateAdapter
        if delegateAdapter == nil {
            delegateAdapter = AlertViewDelegateAdapter()
            self.delegate = delegateAdapter
            objc_setAssociatedObject(self, &Adapter.KAlertViewDelegateAdapter, delegateAdapter, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        return delegateAdapter!
    }
}
@available(iOS, introduced: 2.0, deprecated: 9.0)
private class AlertViewDelegateAdapter: NSObject,UIAlertViewDelegate {
    
    var clickedButton: ((UIAlertView,Int) -> Void)?
    var cancel: ((UIAlertView) -> Void)?
    var willPresent: ((UIAlertView) -> Void)?
    var didPresent: ((UIAlertView) -> Void)?
    var willDismiss:((UIAlertView,Int) -> Void)?
    var didDismiss:((UIAlertView,Int) -> Void)?
    var shouldEnableFirstOtherButton: ((UIAlertView) -> Bool)?

    @objc func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        clickedButton?(alertView,buttonIndex)
    }
    @objc func alertViewCancel(_ alertView: UIAlertView) {
        cancel?(alertView)
    }
    @objc func willPresent(_ alertView: UIAlertView) {
        willPresent?(alertView)
    }
    @objc func didPresent(_ alertView: UIAlertView) {
        didPresent?(alertView)
    }
    @objc func alertView(_ alertView: UIAlertView, willDismissWithButtonIndex buttonIndex: Int) {
        willDismiss?(alertView,buttonIndex)
    }
    @objc func alertView(_ alertView: UIAlertView, didDismissWithButtonIndex buttonIndex: Int) {
        didDismiss?(alertView,buttonIndex)
    }
    @objc func alertViewShouldEnableFirstOtherButton(_ alertView: UIAlertView) -> Bool {
        return shouldEnableFirstOtherButton?(alertView) ?? true
    }
}
