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
open class TableViewDelegateAdapter: NSObject,UITableViewDelegate {
    
    // Display customization
    fileprivate var willDisplayCell: ((UITableView,UITableViewCell,IndexPath) -> Void)!
    @available(iOS 2.0, *)
    func willDisplayCell(_ handler:((_ tableView: UITableView, _ cell: UITableViewCell, _ indexPath: IndexPath) -> Void)) {
        willDisplayCell = handler
    }
    @available(iOS 2.0, *)
    open func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        willDisplayCell(tableView, cell, indexPath)
    }
    
    fileprivate var willDisplayHeaderView: ((UITableView,UIView,Int) -> Void)!
    @available(iOS 6.0, *)
    func willDisplayHeaderView(_ handler:((_ tableView: UITableView, _ view: UIView, _ section: Int) -> Void)) {
        willDisplayHeaderView = handler
    }
    @available(iOS 6.0, *)
    open func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        willDisplayHeaderView(tableView, view, section)
    }
    
    fileprivate var willDisplayFooterView: ((UITableView,UIView,Int) -> Void)!
    @available(iOS 6.0, *)
    func willDisplayFooterView(_ handler:((_ tableView: UITableView, _ view: UIView, _ section: Int) -> Void)) {
        willDisplayFooterView = handler
    }
    @available(iOS 6.0, *)
    open func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        willDisplayFooterView(tableView, view, section)
    }
    
    fileprivate var didEndDisplayingCell: ((UITableView,UITableViewCell,IndexPath) -> Void)!
    @available(iOS 6.0, *)
    func didEndDisplayingCell(_ handler:((_ tableView: UITableView, _ cell: UITableViewCell, _ indexPath: IndexPath) -> Void)) {
        didEndDisplayingCell = handler
    }
    @available(iOS 6.0, *)
    open func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        didEndDisplayingCell(tableView, cell, indexPath)
    }
    
    fileprivate var didEndDisplayingHeaderView: ((UITableView,UIView,Int) -> Void)!
    @available(iOS 6.0, *)
    func didEndDisplayingHeaderView(_ handler:((_ tableView: UITableView, _ view: UIView, _ section: Int) -> Void)) {
        didEndDisplayingHeaderView = handler
    }
    @available(iOS 6.0, *)
    open func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        didEndDisplayingHeaderView(tableView, view, section)
    }
    
    fileprivate var didEndDisplayingFooterView: ((UITableView,UIView,Int) -> Void)!
    @available(iOS 6.0, *)
    func didEndDisplayingFooterView(_ handler:((_ tableView: UITableView, _ view: UIView, _ section: Int) -> Void)) {
        didEndDisplayingFooterView = handler
    }
    @available(iOS 6.0, *)
    open func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        didEndDisplayingFooterView(tableView, view, section)
    }
    
    // public variable height support
    fileprivate var heightForRowAtIndexPath: ((UITableView,IndexPath) -> CGFloat)!
    @available(iOS 2.0, *)
    func heightForRowAtIndexPath(_ handler:((_ tableView: UITableView, _ indexPath: IndexPath) -> CGFloat)) {
        heightForRowAtIndexPath = handler
    }
    @available(iOS 2.0, *)
    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightForRowAtIndexPath(tableView, indexPath)
    }
    
    fileprivate var heightForFooterInSection: ((UITableView,Int) -> CGFloat)!
    @available(iOS 2.0, *)
    func heightForHeaderInSection(_ handler:((_ tableView: UITableView, _ section: Int) -> CGFloat)) {
        heightForHeaderInSection = handler
    }
    @available(iOS 2.0, *)
    open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return heightForHeaderInSection(tableView, section)
    }
    
    fileprivate var heightForHeaderInSection: ((UITableView,Int) -> CGFloat)!
    @available(iOS 2.0, *)
    func heightForFooterInSection(_ handler:((_ tableView: UITableView, _ section: Int) -> CGFloat)) {
        heightForFooterInSection = handler
    }
    @available(iOS 2.0, *)
    open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return heightForFooterInSection(tableView, section)
    }
    // Use the estimatedHeight methods to quickly calcuate guessed values which will allow for fast load times of the table.
    // If these methods are implemented, the above -tableView:heightForXXX calls will be deferred until views are ready to be displayed, so more expensive logic can be placed there.
    fileprivate var estimatedHeightForRowAtIndexPath: ((UITableView,IndexPath) -> CGFloat)!
    @available(iOS 7.0, *)
    func estimatedHeightForRowAtIndexPath(_ handler:((_ tableView: UITableView, _ indexPath: IndexPath) -> CGFloat)) {
        estimatedHeightForRowAtIndexPath = handler
    }
    @available(iOS 7.0, *)
    open func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return estimatedHeightForRowAtIndexPath(tableView, indexPath)
    }
    
    fileprivate var estimatedHeightForHeaderInSection: ((UITableView,Int) -> CGFloat)!
    @available(iOS 7.0, *)
    func estimatedHeightForHeaderInSection(_ handler:((_ tableView: UITableView, _ section: Int) -> CGFloat)) {
        estimatedHeightForHeaderInSection = handler
    }
    @available(iOS 7.0, *)
    open func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return estimatedHeightForHeaderInSection(tableView, section)
    }
    
    fileprivate var estimatedHeightForFooterInSection: ((UITableView,Int) -> CGFloat)!
    @available(iOS 7.0, *)
    func estimatedHeightForFooterInSection(_ handler:((_ tableView: UITableView, _ section: Int) -> CGFloat)) {
        estimatedHeightForFooterInSection = handler
    }
    @available(iOS 7.0, *)
    open func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return estimatedHeightForFooterInSection(tableView, section)
    }
    
    
    
    // Section header & footer information. Views are preferred over title should you decide to provide both
    // custom view for header. will be adjusted to default or specified header height
    fileprivate var viewForHeaderInSection: ((UITableView,Int) -> UIView?)!
    @available(iOS 2.0, *)
    func viewForHeaderInSection(_ handler:((_ tableView: UITableView, _ section: Int) -> UIView?)) {
        viewForHeaderInSection = handler
    }
    @available(iOS 2.0, *)
    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return viewForHeaderInSection(tableView, section)
    }
    
    // custom view for header. will be adjusted to default or specified header height
    fileprivate var viewForFooterInSection: ((UITableView,Int) -> UIView?)!
    @available(iOS 2.0, *)
    func viewForFooterInSection(_ handler:((_ tableView: UITableView, _ section: Int) -> UIView?)) {
        viewForFooterInSection = handler
    }
    @available(iOS 2.0, *)
    open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return viewForFooterInSection(tableView, section)
    }
    
    
    
    
    fileprivate var accessoryButtonTappedForRowWithIndexPath: ((UITableView,IndexPath) -> Void)!
    @available(iOS 2.0, *)
    func accessoryButtonTappedForRowWithIndexPath(_ handler:((_ tableView: UITableView, _ indexPath: IndexPath) -> Void)) {
        accessoryButtonTappedForRowWithIndexPath = handler
    }
    @available(iOS 2.0, *)
    open func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        accessoryButtonTappedForRowWithIndexPath!(tableView, indexPath)
    }

    
    
    
    // func shouldHighlightRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath)) -> Bool) is called when a touch comes down on a row.
    // Returning NO to that message halts the selection process and does not cause the currently selected row to lose its selected look while the touch is down.
    fileprivate var shouldHighlightRowAtIndexPath: ((UITableView,IndexPath) -> Bool)!
    @available(iOS 2.0, *)
    func shouldHighlightRowAtIndexPath(_ handler:((_ tableView: UITableView, _ indexPath: IndexPath) -> Bool)) {
        shouldHighlightRowAtIndexPath = handler
    }
    @available(iOS 6.0, *)
    open func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return shouldHighlightRowAtIndexPath!(tableView, indexPath)
    }

    fileprivate var didHighlightRowAtIndexPath: ((UITableView,IndexPath) -> Void)!
    @available(iOS 6.0, *)
    open func didHighlightRowAtIndexPath(_ handler:((_ tableView: UITableView, _ indexPath: IndexPath) -> Void)) {
        didHighlightRowAtIndexPath = handler
    }
    @available(iOS 6.0, *)
    open func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        didHighlightRowAtIndexPath!(tableView, indexPath)
    }

    fileprivate var didUnhighlightRowAtIndexPath: ((UITableView,IndexPath) -> Void)!
    @available(iOS 6.0, *)
    open func didUnhighlightRowAtIndexPath(_ handler:((_ tableView: UITableView, _ indexPath: IndexPath) -> Void)) {
        didUnhighlightRowAtIndexPath = handler
    }
    @available(iOS 6.0, *)
    open func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        didUnhighlightRowAtIndexPath!(tableView, indexPath)
    }

    fileprivate var willSelectRowAtIndexPath: ((UITableView,IndexPath) -> IndexPath?)!
    // Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
    @available(iOS 2.0, *)
    open func willSelectRowAtIndexPath(_ handler:((_ tableView: UITableView, _ indexPath: IndexPath) -> IndexPath?)) {
        willSelectRowAtIndexPath = handler
    }
    open func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return willSelectRowAtIndexPath(tableView, indexPath)
    }
    
    // Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
    fileprivate var willDeselectRowAtIndexPath: ((UITableView,IndexPath) -> IndexPath?)!
    @available(iOS 3.0, *)
    open func willDeselectRowAtIndexPath(_ handler:((_ tableView: UITableView, _ indexPath: IndexPath) -> IndexPath?)) {
        willDeselectRowAtIndexPath = handler
    }
    @available(iOS 2.0, *)
    open func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        return willDeselectRowAtIndexPath!(tableView, indexPath)
    }
    
    fileprivate var didSelectRowAtIndexPath: ((UITableView,IndexPath) -> Void)!
    // Called after the user changes the selection.
    @available(iOS 2.0, *)
    open func didSelectRowAtIndexPath(_ handler:((_ tableView: UITableView, _ indexPath: IndexPath) -> Void)) {
        didSelectRowAtIndexPath = handler
    }
    @available(iOS 2.0, *)
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectRowAtIndexPath!(tableView, indexPath)
    }

    fileprivate var didDeselectRowAtIndexPath: ((UITableView,IndexPath) -> Void)!
    @available(iOS 3.0, *)
    open func didDeselectRowAtIndexPath(_ handler:((_ tableView: UITableView, _ indexPath: IndexPath) -> Void)) {
        didDeselectRowAtIndexPath = handler
    }
    @available(iOS 3.0, *)
    open func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        didDeselectRowAtIndexPath!(tableView, indexPath)
    }
    
    
    // Editing
    
    // Allows customization of the editingStyle for a particular cell located at 'indexPath'. If not implemented, all editable cells will have UITableViewCellEditingStyleDelete set for them when the table has editing property set to YES.
    fileprivate var editingStyleForRowAtIndexPath: ((UITableView,IndexPath) -> UITableViewCellEditingStyle)!
    open func editingStyleForRowAtIndexPath(_ handler:((_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCellEditingStyle)) {
        editingStyleForRowAtIndexPath = handler
    }
    @available(iOS 2.0, *)
    open func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return editingStyleForRowAtIndexPath!(tableView, indexPath)
    }
    
    fileprivate var titleForDeleteConfirmationButtonForRowAtIndexPath: ((UITableView,IndexPath) -> String?)!
    open func titleForDeleteConfirmationButtonForRowAtIndexPath(_ handler:((_ tableView: UITableView, _ indexPath: IndexPath) -> String?)) {
        titleForDeleteConfirmationButtonForRowAtIndexPath = handler
    }
    @available(iOS 3.0, *)
    open func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return titleForDeleteConfirmationButtonForRowAtIndexPath(tableView, indexPath)
    }
    
    // Controls whether the background is indented while editing.  If not implemented, the default is YES.  This is unrelated to the indentation level below.  This method only applies to grouped style table views.
    fileprivate var shouldIndentWhileEditingRowAtIndexPath: ((UITableView,IndexPath) -> Bool)!
    @available(iOS 2.0, *)
    open func shouldIndentWhileEditingRowAtIndexPath(_ handler:((_ tableView: UITableView, _ indexPath: IndexPath) -> Bool)) {
        shouldIndentWhileEditingRowAtIndexPath = handler
    }
    @available(iOS 2.0, *)
    open func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return shouldIndentWhileEditingRowAtIndexPath(tableView, indexPath)
    }
    
    // The willBegin/didEnd methods are called whenever the 'editing' property is automatically changed by the table (allowing insert/delete/move). This is done by a swipe activating a single row
    fileprivate var willBeginEditingRowAtIndexPath: ((UITableView,IndexPath) -> Void)!
    @available(iOS 2.0, *)
    open func willBeginEditingRowAtIndexPath(_ handler:((_ tableView: UITableView, _ indexPath: IndexPath) -> Void)) {
        willBeginEditingRowAtIndexPath = handler
    }
    @available(iOS 2.0, *)
    open func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        willBeginEditingRowAtIndexPath(tableView, indexPath)
    }
    
    fileprivate var didEndEditingRowAtIndexPath: ((UITableView,IndexPath) -> Void)!
    @available(iOS 2.0, *)
    open func didEndEditingRowAtIndexPath(_ handler:((_ tableView: UITableView, _ indexPath: IndexPath) -> Void)) {
        didEndEditingRowAtIndexPath = handler
    }
    @available(iOS 2.0, *)
    open func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        didEndEditingRowAtIndexPath(tableView, indexPath!)
    }
    
    // Moving/reordering
    
    // Allows customization of the target row for a particular row as it is being moved/reordered
    fileprivate var targetIndexPathForMove: ((UITableView,IndexPath,IndexPath) -> IndexPath)!
    @available(iOS 2.0, *)
    open func targetIndexPathForMove(_ handler:((_ tableView: UITableView, _ sourceIndexPath: IndexPath, _ proposedDestinationIndexPath: IndexPath) -> IndexPath)) {
        targetIndexPathForMove = handler
    }
    @available(iOS 2.0, *)
    open func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        return targetIndexPathForMove(tableView, sourceIndexPath,proposedDestinationIndexPath)
    }
    
    // Indentation
    // return 'depth' of row for hierarchies
    fileprivate var indentationLevelForRowAtIndexPath: ((UITableView,IndexPath) -> Int)!
    @available(iOS 2.0, *)
    open func indentationLevelForRowAtIndexPath(_ handler:((_ tableView: UITableView, _ indexPath: IndexPath) -> Int)) {
        indentationLevelForRowAtIndexPath = handler
    }
    @available(iOS 2.0, *)
    open func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
            return indentationLevelForRowAtIndexPath(tableView, indexPath)
    }
    
    // Copy/Paste.  All three methods must be implemented by the delegate.
    
    fileprivate var shouldShowMenuForRowAtIndexPath: ((UITableView,IndexPath) -> Bool)!
    @available(iOS 5.0, *)
    open func shouldShowMenuForRowAtIndexPath(_ handler:((_ tableView: UITableView, _ indexPath: IndexPath) -> Bool)) {
        shouldShowMenuForRowAtIndexPath = handler
    }
    @available(iOS 5.0, *)
    open func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        return shouldShowMenuForRowAtIndexPath(tableView, indexPath)
    }
    
    fileprivate var canPerformAction: ((UITableView,Selector,IndexPath,Any?) -> Bool)!
    @available(iOS 5.0, *)
    open func canPerformAction(_ handler:((_ tableView: UITableView, _ action: Selector, _ indexPath: IndexPath, _ sender: Any?) -> Bool)) {
        canPerformAction = handler
    }
    @available(iOS 5.0, *)
    open func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return canPerformAction(tableView,action,indexPath,sender)
    }
    
    fileprivate var performAction: ((UITableView,Selector,IndexPath,Any?) -> Void)!
    @available(iOS 5.0, *)
    open func performAction(_ handler:((_ tableView: UITableView, _ action: Selector, _ indexPath: IndexPath, _ sender: Any?) -> Void)) {
        performAction = handler
    }
    @available(iOS 5.0, *)
    open func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        performAction(tableView,action,indexPath,sender)
    }
}
@available(iOS 8.0, *)
open class TableViewDeleageAdapter_iOS_8: TableViewDelegateAdapter {
    // supercedes -tableView:titleForDeleteConfirmationButtonForRowAtIndexPath: if return value is non-nil
    fileprivate var editActionsForRowAtIndexPath: ((UITableView,IndexPath) -> [UITableViewRowAction]?)!
    @available(iOS 8.0, *)
    open func editActionsForRowAtIndexPath(_ handler:((_ tableView: UITableView, _ indexPath: IndexPath) -> [UITableViewRowAction]?)) {
        editActionsForRowAtIndexPath = handler
    }
    @available(iOS 8.0, *)
    open func tableView(_ tableView: UITableView, editActionsForRowAtIndexPath indexPath: IndexPath) -> [UITableViewRowAction]? {
        return editActionsForRowAtIndexPath(tableView, indexPath)
    }
}

