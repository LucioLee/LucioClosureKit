//
//  TableViewTestViewController.swift
//  LucioClosureKit
//
//  Created by 李新新 on 16/7/12.
//
//

import UIKit

class TableViewTestViewController: UIViewController {
    
    weak var table: UITableView!
    var delegateAdapter: MyTableViewDeleageAdapter!
    var datasourceAdapter: MyTableViewDatasourceAdapter!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[tableView]-0-|", options: NSLayoutFormatOptions.AlignAllLeft, metrics: nil, views: ["tableView":tableView]))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[tableView]-0-|", options: NSLayoutFormatOptions.AlignAllTop, metrics: nil, views: ["tableView":tableView]))
        table = tableView
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        let tableViewDelegateAdapter = MyTableViewDeleageAdapter()
        delegateAdapter = tableViewDelegateAdapter
        tableView.delegate = tableViewDelegateAdapter
        tableViewDelegateAdapter.didSelectRowAtIndexPath { (tableView, indexPath) in
            print("selected indexPath is \(indexPath)")
        }
        let tableViewDatasourceAdapter = MyTableViewDatasourceAdapter()
        datasourceAdapter = tableViewDatasourceAdapter
        tableView.dataSource = tableViewDatasourceAdapter
        datasourceAdapter.numberOfRowsInSection { (tableView, section) -> Int in
            return 100
        }
        datasourceAdapter.cellForRowAtIndexPath { (tableView, indexPath) -> UITableViewCell in
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
            cell.textLabel?.text = "test"
            return cell
        }
    }
}

public class MyTableViewDeleageAdapter: NSObject,UITableViewDelegate {
    
    
    private var didSelectRowAtIndexPath: ((UITableView,NSIndexPath) -> Void)!
    
    public func didSelectRowAtIndexPath(handler:((tableView: UITableView, indexPath: NSIndexPath) -> Void)) {
        didSelectRowAtIndexPath = handler
    }
    
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        didSelectRowAtIndexPath!(tableView, indexPath)
    }
    
}



public class MyTableViewDatasourceAdapter: NSObject,UITableViewDataSource {

    private var numberOfRowsInSection: ((UITableView,Int) -> Int)!
    
    public func numberOfRowsInSection(handler: ((tableView: UITableView, section: Int) -> Int)) {
        numberOfRowsInSection = handler
    }
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRowsInSection(tableView, section)
    }

    private var cellForRowAtIndexPath: ((UITableView,NSIndexPath) -> UITableViewCell)!
    
    public func cellForRowAtIndexPath(handler: ((tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell)) {
        cellForRowAtIndexPath = handler
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return cellForRowAtIndexPath(tableView, indexPath)
    }
}
