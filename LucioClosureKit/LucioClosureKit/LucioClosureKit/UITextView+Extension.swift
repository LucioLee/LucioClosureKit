//
//  UITextView+Extension.swift
//  LucioClosureKit
//
//  Created by 李新新 on 16/7/7.
//
//

import UIKit

public extension UITextView {
    public func shouldReturn(handler: ((textView: UITextView) -> Bool)) {
        delegateAdapter.shouldReturn = handler
    }
    public func shouldBeginEditing(handler: ((textView: UITextView) -> Bool)) {
        delegateAdapter.shouldBeginEditing = handler
    }
    public func shouldEndEditing(handler: ((textView: UITextView) -> Bool)) {
        delegateAdapter.shouldEndEditing = handler
    }
    public func didBeginEditing(handler: ((textView: UITextView) -> Void)) {
        delegateAdapter.didBeginEditing = handler
    }
    public func didEndEditing(handler: ((textView: UITextView) -> Void)) {
        delegateAdapter.didEndEditing = handler
    }
    public func didChange(handler: ((textView: UITextView) -> Void)) {
        delegateAdapter.didChange = handler
    }
    public func didChangeSelection(handler: ((textView: UITextView) -> Void)) {
        delegateAdapter.didChangeSelection = handler
    }
    public func shouldChangeTextInRange(handler:((textView:UITextView, range: NSRange, text: String) -> Bool)) {
        delegateAdapter.shouldChangeTextInRange = handler
    }
    @available(iOS 7.0, *)
    public func shouldInteractWithURL(handler:((textView:UITextView, url: NSURL, range: NSRange) -> Bool)) {
        delegateAdapter.shouldInteractWithURL = handler
    }
    @available(iOS 7.0, *)
    public func shouldInteractWithTextAttachment(handler:((textView:UITextView, textAttachment: NSTextAttachment, range: NSRange) -> Bool)) {
        delegateAdapter.shouldInteractWithTextAttachment = handler
    }
    private var delegateAdapter: TextViewDelegateAdapter {
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
    
    var shouldBeginEditing: (UITextView -> Bool)?
    var shouldEndEditing: (UITextView -> Bool)?
    var shouldReturn: (UITextView -> Bool)?
    var didBeginEditing: (UITextView -> Void)?
    var didEndEditing: (UITextView -> Void)?
    var didChange: (UITextView -> Void)?
    var didChangeSelection: (UITextView -> Void)?
    var shouldChangeTextInRange: ((UITextView,NSRange,String) -> Bool)?
    var shouldInteractWithURL: ((UITextView,NSURL,NSRange) -> Bool)?
    var shouldInteractWithTextAttachment: ((UITextView,NSTextAttachment,NSRange) -> Bool)?
    
    @objc func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        return shouldBeginEditing?(textView) ?? true
    }
    @objc func textViewShouldEndEditing(textView: UITextView) -> Bool {
        return shouldEndEditing?(textView) ?? true
    }
    @objc func textViewDidBeginEditing(textView: UITextView) {
        didBeginEditing?(textView)
    }
    @objc func textViewDidEndEditing(textView: UITextView) {
        didEndEditing?(textView)
    }
    @objc func textViewDidChange(textView: UITextView) {
        didChange?(textView)
    }
    @objc func textViewDidChangeSelection(textView: UITextView) {
        didChangeSelection?(textView)
    }
    @objc func textView(textView: UITextView, shouldInteractWithURL URL: NSURL, inRange characterRange: NSRange) -> Bool {
        return shouldInteractWithURL?(textView,URL,characterRange) ?? true
    }
    @objc func textView(textView: UITextView, shouldInteractWithTextAttachment textAttachment: NSTextAttachment, inRange characterRange: NSRange) -> Bool {
        return shouldInteractWithTextAttachment?(textView,textAttachment,characterRange) ?? true
    }
    @objc func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n",let shouldReturnResult = shouldReturn?(textView) where shouldReturnResult == false {
            return false
        }
        return shouldChangeTextInRange?(textView,range,text) ?? true
    }
}