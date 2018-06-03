//
//  MyNeedsViewController.swift
//  SwapKitapp
//
//  Created by Bibizhan on 22.04.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Firebase
import XLPagerTabStrip
import Cartography

class MyNeedsViewController: UIViewController {
    let ref = Database.database().reference()
    var books: [Book] = []
  
    //MARK: - UI init
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("ADD BOOK", for: .normal)
        button.setTitleColor(.itemColor, for: .normal)
        button.titleLabel?.font = UIFont(name:"Avenir",size: 15)
        button.addTarget(self, action: #selector(addNeededBook), for: .touchUpInside)
        return button
    }()
    
    //MARK: - LIfeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureConstraints()
        getAllBooks()
    }
    
    //MARK: - Setup views
    func configureViews(){
        view.backgroundColor = .white
        [tableView,addButton].forEach { (views) in
            view.addSubview(views)
        }
    }
    
    func configureConstraints(){
        constrain(tableView,addButton,view){t,a,v in
            t.top == v.top + 30
            t.left == v.left + 22
            t.right == v.right - 22
            t.height == 200
            
            a.top == t.bottom + 50
            a.centerX == v.centerX
            a.height == 20
        }
    }
    
    @objc func addNeededBook(){
        let alert = UIAlertController(title: "Add Needed Book", message: " ", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Needed Book Name"
        }
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak alert] (_) in
            let bookName = alert?.textFields![0].text!
            let ownerName = (Auth.auth().currentUser?.email)!
            let book = Book(bookName: bookName!, ownerName: ownerName, isSwapped: false, isNeeded: true)
            self.ref.child("Books").childByAutoId().updateChildValues(book.dict)
        }))
        self.tableView.reloadData()
        self.present(alert, animated: true, completion: nil)
    }
    
    func getAllBooks() {
        books.removeAll()
        tableView.reloadData()
        let ownerName = (Auth.auth().currentUser?.email)!
        ref.child("Books").queryOrdered(byChild: "ownerName").queryEqual(toValue: ownerName).observe(.childAdded) { (snapshot) in
            let book = Book(snapshot: snapshot)
            if book.isNeeded {
                self.books.append(book)
                self.tableView.reloadData()
            }
        }
    }
}

extension MyNeedsViewController:IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "MY NEEDS")
    }
}

//MARK: - UITableViewDelegate and DataSource
extension MyNeedsViewController:UITableViewDelegate,UITableViewDataSource{
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

