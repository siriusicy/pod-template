//
//  ViewController.swift
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright (c) TODAYS_YEAR PROJECT_OWNER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dataArray = [UIViewController.self];

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.frame = CGRect(x: 0, y: 0,
                                 width: UIScreen.main.bounds.width,
                                 height: UIScreen.main.bounds.height)
        view.addSubview(tableView)
    }

    // MARK: -  lazy
    lazy var tableView : UITableView = {
        
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 1000, height: 0.01))
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 1000, height: 0.01))
        tableView.sectionHeaderHeight = 0.01
        tableView.sectionFooterHeight = 0.01
        // if #available(iOS 11.0, *) {
        //     tableView.contentInsetAdjustmentBehavior = .never
        // }
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        
        return tableView
    }()
}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self))!
        
        cell.textLabel?.text = NSStringFromClass(dataArray[indexPath.row])
        
        cell.contentView.backgroundColor = indexPath.row % 2 == 0 ? UIColor.gray : UIColor.white

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        let vc = dataArray[indexPath.row].init()
        navigationController?.pushViewController(vc , animated: true)

    }
    
}