@available(iOS 9.0, *)
open class TableViewDeleageAdapter_iOS_9: TableViewDeleageAdapter_iOS_8 {
    // Focus
    
    fileprivate var canFocusRowAtIndexPath: ((UITableView,IndexPath) -> Bool)!
    @available(iOS 9.0, *)
    open func canFocusRowAtIndexPath(_ handler:((_ tableView: UITableView, _ indexPath: IndexPath) -> Bool)) {
        canFocusRowAtIndexPath = handler
    }
    @available(iOS 9.0, *)
    open func tableView(_ tableView: UITableView, canFocusRowAtIndexPath indexPath: IndexPath) -> Bool {
        return canFocusRowAtIndexPath(tableView,indexPath)
    }
    
    fileprivate var shouldUpdateFocusInContext: ((UITableView,UITableViewFocusUpdateContext) -> Bool)!
    @available(iOS 9.0, *)
    open func shouldUpdateFocusInContext(_ handler:((_ tableView: UITableView, _ context: UITableViewFocusUpdateContext) -> Bool)) {
        shouldUpdateFocusInContext = handler
    }
    @available(iOS 9.0, *)
    open func tableView(_ tableView: UITableView, shouldUpdateFocusInContext context: UITableViewFocusUpdateContext) -> Bool {
        return shouldUpdateFocusInContext(tableView, context)
    }

