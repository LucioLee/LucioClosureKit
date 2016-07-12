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
    
    // Display customization
    private var willDisplayCell: ((UITableView,UITableViewCell,NSIndexPath) -> Void)!
    @available(iOS 2.0, *)
    func willDisplayCell(handler:((tableView: UITableView, cell: UITableViewCell, indexPath: NSIndexPath) -> Void)) {
        willDisplayCell = handler
    }
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        willDisplayCell(tableView, cell, indexPath)
    }
    
    private var willDisplayHeaderView: ((UITableView,UIView,Int) -> Void)!
    @available(iOS 6.0, *)
    func willDisplayHeaderView(handler:((tableView: UITableView, view: UIView, section: Int) -> Void)) {
        willDisplayHeaderView = handler
    }
    @available(iOS 6.0, *)
    public func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        willDisplayHeaderView(tableView, view, section)
    }
    
    private var willDisplayFooterView: ((UITableView,UIView,Int) -> Void)!
    @available(iOS 6.0, *)
    func willDisplayFooterView(handler:((tableView: UITableView, view: UIView, section: Int) -> Void)) {
        willDisplayFooterView = handler
    }
    @available(iOS 6.0, *)
    public func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        willDisplayFooterView(tableView, view, section)
    }
    
    private var didEndDisplayingCell: ((UITableView,UITableViewCell,NSIndexPath) -> Void)!
    @available(iOS 6.0, *)
    func didEndDisplayingCell(handler:((tableView: UITableView, cell: UITableViewCell, indexPath: NSIndexPath) -> Void)) {
        didEndDisplayingCell = handler
    }
    @available(iOS 6.0, *)
    public func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        didEndDisplayingCell(tableView, cell, indexPath)
    }
    
    private var didEndDisplayingHeaderView: ((UITableView,UIView,Int) -> Void)!
    @available(iOS 6.0, *)
    func didEndDisplayingHeaderView(handler:((tableView: UITableView, view: UIView, section: Int) -> Void)) {
        didEndDisplayingHeaderView = handler
    }
    @available(iOS 6.0, *)
    public func tableView(tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        didEndDisplayingHeaderView(tableView, view, section)
    }
    
    private var didEndDisplayingFooterView: ((UITableView,UIView,Int) -> Void)!
    @available(iOS 6.0, *)
    func didEndDisplayingFooterView(handler:((tableView: UITableView, view: UIView, section: Int) -> Void)) {
        didEndDisplayingFooterView = handler
    }
    @available(iOS 6.0, *)
    public func tableView(tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        didEndDisplayingFooterView(tableView, view, section)
    }
    
    // public variable height support
    private var heightForRowAtIndexPath: ((UITableView,NSIndexPath) -> CGFloat)!
    @available(iOS 2.0, *)
    func heightForRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath) -> CGFloat)) {
        heightForRowAtIndexPath = handler
    }
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return heightForRowAtIndexPath(tableView, indexPath)
    }
    
    private var heightForFooterInSection: ((UITableView,Int) -> CGFloat)!
    @available(iOS 2.0, *)
    func heightForHeaderInSection(handler:((tableView: UITableView, section: Int) -> CGFloat)) {
        heightForHeaderInSection = handler
    }
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return heightForHeaderInSection(tableView, section)
    }
    
    private var heightForHeaderInSection: ((UITableView,Int) -> CGFloat)!
    @available(iOS 2.0, *)
    func heightForFooterInSection(handler:((tableView: UITableView, section: Int) -> CGFloat)) {
        heightForFooterInSection = handler
    }
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return heightForFooterInSection(tableView, section)
    }
    // Use the estimatedHeight methods to quickly calcuate guessed values which will allow for fast load times of the table.
    // If these methods are implemented, the above -tableView:heightForXXX calls will be deferred until views are ready to be displayed, so more expensive logic can be placed there.
    private var estimatedHeightForRowAtIndexPath: ((UITableView,NSIndexPath) -> CGFloat)!
    @available(iOS 7.0, *)
    func estimatedHeightForRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath) -> CGFloat)) {
        estimatedHeightForRowAtIndexPath = handler
    }
    @available(iOS 7.0, *)
    public func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return estimatedHeightForRowAtIndexPath(tableView, indexPath)
    }
    
    private var estimatedHeightForHeaderInSection: ((UITableView,Int) -> CGFloat)!
    @available(iOS 7.0, *)
    func estimatedHeightForHeaderInSection(handler:((tableView: UITableView, section: Int) -> CGFloat)) {
        estimatedHeightForHeaderInSection = handler
    }
    @available(iOS 7.0, *)
    public func tableView(tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return estimatedHeightForHeaderInSection(tableView, section)
    }
    
    private var estimatedHeightForFooterInSection: ((UITableView,Int) -> CGFloat)!
    @available(iOS 7.0, *)
    func estimatedHeightForFooterInSection(handler:((tableView: UITableView, section: Int) -> CGFloat)) {
        estimatedHeightForFooterInSection = handler
    }
    @available(iOS 7.0, *)
    public func tableView(tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return estimatedHeightForFooterInSection(tableView, section)
    }
    
    
    
    // Section header & footer information. Views are preferred over title should you decide to provide both
    // custom view for header. will be adjusted to default or specified header height
    private var viewForHeaderInSection: ((UITableView,Int) -> UIView?)!
    @available(iOS 2.0, *)
    func viewForHeaderInSection(handler:((tableView: UITableView, section: Int) -> UIView?)) {
        viewForHeaderInSection = handler
    }
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return viewForHeaderInSection(tableView, section)
    }
    
    // custom view for header. will be adjusted to default or specified header height
    private var viewForFooterInSection: ((UITableView,Int) -> UIView?)!
    @available(iOS 2.0, *)
    func viewForFooterInSection(handler:((tableView: UITableView, section: Int) -> UIView?)) {
        viewForFooterInSection = handler
    }
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return viewForFooterInSection(tableView, section)
    }
    
    
    
    
    private var accessoryButtonTappedForRowWithIndexPath: ((UITableView,NSIndexPath) -> Void)!
    @available(iOS 2.0, *)
    func accessoryButtonTappedForRowWithIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath) -> Void)) {
        accessoryButtonTappedForRowWithIndexPath = handler
    }
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        accessoryButtonTappedForRowWithIndexPath!(tableView, indexPath)
    }

    
    
    
    // func shouldHighlightRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath)) -> Bool) is called when a touch comes down on a row.
    // Returning NO to that message halts the selection process and does not cause the currently selected row to lose its selected look while the touch is down.
    private var shouldHighlightRowAtIndexPath: ((UITableView,NSIndexPath) -> Bool)!
    @available(iOS 2.0, *)
    func shouldHighlightRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath) -> Bool)) {
        shouldHighlightRowAtIndexPath = handler
    }
    @available(iOS 6.0, *)
    public func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return shouldHighlightRowAtIndexPath!(tableView, indexPath)
    }

    private var didHighlightRowAtIndexPath: ((UITableView,NSIndexPath) -> Void)!
    @available(iOS 6.0, *)
    public func didHighlightRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath) -> Void)) {
        didHighlightRowAtIndexPath = handler
    }
    @available(iOS 6.0, *)
    public func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        didHighlightRowAtIndexPath!(tableView, indexPath)
    }

    private var didUnhighlightRowAtIndexPath: ((UITableView,NSIndexPath) -> Void)!
    @available(iOS 6.0, *)
    public func didUnhighlightRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath) -> Void)) {
        didUnhighlightRowAtIndexPath = handler
    }
    @available(iOS 6.0, *)
    public func tableView(tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: NSIndexPath) {
        didUnhighlightRowAtIndexPath!(tableView, indexPath)
    }

    private var willSelectRowAtIndexPath: ((UITableView,NSIndexPath) -> NSIndexPath?)!
    // Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
    @available(iOS 2.0, *)
    public func willSelectRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath) -> NSIndexPath?)) {
        willSelectRowAtIndexPath = handler
    }
    public func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return willSelectRowAtIndexPath(tableView, indexPath)
    }
    
    // Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
    private var willDeselectRowAtIndexPath: ((UITableView,NSIndexPath) -> NSIndexPath?)!
    @available(iOS 3.0, *)
    public func willDeselectRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath) -> NSIndexPath?)) {
        willDeselectRowAtIndexPath = handler
    }
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, willDeselectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return willDeselectRowAtIndexPath!(tableView, indexPath)
    }
    
    private var didSelectRowAtIndexPath: ((UITableView,NSIndexPath) -> Void)!
    // Called after the user changes the selection.
    @available(iOS 2.0, *)
    public func didSelectRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath) -> Void)) {
        didSelectRowAtIndexPath = handler
    }
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        didSelectRowAtIndexPath!(tableView, indexPath)
    }

    private var didDeselectRowAtIndexPath: ((UITableView,NSIndexPath) -> Void)!
    @available(iOS 3.0, *)
    public func didDeselectRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath) -> Void)) {
        didDeselectRowAtIndexPath = handler
    }
    @available(iOS 3.0, *)
    public func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        didDeselectRowAtIndexPath!(tableView, indexPath)
    }
    
    
    // Editing
    
    // Allows customization of the editingStyle for a particular cell located at 'indexPath'. If not implemented, all editable cells will have UITableViewCellEditingStyleDelete set for them when the table has editing property set to YES.
    private var editingStyleForRowAtIndexPath: ((UITableView,NSIndexPath) -> UITableViewCellEditingStyle)!
    public func editingStyleForRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCellEditingStyle)) {
        editingStyleForRowAtIndexPath = handler
    }
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return editingStyleForRowAtIndexPath!(tableView, indexPath)
    }
    
    private var titleForDeleteConfirmationButtonForRowAtIndexPath: ((UITableView,NSIndexPath) -> String?)!
    public func titleForDeleteConfirmationButtonForRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath) -> String?)) {
        titleForDeleteConfirmationButtonForRowAtIndexPath = handler
    }
    @available(iOS 3.0, *)
    public func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return titleForDeleteConfirmationButtonForRowAtIndexPath(tableView, indexPath)
    }
    
    // Controls whether the background is indented while editing.  If not implemented, the default is YES.  This is unrelated to the indentation level below.  This method only applies to grouped style table views.
    private var shouldIndentWhileEditingRowAtIndexPath: ((UITableView,NSIndexPath) -> Bool)!
    @available(iOS 2.0, *)
    public func shouldIndentWhileEditingRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath) -> Bool)) {
        shouldIndentWhileEditingRowAtIndexPath = handler
    }
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return shouldIndentWhileEditingRowAtIndexPath(tableView, indexPath)
    }
    
    // The willBegin/didEnd methods are called whenever the 'editing' property is automatically changed by the table (allowing insert/delete/move). This is done by a swipe activating a single row
    private var willBeginEditingRowAtIndexPath: ((UITableView,NSIndexPath) -> Void)!
    @available(iOS 2.0, *)
    public func willBeginEditingRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath) -> Void)) {
        willBeginEditingRowAtIndexPath = handler
    }
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, willBeginEditingRowAtIndexPath indexPath: NSIndexPath) {
        willBeginEditingRowAtIndexPath(tableView, indexPath)
    }
    
    private var didEndEditingRowAtIndexPath: ((UITableView,NSIndexPath) -> Void)!
    @available(iOS 2.0, *)
    public func didEndEditingRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath) -> Void)) {
        didEndEditingRowAtIndexPath = handler
    }
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, didEndEditingRowAtIndexPath indexPath: NSIndexPath) {
        didEndEditingRowAtIndexPath(tableView, indexPath)
    }
    
    // Moving/reordering
    
    // Allows customization of the target row for a particular row as it is being moved/reordered
    private var targetIndexPathForMove: ((UITableView,NSIndexPath,NSIndexPath) -> NSIndexPath)!
    @available(iOS 2.0, *)
    public func targetIndexPathForMove(handler:((tableView: UITableView, sourceIndexPath: NSIndexPath, proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath)) {
        targetIndexPathForMove = handler
    }
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, targetIndexPathForMoveFromRowAtIndexPath sourceIndexPath: NSIndexPath, toProposedIndexPath proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath {
        return targetIndexPathForMove(tableView, sourceIndexPath,proposedDestinationIndexPath)
    }
    
    // Indentation
    // return 'depth' of row for hierarchies
    private var indentationLevelForRowAtIndexPath: ((UITableView,NSIndexPath) -> Int)!
    @available(iOS 2.0, *)
    public func indentationLevelForRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath) -> Int)) {
        indentationLevelForRowAtIndexPath = handler
    }
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, indentationLevelForRowAtIndexPath indexPath: NSIndexPath) -> Int {
            return indentationLevelForRowAtIndexPath(tableView, indexPath)
    }
    
    // Copy/Paste.  All three methods must be implemented by the delegate.
    
    private var shouldShowMenuForRowAtIndexPath: ((UITableView,NSIndexPath) -> Bool)!
    @available(iOS 5.0, *)
    public func shouldShowMenuForRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath) -> Bool)) {
        shouldShowMenuForRowAtIndexPath = handler
    }
    @available(iOS 5.0, *)
    public func tableView(tableView: UITableView, shouldShowMenuForRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return shouldShowMenuForRowAtIndexPath(tableView, indexPath)
    }
    
    private var canPerformAction: ((UITableView,Selector,NSIndexPath,AnyObject?) -> Bool)!
    @available(iOS 5.0, *)
    public func canPerformAction(handler:((tableView: UITableView, action: Selector, indexPath: NSIndexPath, sender: AnyObject?) -> Bool)) {
        canPerformAction = handler
    }
    @available(iOS 5.0, *)
    public func tableView(tableView: UITableView, canPerformAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return canPerformAction(tableView,action,indexPath,sender)
    }
    
    private var performAction: ((UITableView,Selector,NSIndexPath,AnyObject?) -> Void)!
    @available(iOS 5.0, *)
    public func performAction(handler:((tableView: UITableView, action: Selector, indexPath: NSIndexPath, sender: AnyObject?) -> Void)) {
        performAction = handler
    }
    @available(iOS 5.0, *)
    public func tableView(tableView: UITableView, performAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
        performAction(tableView,action,indexPath,sender)
    }
}
@available(iOS 8.0, *)
public class TableViewDeleageAdapter_iOS_8: TableViewDeleageAdapter {
    // supercedes -tableView:titleForDeleteConfirmationButtonForRowAtIndexPath: if return value is non-nil
    private var editActionsForRowAtIndexPath: ((UITableView,NSIndexPath) -> [UITableViewRowAction]?)!
    @available(iOS 8.0, *)
    public func editActionsForRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath) -> [UITableViewRowAction]?)) {
        editActionsForRowAtIndexPath = handler
    }
    @available(iOS 8.0, *)
    public func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        return editActionsForRowAtIndexPath(tableView, indexPath)
    }
}

