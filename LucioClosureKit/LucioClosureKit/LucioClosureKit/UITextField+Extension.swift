//
//  UITextField+Extension.swift
//  LucioClosureKit
//
//  Created by 李新新 on 16/7/11.
//
//

import UIKit

public extension UITextField {

    public func shouldBeginEditing(handler: ((textField: UITextField) -> Bool)) {
        delegateAdapter.shouldBeginEditing = handler
    }
    public func shouldEndEditing(handler: ((textField: UITextField) -> Bool)) {
        delegateAdapter.shouldEndEditing = handler
    }
    public func didBeginEditing(handler: ((textField: UITextField) -> Void)) {
        delegateAdapter.didBeginEditing = handler
    }
    public func didEndEditing(handler: ((textField: UITextField) -> Void)) {
        delegateAdapter.didEndEditing = handler
    }
    public func shouldChangeTextInRange(handler:((textView:UITextField, range: NSRange, text: String) -> Bool)) {
        delegateAdapter.shouldChangeTextInRange = handler
    }
    public func shouldClear(handler: ((textField: UITextField) -> Bool)) {
        delegateAdapter.shouldClear = handler
    }
    public func shouldReturn(handler: ((textField: UITextField) -> Bool)) {
        delegateAdapter.shouldReturn = handler
    }
    private var delegateAdapter: TextFieldDelegateAdapter {
        struct Adapter {
            static var KTextFieldDelegateAdapter = "KTextFieldDelegateAdapter"
        }
        var delegateAdapter = objc_getAssociatedObject(self, &Adapter.KTextFieldDelegateAdapter) as? TextFieldDelegateAdapter
        if delegateAdapter == nil {
            delegateAdapter = TextFieldDelegateAdapter()
            self.delegate = delegateAdapter
            objc_setAssociatedObject(self, &Adapter.KTextFieldDelegateAdapter, delegateAdapter, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        return delegateAdapter!
    }
}

private class TextFieldDelegateAdapter: NSObject, UITextFieldDelegate {
    
    var shouldBeginEditing: (UITextField -> Bool)?
    var shouldEndEditing: (UITextField -> Bool)?
    var shouldReturn: (UITextField -> Bool)?
    var shouldClear: (UITextField -> Bool)?
    var didBeginEditing: (UITextField -> Void)?
    var didEndEditing: (UITextField -> Void)?
    var shouldChangeTextInRange: ((UITextField,NSRange,String) -> Bool)?
    
    @objc func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return shouldBeginEditing?(textField) ?? true
    }
    @objc func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        return shouldEndEditing?(textField) ?? true
    }
    @objc func textFieldDidBeginEditing(textField: UITextField) {
        didBeginEditing?(textField)
    }
    @objc func textFieldDidEndEditing(textField: UITextField) {
        didEndEditing?(textField)
    }
    @objc func textFieldShouldClear(textField: UITextField) -> Bool {
       return shouldClear?(textField) ?? false
    }
    @objc func textFieldShouldReturn(textField: UITextField) -> Bool {
        return shouldReturn?(textField) ?? true
    }
    @objc func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        return shouldChangeTextInRange?(textField,range,string) ?? true
    }
}