    fileprivate var didUpdateFocusInContext: ((UITableView,UITableViewFocusUpdateContext,UIFocusAnimationCoordinator) -> Void)!
    @available(iOS 9.0, *)
    open func didUpdateFocusInContext(_ handler:((_ tableView: UITableView, _ context: UITableViewFocusUpdateContext, _ coordinator: UIFocusAnimationCoordinator) -> Void)) {
        didUpdateFocusInContext = handler
    }
    @available(iOS 9.0, *)
    open func tableView(_ tableView: UITableView, didUpdateFocusInContext context: UITableViewFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        didUpdateFocusInContext(tableView,context,coordinator)
    }
    
    fileprivate var indexPathForPreferredFocusedView: ((UITableView) -> IndexPath?)!
    @available(iOS 9.0, *)
    open func indexPathForPreferredFocusedView(_ handler:((_ tableView: UITableView) -> IndexPath?)) {
        indexPathForPreferredFocusedView = handler
    }
    @available(iOS 9.0, *)
    open func indexPathForPreferredFocusedViewInTableView(_ tableView: UITableView) -> IndexPath? {
        return indexPathForPreferredFocusedView(tableView)
    }
}


open class TableViewDataSourceAdapter: NSObject,UITableViewDataSource {
    
    fileprivate var numberOfRowsInSection: ((UITableView,Int) -> Int)!
    @available(iOS 2.0, *)
    open func numberOfRowsInSection(_ handler: ((_ tableView: UITableView, _ section: Int) -> Int)) {
        numberOfRowsInSection = handler
    }
    @available(iOS 2.0, *)
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRowsInSection(tableView, section)
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    fileprivate var cellForRowAtIndexPath: ((UITableView,IndexPath) -> UITableViewCell)!
    @available(iOS 2.0, *)
    open func cellForRowAtIndexPath(_ handler: ((_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell)) {
        cellForRowAtIndexPath = handler
    }
    @available(iOS 2.0, *)
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellForRowAtIndexPath(tableView, indexPath)
    }
    
