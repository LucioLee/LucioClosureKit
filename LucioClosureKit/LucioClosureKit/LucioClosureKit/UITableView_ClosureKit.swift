//
//  UITableView+Extension.swift
//  LucioClosureKit
//
//  Created by 李新新 on 16/7/12.
//
//

import UIKit

// 因为UITableView的特殊性，不推荐直接使用扩展来实现Delegate和DataSource的Block化
// 这是一个实现方案的模板，按实际所需，选择需要的属性和方法
public class TableViewDeleageAdapter: NSObject,UITableViewDelegate {
    
    private var didEndDisplayingCell: ((UITableView,UITableViewCell,NSIndexPath) -> Void)?
    private var didEndDisplayingHeaderView: ((UITableView,UIView,Int) -> Void)?
    private var didEndDisplayingFooterView: ((UITableView,UIView,Int) -> Void)?

    private var heightForRowAtIndexPath: ((UITableView,NSIndexPath) -> CGFloat)?
    private var heightForHeaderInSection: ((UITableView,Int) -> CGFloat)?
    private var heightForFooterInSection: ((UITableView,Int) -> CGFloat)?

    private var estimatedHeightForRowAtIndexPath: ((UITableView,NSIndexPath) -> CGFloat)?
    private var estimatedHeightForHeaderInSection: ((UITableView,Int) -> CGFloat)?
    private var estimatedHeightForFooterInSection: ((UITableView,Int) -> CGFloat)?

    private var viewForHeaderInSection: ((UITableView,Int) -> UIView?)?
    private var viewForFooterInSection: ((UITableView,Int) -> UIView?)?

    private var accessoryButtonTappedForRowWithIndexPath: ((UITableView,NSIndexPath) -> Void)?

    private var shouldHighlightRowAtIndexPath: ((UITableView,NSIndexPath) -> Bool)?
    private var didHighlightRowAtIndexPath: ((UITableView,NSIndexPath) -> Void)?
    private var didUnhighlightRowAtIndexPath: ((UITableView,NSIndexPath) -> Void)?

    private var willSelectRowAtIndexPath: ((UITableView,NSIndexPath) -> NSIndexPath?)?
    private var willDeselectRowAtIndexPath: ((UITableView,NSIndexPath) -> NSIndexPath?)?
    private var didSelectRowAtIndexPath: ((UITableView,NSIndexPath) -> Void)?
    private var didDeselectRowAtIndexPath: ((UITableView,NSIndexPath) -> Void)?
    
    private var willDisplayCell: ((UITableView,UITableViewCell,NSIndexPath) -> Void)?
    @available(iOS 2.0, *)
    func willDisplayCell(handler:((tableView: UITableView, cell: UITableViewCell, indexPath: NSIndexPath)) -> Void) {
        willDisplayCell = handler
    }
    private var willDisplayHeaderView: ((UITableView,UIView,Int) -> Void)?
    @available(iOS 6.0, *)
    func willDisplayHeaderView(handler:((tableView: UITableView, view: UIView, section: Int)) -> Void) {
        willDisplayHeaderView = handler
    }
    private var willDisplayFooterView: ((UITableView,UIView,Int) -> Void)?
    @available(iOS 6.0, *)
    func willDisplayFooterView(handler:((tableView: UITableView, view: UIView, section: Int)) -> Void) {
        willDisplayFooterView = handler
    }
    @available(iOS 6.0, *)
    func didEndDisplayingCell(handler:((tableView: UITableView, cell: UITableViewCell, indexPath: NSIndexPath)) -> Void) {
        didEndDisplayingCell = handler
    }
    @available(iOS 6.0, *)
    func didEndDisplayingHeaderView(handler:((tableView: UITableView, view: UIView, section: Int)) -> Void) {
        didEndDisplayingHeaderView = handler
    }
    @available(iOS 6.0, *)
    func didEndDisplayingFooterView(handler:((tableView: UITableView, view: UIView, section: Int)) -> Void) {
        didEndDisplayingFooterView = handler
    }