@available(iOS 9.0, *)
public class TableViewDeleageAdapter_iOS_9: TableViewDeleageAdapter_iOS_8 {
    // Focus
    
    private var canFocusRowAtIndexPath: ((UITableView,NSIndexPath) -> Bool)!
    @available(iOS 9.0, *)
    public func canFocusRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath) -> Bool)) {
        canFocusRowAtIndexPath = handler
    }
    @available(iOS 9.0, *)
    public func tableView(tableView: UITableView, canFocusRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return canFocusRowAtIndexPath(tableView,indexPath)
    }
    
    private var shouldUpdateFocusInContext: ((UITableView,UITableViewFocusUpdateContext) -> Bool)!
    @available(iOS 9.0, *)
    public func shouldUpdateFocusInContext(handler:((tableView: UITableView, context: UITableViewFocusUpdateContext) -> Bool)) {
        shouldUpdateFocusInContext = handler
    }
    @available(iOS 9.0, *)
    public func tableView(tableView: UITableView, shouldUpdateFocusInContext context: UITableViewFocusUpdateContext) -> Bool {
        return shouldUpdateFocusInContext(tableView, context)
    }

    private var didUpdateFocusInContext: ((UITableView,UITableViewFocusUpdateContext,UIFocusAnimationCoordinator) -> Void)!
    @available(iOS 9.0, *)
    public func didUpdateFocusInContext(handler:((tableView: UITableView, context: UITableViewFocusUpdateContext, coordinator: UIFocusAnimationCoordinator) -> Void)) {
        didUpdateFocusInContext = handler
    }
    @available(iOS 9.0, *)
    public func tableView(tableView: UITableView, didUpdateFocusInContext context: UITableViewFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        didUpdateFocusInContext(tableView,context,coordinator)
    }
    
    private var indexPathForPreferredFocusedView: ((UITableView) -> NSIndexPath?)!
    @available(iOS 9.0, *)
    public func indexPathForPreferredFocusedView(handler:((tableView: UITableView) -> NSIndexPath?)) {
        indexPathForPreferredFocusedView = handler
    }
    @available(iOS 9.0, *)
    public func indexPathForPreferredFocusedViewInTableView(tableView: UITableView) -> NSIndexPath? {
        return indexPathForPreferredFocusedView(tableView)
    }
}


