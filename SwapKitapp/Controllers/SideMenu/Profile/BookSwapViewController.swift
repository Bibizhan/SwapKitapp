//
//  BookSwapViewController.swift
//  SwapKitapp
//
//  Created by Bibizhan on 22.04.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Cartography

class BookSwapViewController: UIViewController {
    var books: [Book] = []

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureConstraints()
    }

    func configureViews(){
        view.backgroundColor = .white
        view.addSubview(tableView)
    }
    
    func configureConstraints(){
        constrain(tableView,view){t,v in
            t.top == v.top + 30
            t.left == v.left + 22
            t.right == v.right - 22
            t.height == 200
        }
    }
    
    

    
}

extension BookSwapViewController: IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "BOOK SWAP")
    }
}

extension BookSwapViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.textColor = .itemColor
        cell.textLabel?.font = UIFont(name:"Avenir", size: 17)
        cell.textLabel?.text = books[indexPath.row].bookName
        return cell
    }
}