    // public variable height support
    @available(iOS 2.0, *)
    func heightForRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath)) -> CGFloat) {
        heightForRowAtIndexPath = handler
    }
    @available(iOS 2.0, *)
    func heightForHeaderInSection(handler:((tableView: UITableView, section: Int)) -> CGFloat) {
        heightForHeaderInSection = handler
    }
    @available(iOS 2.0, *)
    func heightForFooterInSection(handler:((tableView: UITableView, section: Int)) -> CGFloat) {
        heightForFooterInSection = handler
    }
    // Use the estimatedHeight methods to quickly calcuate guessed values which will allow for fast load times of the table.
    // If these methods are implemented, the above -tableView:heightForXXX calls will be deferred until views are ready to be displayed, so more expensive logic can be placed there.
    @available(iOS 7.0, *)
    func estimatedHeightForRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath)) -> CGFloat) {
        estimatedHeightForRowAtIndexPath = handler
    }
    @available(iOS 7.0, *)
    func estimatedHeightForHeaderInSection(handler:((tableView: UITableView, section: Int)) -> CGFloat) {
        estimatedHeightForHeaderInSection = handler
    }
    @available(iOS 7.0, *)
    func estimatedHeightForFooterInSection(handler:((tableView: UITableView, section: Int)) -> CGFloat) {
        estimatedHeightForFooterInSection = handler
    }

    // Section header & footer information. Views are preferred over title should you decide to provide both

    // custom view for header. will be adjusted to default or specified header height
    @available(iOS 2.0, *)
    func viewForHeaderInSection(handler:((tableView: UITableView, section: Int)) -> UIView?) {
        viewForHeaderInSection = handler
    }
    // custom view for header. will be adjusted to default or specified header height
    @available(iOS 2.0, *)
    func viewForFooterInSection(handler:((tableView: UITableView, section: Int)) -> UIView?) {
        viewForFooterInSection = handler
    }

    @available(iOS 2.0, *)
    func accessoryButtonTappedForRowWithIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath)) -> Void) {
        accessoryButtonTappedForRowWithIndexPath = handler
    }

    // func shouldHighlightRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath)) -> Bool) is called when a touch comes down on a row.
    // Returning NO to that message halts the selection process and does not cause the currently selected row to lose its selected look while the touch is down.
    @available(iOS 2.0, *)
    func shouldHighlightRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath)) -> Bool) {
        shouldHighlightRowAtIndexPath = handler
    }
    @available(iOS 6.0, *)
    public func didHighlightRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath)) -> Void) {
        didHighlightRowAtIndexPath = handler
    }
    @available(iOS 6.0, *)
    public func didUnhighlightRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath)) -> Void) {
        didUnhighlightRowAtIndexPath = handler
    }

    // Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
    @available(iOS 2.0, *)
    public func willSelectRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath)) -> NSIndexPath?) {
        willSelectRowAtIndexPath = handler
    }
    @available(iOS 3.0, *)
    public func willDeselectRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath)) -> NSIndexPath?) {
        willDeselectRowAtIndexPath = handler
    }
    // Called after the user changes the selection.
    @available(iOS 2.0, *)
    public func didSelectRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath)) -> Void) {
        didSelectRowAtIndexPath = handler
    }
    @available(iOS 3.0, *)
    public func didDeselectRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath)) -> Void) {
        didDeselectRowAtIndexPath = handler
    }
    
    
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        willDisplayCell?(tableView, cell, indexPath)
    }
    @available(iOS 6.0, *)
    public func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        willDisplayHeaderView?(tableView, view, section)
    }
    @available(iOS 6.0, *)
    public func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        willDisplayFooterView?(tableView, view, section)
    }
    @available(iOS 6.0, *)
    public func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        didEndDisplayingCell?(tableView, cell, indexPath)
    }
    @available(iOS 6.0, *)
    public func tableView(tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        didEndDisplayingHeaderView?(tableView, view, section)
    }
    @available(iOS 6.0, *)
    public func tableView(tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        didEndDisplayingFooterView?(tableView, view, section)
    }

    // public variable height support
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return heightForRowAtIndexPath?(tableView, indexPath) ?? 44
    }
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return heightForHeaderInSection?(tableView, section) ?? 0
    }
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return heightForFooterInSection?(tableView, section) ?? 0
    }

    // Use the estimatedHeight methods to quickly calcuate guessed values which will allow for fast load times of the table.
    // If these methods are implemented, the above -tableView:heightForXXX calls will be deferred until views are ready to be displayed, so more expensive logic can be placed there.
    @available(iOS 7.0, *)
    public func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return estimatedHeightForRowAtIndexPath?(tableView, indexPath) ?? 44
    }
    @available(iOS 7.0, *)
    public func tableView(tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return estimatedHeightForHeaderInSection?(tableView, section) ?? 0
    }
    @available(iOS 7.0, *)
    public func tableView(tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return estimatedHeightForFooterInSection?(tableView, section) ?? 0
    }

    // Section header & footer information. Views are preferred over title should you decide to provide both

    @available(iOS 2.0, *)
    // custom view for header. will be adjusted to default or specified header height
    public func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return viewForHeaderInSection?(tableView, section)
    }
    @available(iOS 2.0, *)
    // custom view for footer. will be adjusted to default or specified footer height
    public func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return viewForFooterInSection?(tableView, section)
    }


    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        accessoryButtonTappedForRowWithIndexPath?(tableView, indexPath)
    }

    // Selection

    // -tableView:shouldHighlightRowAtIndexPath: is called when a touch comes down on a row.
    // Returning NO to that message halts the selection process and does not cause the currently selected row to lose its selected look while the touch is down.
    @available(iOS 6.0, *)
    public func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return shouldHighlightRowAtIndexPath?(tableView, indexPath) ?? true
    }
    @available(iOS 6.0, *)
    public func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        didHighlightRowAtIndexPath?(tableView, indexPath)
    }
    @available(iOS 6.0, *)
    public func tableView(tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: NSIndexPath) {
        didUnhighlightRowAtIndexPath?(tableView, indexPath)
    }

    // Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return willSelectRowAtIndexPath?(tableView, indexPath)
    }
    @available(iOS 3.0, *)
    public func tableView(tableView: UITableView, willDeselectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return willDeselectRowAtIndexPath?(tableView, indexPath)
    }
    // Called after the user changes the selection.
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        didSelectRowAtIndexPath?(tableView, indexPath)
    }
    @available(iOS 3.0, *)
    public func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        didDeselectRowAtIndexPath?(tableView, indexPath)
    }
    
}