    fileprivate var numberOfSections: ((UITableView) -> Int)!
    @available(iOS 2.0, *)
    open func numberOfSections(_ handler: ((_ tableView: UITableView) -> Int)) {
        numberOfSections = handler
    }
    // Default is 1 if not implemented
    @available(iOS 2.0, *)
    open func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections(tableView)
    }
    
    // fixed font style. use custom view (UILabel) if you want something different
    fileprivate var titleForHeaderInSection: ((UITableView,Int) -> String?)!
    @available(iOS 2.0, *)
    open func titleForHeaderInSection(_ handler: ((_ tableView: UITableView, _ section: Int) -> String?)) {
        titleForHeaderInSection = handler
    }
    @available(iOS 2.0, *)
    open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleForHeaderInSection(tableView, section)
    }
    
    fileprivate var titleForFooterInSection: ((UITableView,Int) -> String?)!
    @available(iOS 2.0, *)
    open func titleForFooterInSection(_ handler: ((_ tableView: UITableView, _ section: Int) -> String?)) {
        titleForFooterInSection = handler
    }
    @available(iOS 2.0, *)
    open func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return titleForHeaderInSection(tableView, section)
    }
    
    // Editing
    
    // Individual rows can opt out of having the -editing property set for them. If not implemented, all rows are assumed to be editable.
    fileprivate var canEditRowAtIndexPath: ((UITableView,IndexPath) -> Bool)!
    @available(iOS 2.0, *)
    open func canEditRowAtIndexPath(_ handler: ((_ tableView: UITableView, _ indexPath: IndexPath) -> Bool)) {
        canEditRowAtIndexPath = handler
    }
    @available(iOS 2.0, *)
    open func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return canEditRowAtIndexPath(tableView, indexPath)
    }
    
    // Moving/reordering
    
    // Allows the reorder accessory view to optionally be shown for a particular row. By default, the reorder control will be shown only if the datasource implements -tableView:moveRowAtIndexPath:toIndexPath:
    fileprivate var canMoveRowAtIndexPath: ((UITableView,IndexPath) -> Bool)!
    @available(iOS 2.0, *)
    open func canMoveRowAtIndexPath(_ handler: ((_ tableView: UITableView, _ indexPath: IndexPath) -> Bool)) {
        canMoveRowAtIndexPath = handler
    }
    @available(iOS 2.0, *)
    open func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return canMoveRowAtIndexPath(tableView, indexPath)
    }
    
    // Index
    
    // return list of section titles to display in section index view (e.g. "ABCD...Z#")
    fileprivate var sectionIndexTitles: ((UITableView) -> [String]?)!
    @available(iOS 2.0, *)
    open func sectionIndexTitles(_ handler: ((_ tableView: UITableView) -> [String]?)) {
        sectionIndexTitles = handler
    }
    @available(iOS 2.0, *)
    open func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionIndexTitles(tableView)
    }
    // tell table which section corresponds to section title/index (e.g. "B",1))

    fileprivate var sectionForSectionIndexTitle: ((UITableView,String,Int) -> Int)!
    @available(iOS 2.0, *)
    open func sectionForSectionIndexTitle(_ handler: ((_ tableView: UITableView, _ title: String, _ index: Int) -> Int)) {
        sectionForSectionIndexTitle = handler
    }
    @available(iOS 2.0, *)
    open func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return sectionForSectionIndexTitle(tableView,title,index)
    }
    
    // Data manipulation - insert and delete support
    
    // After a row has the minus or plus button invoked (based on the UITableViewCellEditingStyle for the cell), the dataSource must commit the change
    // Not called for edit actions using UITableViewRowAction - the action's handler will be invoked instead
    fileprivate var commitEditingStyle: ((UITableView,UITableViewCellEditingStyle,IndexPath) -> Void)!
    @available(iOS 2.0, *)
    open func commitEditingStyle(_ handler: ((_ tableView: UITableView, _ editingStyle: UITableViewCellEditingStyle, _ indexPath: IndexPath) -> Void)) {
        commitEditingStyle = handler
    }
    @available(iOS 2.0, *)
    open func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        commitEditingStyle(tableView, editingStyle, indexPath)
    }
    
    // Data manipulation - reorder / moving support
    fileprivate var moveRowAtIndexPath: ((UITableView,IndexPath,IndexPath) -> Void)!
    @available(iOS 2.0, *)
    open func moveRowAtIndexPath(_ handler: ((_ tableView: UITableView, _ sourceIndexPath: IndexPath, _ destinationIndexPath: IndexPath) -> Void)) {
        moveRowAtIndexPath = handler
    }
    @available(iOS 2.0, *)
    open func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        moveRowAtIndexPath(tableView, sourceIndexPath,destinationIndexPath)
    }
}

