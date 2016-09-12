//
//  UITextField+Extension.swift
//  LucioClosureKit
//
//  Created by 李新新 on 16/7/11.
//
//

import UIKit

public extension UITextField {

    public func shouldBeginEditing(_ handler: ((_ textField: UITextField) -> Bool)) {
        delegateAdapter.shouldBeginEditing = handler
    }
    public func shouldEndEditing(_ handler: ((_ textField: UITextField) -> Bool)) {
        delegateAdapter.shouldEndEditing = handler
    }
    public func didBeginEditing(_ handler: ((_ textField: UITextField) -> Void)) {
        delegateAdapter.didBeginEditing = handler
    }
    public func didEndEditing(_ handler: ((_ textField: UITextField) -> Void)) {
        delegateAdapter.didEndEditing = handler
    }
    public func shouldChangeTextInRange(_ handler:((_ textView:UITextField, _ range: NSRange, _ text: String) -> Bool)) {
        delegateAdapter.shouldChangeTextInRange = handler
    }
    public func shouldClear(_ handler: ((_ textField: UITextField) -> Bool)) {
        delegateAdapter.shouldClear = handler
    }
    public func shouldReturn(_ handler: ((_ textField: UITextField) -> Bool)) {
        delegateAdapter.shouldReturn = handler
    }
    fileprivate var delegateAdapter: TextFieldDelegateAdapter {
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
    
    var shouldBeginEditing: ((UITextField) -> Bool)?
    var shouldEndEditing: ((UITextField) -> Bool)?
    var shouldReturn: ((UITextField) -> Bool)?
    var shouldClear: ((UITextField) -> Bool)?
    var didBeginEditing: ((UITextField) -> Void)?
    var didEndEditing: ((UITextField) -> Void)?
    var shouldChangeTextInRange: ((UITextField,NSRange,String) -> Bool)?
    
    @objc func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return shouldBeginEditing?(textField) ?? true
    }
    @objc func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return shouldEndEditing?(textField) ?? true
    }
    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
        didBeginEditing?(textField)
    }
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        didEndEditing?(textField)
    }
    @objc func textFieldShouldClear(_ textField: UITextField) -> Bool {
       return shouldClear?(textField) ?? false
    }
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return shouldReturn?(textField) ?? true
    }
    @objc func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return shouldChangeTextInRange?(textField,range,string) ?? true
    }
}
