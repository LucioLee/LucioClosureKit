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
    var delegateAdapter: MyTableViewDelegateAdapter!
    var datasourceAdapter: MyTableViewDataSourceAdapter!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[tableView]-0-|", options: NSLayoutFormatOptions.alignAllLeft, metrics: nil, views: ["tableView":tableView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[tableView]-0-|", options: NSLayoutFormatOptions.alignAllTop, metrics: nil, views: ["tableView":tableView]))
        table = tableView
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        let tableViewDelegateAdapter = MyTableViewDelegateAdapter()
        delegateAdapter = tableViewDelegateAdapter
        tableView.delegate = tableViewDelegateAdapter
        tableViewDelegateAdapter.didSelectRowAtIndexPath { (tableView, indexPath) in
            print("selected indexPath is \(indexPath)")
        }
        let tableViewDatasourceAdapter = MyTableViewDataSourceAdapter()
        datasourceAdapter = tableViewDatasourceAdapter
        tableView.dataSource = tableViewDatasourceAdapter
        datasourceAdapter.numberOfRowsInSection { (tableView, section) -> Int in
            return 100
        }
        datasourceAdapter.cellForRowAtIndexPath { (tableView, indexPath) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = "test"
            return cell
        }
    }
}

open class MyTableViewDelegateAdapter: NSObject,UITableViewDelegate {
    
    
    fileprivate var didSelectRowAtIndexPath: ((UITableView,IndexPath) -> Void)!
    
    open func didSelectRowAtIndexPath(_ handler:((_ tableView: UITableView, _ indexPath: IndexPath) -> Void)) {
        didSelectRowAtIndexPath = handler
    }
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectRowAtIndexPath!(tableView, indexPath)
    }
    
}



open class MyTableViewDataSourceAdapter: NSObject,UITableViewDataSource {

    fileprivate var numberOfRowsInSection: ((UITableView,Int) -> Int)!
    
    open func numberOfRowsInSection(_ handler: ((_ tableView: UITableView, _ section: Int) -> Int)) {
        numberOfRowsInSection = handler
    }
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRowsInSection(tableView, section)
    }

    fileprivate var cellForRowAtIndexPath: ((UITableView,IndexPath) -> UITableViewCell)!
    
    open func cellForRowAtIndexPath(_ handler: ((_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell)) {
        cellForRowAtIndexPath = handler
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellForRowAtIndexPath(tableView, indexPath)
    }
}
