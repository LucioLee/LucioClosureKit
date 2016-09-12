//
//  UIActionSheet+Extension.swift
//  LucioClosureKit
//
//  Created by 李新新 on 16/7/11.
//
//

import UIKit

@available(iOS, introduced: 2.0, deprecated: 8.3, message: "UIActionSheet is deprecated. Use UIAlertController with a preferredStyle of UIAlertControllerStyleActionSheet instead")
public extension UIActionSheet {
    
    public convenience init(title: String?, cancelButtonTitle: String?, destructiveButtonTitle: String?, otherButtonTitles:[String] = [], handler:((_ actionSheet: UIActionSheet,_ buttonIndex: Int) -> Void)? = nil) {
        self.init(title: title, delegate:nil, cancelButtonTitle: cancelButtonTitle, destructiveButtonTitle: destructiveButtonTitle)
        otherButtonTitles.forEach { addButton(withTitle: $0)}
        if handler != nil {
            clickedButton(handler!)
        }
    }
    public func clickedButton(_ handler:((_ actionSheet: UIActionSheet,_ buttonIndex: Int) -> Void)) {
        delegateAdapter.clickedButton = handler
    }
    public func cancel(_ handler:((_ actionSheet: UIActionSheet) -> Void)) {
        delegateAdapter.cancel = handler
    }
    public func willPresent(_ handler:((_ actionSheet: UIActionSheet) -> Void)) {
        delegateAdapter.willPresent = handler
    }
    public func didPresent(_ handler:((_ actionSheet: UIActionSheet) -> Void)) {
        delegateAdapter.didPresent = handler
    }
    public func willDismiss(_ handler:((_ actionSheet: UIActionSheet,_ buttonIndex: Int) -> Void)) {
        delegateAdapter.willDismiss = handler
    }
    public func didDissmiss(_ handler:((_ actionSheet: UIActionSheet,_ buttonIndex: Int) -> Void)) {
        delegateAdapter.didDismiss = handler
    }
    fileprivate var delegateAdapter: ActionSheetDelegateAdapter {
        struct Adapter {
            static var KTextViewDelegateAdapter = "KTextViewDelegateAdapter"
        }
        var delegateAdapter = objc_getAssociatedObject(self, &Adapter.KTextViewDelegateAdapter) as? ActionSheetDelegateAdapter
        if delegateAdapter == nil {
            delegateAdapter = ActionSheetDelegateAdapter()
            self.delegate = delegateAdapter
            objc_setAssociatedObject(self, &Adapter.KTextViewDelegateAdapter, delegateAdapter, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        return delegateAdapter!
    }
}
@available(iOS, introduced: 2.0, deprecated: 8.3)
private class ActionSheetDelegateAdapter: NSObject, UIActionSheetDelegate {
    
    var clickedButton: ((UIActionSheet,Int) -> Void)?
    var cancel: ((UIActionSheet) -> Void)?
    var willPresent: ((UIActionSheet) -> Void)?
    var didPresent: ((UIActionSheet) -> Void)?
    var willDismiss:((UIActionSheet,Int) -> Void)?
    var didDismiss:((UIActionSheet,Int) -> Void)?
    
    @objc func actionSheet(_ actionSheet: UIActionSheet, clickedButtonAt buttonIndex: Int) {
        clickedButton?(actionSheet,buttonIndex)
    }
    @objc func actionSheetCancel(_ actionSheet: UIActionSheet) {
        cancel?(actionSheet)
    }
    @objc func willPresent(_ actionSheet: UIActionSheet) {
        willPresent?(actionSheet)
    }
    @objc func didPresent(_ actionSheet: UIActionSheet) {
        didPresent?(actionSheet)
    }
    @objc func actionSheet(_ actionSheet: UIActionSheet, willDismissWithButtonIndex buttonIndex: Int) {
        willDismiss?(actionSheet,buttonIndex)
    }
    @objc func actionSheet(_ actionSheet: UIActionSheet, didDismissWithButtonIndex buttonIndex: Int) {
        didDismiss?(actionSheet,buttonIndex)
    }
}