public class TableViewDataSourceAdapter: NSObject,UITableViewDataSource {
    
    private var numberOfRowsInSection: ((UITableView,Int) -> Int)!
    @available(iOS 2.0, *)
    public func numberOfRowsInSection(handler: ((tableView: UITableView, section: Int) -> Int)) {
        numberOfRowsInSection = handler
    }
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRowsInSection(tableView, section)
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    private var cellForRowAtIndexPath: ((UITableView,NSIndexPath) -> UITableViewCell)!
    @available(iOS 2.0, *)
    public func cellForRowAtIndexPath(handler: ((tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell)) {
        cellForRowAtIndexPath = handler
    }
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return cellForRowAtIndexPath(tableView, indexPath)
    }
    
    private var numberOfSections: ((UITableView) -> Int)!
    @available(iOS 2.0, *)
    public func numberOfSections(handler: ((tableView: UITableView) -> Int)) {
        numberOfSections = handler
    }
    // Default is 1 if not implemented
    @available(iOS 2.0, *)
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return numberOfSections(tableView)
    }
    
    // fixed font style. use custom view (UILabel) if you want something different
    private var titleForHeaderInSection: ((UITableView,Int) -> String?)!
    @available(iOS 2.0, *)
    public func titleForHeaderInSection(handler: ((tableView: UITableView, section: Int) -> String?)) {
        titleForHeaderInSection = handler
    }
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleForHeaderInSection(tableView, section)
    }
    
    private var titleForFooterInSection: ((UITableView,Int) -> String?)!
    @available(iOS 2.0, *)
    public func titleForFooterInSection(handler: ((tableView: UITableView, section: Int) -> String?)) {
        titleForFooterInSection = handler
    }
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return titleForHeaderInSection(tableView, section)
    }
    
    // Editing
    
    // Individual rows can opt out of having the -editing property set for them. If not implemented, all rows are assumed to be editable.
    private var canEditRowAtIndexPath: ((UITableView,NSIndexPath) -> Bool)!
    @available(iOS 2.0, *)
    public func canEditRowAtIndexPath(handler: ((tableView: UITableView, indexPath: NSIndexPath) -> Bool)) {
        canEditRowAtIndexPath = handler
    }
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return canEditRowAtIndexPath(tableView, indexPath)
    }
    
    // Moving/reordering
    
    // Allows the reorder accessory view to optionally be shown for a particular row. By default, the reorder control will be shown only if the datasource implements -tableView:moveRowAtIndexPath:toIndexPath:
    private var canMoveRowAtIndexPath: ((UITableView,NSIndexPath) -> Bool)!
    @available(iOS 2.0, *)
    public func canMoveRowAtIndexPath(handler: ((tableView: UITableView, indexPath: NSIndexPath) -> Bool)) {
        canMoveRowAtIndexPath = handler
    }
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return canMoveRowAtIndexPath(tableView, indexPath)
    }
    
    // Index
    
    // return list of section titles to display in section index view (e.g. "ABCD...Z#")
    private var sectionIndexTitles: ((UITableView) -> [String]?)!
    @available(iOS 2.0, *)
    public func sectionIndexTitles(handler: ((tableView: UITableView) -> [String]?)) {
        sectionIndexTitles = handler
    }
    @available(iOS 2.0, *)
    public func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return sectionIndexTitles(tableView)
    }
    // tell table which section corresponds to section title/index (e.g. "B",1))

    private var sectionForSectionIndexTitle: ((UITableView,String,Int) -> Int)!
    @available(iOS 2.0, *)
    public func sectionForSectionIndexTitle(handler: ((tableView: UITableView, title: String, index: Int) -> Int)) {
        sectionForSectionIndexTitle = handler
    }
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        return sectionForSectionIndexTitle(tableView,title,index)
    }
    
    // Data manipulation - insert and delete support
    
    // After a row has the minus or plus button invoked (based on the UITableViewCellEditingStyle for the cell), the dataSource must commit the change
    // Not called for edit actions using UITableViewRowAction - the action's handler will be invoked instead
    private var commitEditingStyle: ((UITableView,UITableViewCellEditingStyle,NSIndexPath) -> Void)!
    @available(iOS 2.0, *)
    public func commitEditingStyle(handler: ((tableView: UITableView, editingStyle: UITableViewCellEditingStyle, indexPath: NSIndexPath) -> Void)) {
        commitEditingStyle = handler
    }
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        commitEditingStyle(tableView, editingStyle, indexPath)
    }
    
    // Data manipulation - reorder / moving support
    private var moveRowAtIndexPath: ((UITableView,NSIndexPath,NSIndexPath) -> Void)!
    @available(iOS 2.0, *)
    public func moveRowAtIndexPath(handler: ((tableView: UITableView, sourceIndexPath: NSIndexPath, destinationIndexPath: NSIndexPath) -> Void)) {
        moveRowAtIndexPath = handler
    }
    @available(iOS 2.0, *)
    public func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        moveRowAtIndexPath(tableView, sourceIndexPath,destinationIndexPath)
    }
}

