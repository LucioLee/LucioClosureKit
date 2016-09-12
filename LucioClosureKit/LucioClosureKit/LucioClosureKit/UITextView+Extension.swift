//
//  UITextView+Extension.swift
//  LucioClosureKit
//
//  Created by 李新新 on 16/7/7.
//
//

import UIKit

public extension UITextView {
    public func shouldReturn(_ handler: ((_ textView: UITextView) -> Bool)) {
        delegateAdapter.shouldReturn = handler
    }
    public func shouldBeginEditing(_ handler: ((_ textView: UITextView) -> Bool)) {
        delegateAdapter.shouldBeginEditing = handler
    }
    public func shouldEndEditing(_ handler: ((_ textView: UITextView) -> Bool)) {
        delegateAdapter.shouldEndEditing = handler
    }
    public func didBeginEditing(_ handler: ((_ textView: UITextView) -> Void)) {
        delegateAdapter.didBeginEditing = handler
    }
    public func didEndEditing(_ handler: ((_ textView: UITextView) -> Void)) {
        delegateAdapter.didEndEditing = handler
    }
    public func didChange(_ handler: ((_ textView: UITextView) -> Void)) {
        delegateAdapter.didChange = handler
    }
    public func didChangeSelection(_ handler: ((_ textView: UITextView) -> Void)) {
        delegateAdapter.didChangeSelection = handler
    }
    public func shouldChangeTextInRange(_ handler:((_ textView:UITextView, _ range: NSRange, _ text: String) -> Bool)) {
        delegateAdapter.shouldChangeTextInRange = handler
    }
    @available(iOS 7.0, *)
    public func shouldInteractWithURL(_ handler:((_ textView:UITextView, _ url: URL, _ range: NSRange) -> Bool)) {
        delegateAdapter.shouldInteractWithURL = handler
    }
    @available(iOS 7.0, *)
    public func shouldInteractWithTextAttachment(_ handler:((_ textView:UITextView, _ textAttachment: NSTextAttachment, _ range: NSRange) -> Bool)) {
        delegateAdapter.shouldInteractWithTextAttachment = handler
    }
    fileprivate var delegateAdapter: TextViewDelegateAdapter {
        struct Adapter {
            static var KTextViewDelegateAdapter = "KTextViewDelegateAdapter"
        }
        var delegateAdapter = objc_getAssociatedObject(self, &Adapter.KTextViewDelegateAdapter) as? TextViewDelegateAdapter
        if delegateAdapter == nil {
            delegateAdapter = TextViewDelegateAdapter()
            self.delegate = delegateAdapter
            objc_setAssociatedObject(self, &Adapter.KTextViewDelegateAdapter, delegateAdapter, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        return delegateAdapter!
    }
}

private class TextViewDelegateAdapter: NSObject, UITextViewDelegate {
    
    var shouldBeginEditing: ((UITextView) -> Bool)?
    var shouldEndEditing: ((UITextView) -> Bool)?
    var shouldReturn: ((UITextView) -> Bool)?
    var didBeginEditing: ((UITextView) -> Void)?
    var didEndEditing: ((UITextView) -> Void)?
    var didChange: ((UITextView) -> Void)?
    var didChangeSelection: ((UITextView) -> Void)?
    var shouldChangeTextInRange: ((UITextView,NSRange,String) -> Bool)?
    var shouldInteractWithURL: ((UITextView,URL,NSRange) -> Bool)?
    var shouldInteractWithTextAttachment: ((UITextView,NSTextAttachment,NSRange) -> Bool)?
    
    @objc func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return shouldBeginEditing?(textView) ?? true
    }
    @objc func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        return shouldEndEditing?(textView) ?? true
    }
    @objc func textViewDidBeginEditing(_ textView: UITextView) {
        didBeginEditing?(textView)
    }
    @objc func textViewDidEndEditing(_ textView: UITextView) {
        didEndEditing?(textView)
    }
    @objc func textViewDidChange(_ textView: UITextView) {
        didChange?(textView)
    }
    @objc func textViewDidChangeSelection(_ textView: UITextView) {
        didChangeSelection?(textView)
    }
    @objc func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        return shouldInteractWithURL?(textView,URL,characterRange) ?? true
    }
    @objc func textView(_ textView: UITextView, shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange) -> Bool {
        return shouldInteractWithTextAttachment?(textView,textAttachment,characterRange) ?? true
    }
    @objc func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n",let shouldReturnResult = shouldReturn?(textView) , shouldReturnResult == false {
            return false
        }
        return shouldChangeTextInRange?(textView,range,text) ?? true
    }
}