//public extension UITableView {
//    private public var delegateAdapter: TableViewDelegateAdapter {
//        struct Adapter {
//            static public var KTableViewDelegateAdapter = "KTableViewDelegateAdapter"
//        }
//        public var delegateAdapter = objc_getAssociatedObject(self, &Adapter.KTableViewDelegateAdapter) as? TableViewDelegateAdapter
//        if delegateAdapter == nil {
//            delegateAdapter = TableViewDelegateAdapter()
//            self.delegate = delegateAdapter
//            objc_setAssociatedObject(self, &Adapter.KTableViewDelegateAdapter, delegateAdapter, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//        return delegateAdapter!
//    }
//    @available(iOS 2.0, *)
//    func willDisplayCell(handler:((tableView: UITableView, cell: UITableViewCell, indexPath: NSIndexPath)) -> Void) {
//        willDisplayCell = handler
//    }
//    @available(iOS 6.0, *)
//    func willDisplayHeaderView(handler:((tableView: UITableView, view: UIView, section: Int)) -> Void) {
//        willDisplayHeaderView = handler
//    }
//    @available(iOS 6.0, *)
//    func willDisplayFooterView(handler:((tableView: UITableView, view: UIView, section: Int)) -> Void) {
//        willDisplayFooterView = handler
//    }
//    @available(iOS 6.0, *)
//    func didEndDisplayingCell(handler:((tableView: UITableView, cell: UITableViewCell, indexPath: NSIndexPath)) -> Void) {
//        didEndDisplayingCell = handler
//    }
//    @available(iOS 6.0, *)
//    func didEndDisplayingHeaderView(handler:((tableView: UITableView, view: UIView, section: Int)) -> Void) {
//        didEndDisplayingHeaderView = handler
//    }
//    @available(iOS 6.0, *)
//    func didEndDisplayingFooterView(handler:((tableView: UITableView, view: UIView, section: Int)) -> Void) {
//        didEndDisplayingFooterView = handler
//    }
//    
//    // public variable height support
//    @available(iOS 2.0, *)
//    func heightForRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath)) -> CGFloat) {
//        heightForRowAtIndexPath = handler
//    }
//    @available(iOS 2.0, *)
//    func heightForHeaderInSection(handler:((tableView: UITableView, section: Int)) -> CGFloat) {
//        heightForHeaderInSection = handler
//    }
//    @available(iOS 2.0, *)
//    func heightForFooterInSection(handler:((tableView: UITableView, section: Int)) -> CGFloat) {
//        heightForFooterInSection = handler
//    }
//    // Use the estimatedHeight methods to quickly calcuate guessed values which will allow for fast load times of the table.
//    // If these methods are implemented, the above -tableView:heightForXXX calls will be deferred until views are ready to be displayed, so more expensive logic can be placed there.
//    @available(iOS 7.0, *)
//    func estimatedHeightForRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath)) -> CGFloat) {
//        estimatedHeightForRowAtIndexPath = handler
//    }
//    @available(iOS 7.0, *)
//    func estimatedHeightForHeaderInSection(handler:((tableView: UITableView, section: Int)) -> CGFloat) {
//        estimatedHeightForHeaderInSection = handler
//    }
//    @available(iOS 7.0, *)
//    func estimatedHeightForFooterInSection(handler:((tableView: UITableView, section: Int)) -> CGFloat) {
//        estimatedHeightForFooterInSection = handler
//    }
//    
//    // Section header & footer information. Views are preferred over title should you decide to provide both
//    
//    // custom view for header. will be adjusted to default or specified header height
//    @available(iOS 2.0, *)
//    func viewForHeaderInSection(handler:((tableView: UITableView, section: Int)) -> UIView?) {
//        viewForHeaderInSection = handler
//    }
//    // custom view for header. will be adjusted to default or specified header height
//    @available(iOS 2.0, *)
//    func viewForFooterInSection(handler:((tableView: UITableView, section: Int)) -> UIView?) {
//        viewForFooterInSection = handler
//    }
//    
//    @available(iOS 2.0, *)
//    func accessoryButtonTappedForRowWithIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath)) -> Void) {
//        accessoryButtonTappedForRowWithIndexPath = handler
//    }
//    
//    // func shouldHighlightRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath)) -> Bool) is called when a touch comes down on a row.
//    // Returning NO to that message halts the selection process and does not cause the currently selected row to lose its selected look while the touch is down.
//    @available(iOS 2.0, *)
//    func shouldHighlightRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath)) -> Bool) {
//        shouldHighlightRowAtIndexPath = handler
//    }
//    @available(iOS 6.0, *)
//    public func didHighlightRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath)) -> Void) {
//        didHighlightRowAtIndexPath = handler
//    }
//    @available(iOS 6.0, *)
//    public func didUnhighlightRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath)) -> Void) {
//        didUnhighlightRowAtIndexPath = handler
//    }
//    
//    // Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
//    @available(iOS 2.0, *)
//    public func willSelectRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath)) -> NSIndexPath?) {
//        willSelectRowAtIndexPath = handler
//    }
//    @available(iOS 3.0, *)
//    public func willDeselectRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath)) -> NSIndexPath?) {
//        willDeselectRowAtIndexPath = handler
//    }
//    // Called after the user changes the selection.
//    @available(iOS 2.0, *)
//    public func didSelectRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath)) -> Void) {
//        didSelectRowAtIndexPath = handler
//    }
//    @available(iOS 3.0, *)
//    public func didDeselectRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath)) -> Void) {
//        didDeselectRowAtIndexPath = handler
//    }
//}
//
//
//private class TableViewDelegateAdapter:NSObject,UITableViewDelegate {
//    
//    public var willDisplayCell: ((UITableView,UITableViewCell,NSIndexPath) -> Void)?
//    public var willDisplayHeaderView: ((UITableView,UIView,Int) -> Void)?
//    public var willDisplayFooterView: ((UITableView,UIView,Int) -> Void)?
//    public var didEndDisplayingCell: ((UITableView,UITableViewCell,NSIndexPath) -> Void)?
//    public var didEndDisplayingHeaderView: ((UITableView,UIView,Int) -> Void)?
//    public var didEndDisplayingFooterView: ((UITableView,UIView,Int) -> Void)?
//    
//    public var heightForRowAtIndexPath: ((UITableView,NSIndexPath) -> CGFloat)?
//    public var heightForHeaderInSection: ((UITableView,Int) -> CGFloat)?
//    public var heightForFooterInSection: ((UITableView,Int) -> CGFloat)?
//    
//    public var estimatedHeightForRowAtIndexPath: ((UITableView,NSIndexPath) -> CGFloat)?
//    public var estimatedHeightForHeaderInSection: ((UITableView,Int) -> CGFloat)?
//    public var estimatedHeightForFooterInSection: ((UITableView,Int) -> CGFloat)?
//    
//    public var viewForHeaderInSection: ((UITableView,Int) -> UIView?)?
//    public var viewForFooterInSection: ((UITableView,Int) -> UIView?)?
//    
//    public var accessoryButtonTappedForRowWithIndexPath: ((UITableView,NSIndexPath) -> Void)?
//
//    public var shouldHighlightRowAtIndexPath: ((UITableView,NSIndexPath) -> Bool)?
//    public var didHighlightRowAtIndexPath: ((UITableView,NSIndexPath) -> Void)?
//    public var didUnhighlightRowAtIndexPath: ((UITableView,NSIndexPath) -> Void)?
//    
//    public var willSelectRowAtIndexPath: ((UITableView,NSIndexPath) -> NSIndexPath?)?
//    public var willDeselectRowAtIndexPath: ((UITableView,NSIndexPath) -> NSIndexPath?)?
//    public var didSelectRowAtIndexPath: ((UITableView,NSIndexPath) -> Void)?
//    public var didDeselectRowAtIndexPath: ((UITableView,NSIndexPath) -> Void)?
//    
//    @available(iOS 2.0, *)
//    public func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//        willDisplayCell?(tableView, cell, indexPath)
//    }
//    @available(iOS 6.0, *)
//    public func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        willDisplayHeaderView?(tableView, view, section)
//    }
//    @available(iOS 6.0, *)
//    public func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
//        willDisplayFooterView?(tableView, view, section)
//    }
//    @available(iOS 6.0, *)
//    public func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//        didEndDisplayingCell?(tableView, cell, indexPath)
//    }
//    @available(iOS 6.0, *)
//    public func tableView(tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
//        didEndDisplayingHeaderView?(tableView, view, section)
//    }
//    @available(iOS 6.0, *)
//    public func tableView(tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
//        didEndDisplayingFooterView?(tableView, view, section)
//    }
//
//    // public variable height support
//    @available(iOS 2.0, *)
//    public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return heightForRowAtIndexPath?(tableView, indexPath) ?? 44
//    }
//    @available(iOS 2.0, *)
//    public func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return heightForHeaderInSection?(tableView, section) ?? 0
//    }
//    @available(iOS 2.0, *)
//    public func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return heightForFooterInSection?(tableView, section) ?? 0
//    }
//
//    // Use the estimatedHeight methods to quickly calcuate guessed values which will allow for fast load times of the table.
//    // If these methods are implemented, the above -tableView:heightForXXX calls will be deferred until views are ready to be displayed, so more expensive logic can be placed there.
//    @available(iOS 7.0, *)
//    public func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return estimatedHeightForRowAtIndexPath?(tableView, indexPath) ?? 44
//    }
//    @available(iOS 7.0, *)
//    public func tableView(tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
//        return estimatedHeightForHeaderInSection?(tableView, section) ?? 0
//    }
//    @available(iOS 7.0, *)
//    public func tableView(tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
//        return estimatedHeightForFooterInSection?(tableView, section) ?? 0
//    }
//
//    // Section header & footer information. Views are preferred over title should you decide to provide both
//    
//    @available(iOS 2.0, *)
//    // custom view for header. will be adjusted to default or specified header height
//    public func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return viewForHeaderInSection?(tableView, section)
//    }
//    @available(iOS 2.0, *)
//    // custom view for footer. will be adjusted to default or specified footer height
//    public func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        return viewForFooterInSection?(tableView, section)
//    }
//
//    
//    @available(iOS 2.0, *)
//    public func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
//        accessoryButtonTappedForRowWithIndexPath?(tableView, indexPath)
//    }
//    
//    // Selection
//
//    // -tableView:shouldHighlightRowAtIndexPath: is called when a touch comes down on a row.
//    // Returning NO to that message halts the selection process and does not cause the currently selected row to lose its selected look while the touch is down.
//    @available(iOS 6.0, *)
//    public func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        return shouldHighlightRowAtIndexPath?(tableView, indexPath) ?? true
//    }
//    @available(iOS 6.0, *)
//    public func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
//        didHighlightRowAtIndexPath?(tableView, indexPath)
//    }
//    @available(iOS 6.0, *)
//    public func tableView(tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: NSIndexPath) {
//        didUnhighlightRowAtIndexPath?(tableView, indexPath)
//    }
//    
//    // Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
//    @available(iOS 2.0, *)
//    public func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
//        return willSelectRowAtIndexPath?(tableView, indexPath)
//    }
//    @available(iOS 3.0, *)
//    public func tableView(tableView: UITableView, willDeselectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
//        return willDeselectRowAtIndexPath?(tableView, indexPath)
//    }
//    // Called after the user changes the selection.
//    @available(iOS 2.0, *)
//    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        didSelectRowAtIndexPath?(tableView, indexPath)
//    }
//    @available(iOS 3.0, *)
//    public func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
//        didDeselectRowAtIndexPath?(tableView, indexPath)
//    }
////
////    // Editing
////    
////    // Allows customization of the editingStyle for a particular cell located at 'indexPath'. If not implemented, all editable cells will have UITableViewCellEditingStyleDelete set for them when the table has editing property set to YES.
////    @available(iOS 2.0, *)
////    public func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle
////    @available(iOS 3.0, *)
////    public func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String?
////    @available(iOS 8.0, *)
////    public func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? // supercedes -tableView:titleForDeleteConfirmationButtonForRowAtIndexPath: if return value is non-nil
////    
////    // Controls whether the background is indented while editing.  If not implemented, the default is YES.  This is unrelated to the indentation level below.  This method only applies to grouped style table views.
////    @available(iOS 2.0, *)
////    public func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool
////    
////    // The willBegin/didEnd methods are called whenever the 'editing' property is automatically changed by the table (allowing insert/delete/move). This is done by a swipe activating a single row
////    @available(iOS 2.0, *)
////    public func tableView(tableView: UITableView, willBeginEditingRowAtIndexPath indexPath: NSIndexPath)
////    @available(iOS 2.0, *)
////    public func tableView(tableView: UITableView, didEndEditingRowAtIndexPath indexPath: NSIndexPath)
////    
////    // Moving/reordering
////    
////    // Allows customization of the target row for a particular row as it is being moved/reordered
////    @available(iOS 2.0, *)
////    public func tableView(tableView: UITableView, targetIndexPathForMoveFromRowAtIndexPath sourceIndexPath: NSIndexPath, toProposedIndexPath proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath
////    
////    // Indentation
////    
////    @available(iOS 2.0, *)
////    public func tableView(tableView: UITableView, indentationLevelForRowAtIndexPath indexPath: NSIndexPath) -> Int // return 'depth' of row for hierarchies 
////    {
////    
////    // Copy/Paste.  All three methods must be implemented by the delegate.
////    
////    @available(iOS 5.0, *)
////    public func tableView(tableView: UITableView, shouldShowMenuForRowAtIndexPath indexPath: NSIndexPath) -> Bool {
////        
////    }
////    @available(iOS 5.0, *)
////    public func tableView(tableView: UITableView, canPerformAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
////        
////    }
////    @available(iOS 5.0, *)
////    public func tableView(tableView: UITableView, performAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
////        
////    }
////    
////    // Focus
////    
////    @available(iOS 9.0, *)
////    public func tableView(tableView: UITableView, canFocusRowAtIndexPath indexPath: NSIndexPath) -> Bool {
////        
////    }
////    @available(iOS 9.0, *)
////    public func tableView(tableView: UITableView, shouldUpdateFocusInContext context: UITableViewFocusUpdateContext) -> Bool {
////        
////    }
////    @available(iOS 9.0, *)
////    public func tableView(tableView: UITableView, didUpdateFocusInContext context: UITableViewFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
////        
////    }
////    @available(iOS 9.0, *)
////    public func indexPathForPreferredFocusedViewInTableView(tableView: UITableView) -> NSIndexPath? {
////        
////    }
//
//}
