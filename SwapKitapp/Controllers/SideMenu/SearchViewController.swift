//
//  SearchViewController.swift
//  SwapKitapp
//
//  Created by Bibizhan on 21.04.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Cartography
import MGSwipeTableCell
import Firebase

class SearchViewController: UIViewController {
    
    var books: [Book] = []
    var filteredBooks: [Book] = []
    var ref: DatabaseReference!
    
    lazy var searchTextField : UISearchBar = {
        let searchTextField = UISearchBar()
        searchTextField.placeholder = "Search..."
        searchTextField.searchBarStyle = .minimal
        searchTextField.delegate = self
        searchTextField.tintColor = .white
        let textFieldInsideSearchBar = searchTextField.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = .white
        return searchTextField
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(MGSwipeTableCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(searchTextField)
        view.addSubview(tableView)
        ref = Database.database().reference()
        color()
        setupNavBar()
        setupConstraints()
        getAllBooks()
    }
    

    func setupConstraints(){
        constrain(searchTextField, tableView, view){ st,  tb, vw in
            tb.top == vw.top + 90
            tb.right == vw.right - 30
            tb.left == vw.left + 30
            tb.bottom == vw.bottom - 50
            
            st.top == vw.top + 40
            st.centerX == vw.centerX
            st.width == 240
        }
    }
    
    func getAllBooks() {
        ref.child("Books").queryOrderedByKey().observe(.value) { (snapshot) in
            self.books.removeAll()
            for item in snapshot.children {
                let book = Book(snapshot: item as! DataSnapshot)
                self.books.append(book)
                self.tableView.reloadData()
            }
        }
    }
    
    func getBooks(by ownerName: String, completionHandler: @escaping([Book]) -> Void){
        ref.child("Books").queryOrdered(byChild: "ownerName").queryEqual(toValue: ownerName).observe(.value) { (snapshot) in
            var ownerBooks: [Book] = []
            for item in snapshot.children {
                let book = Book(snapshot: item as! DataSnapshot)
                if book.isNeeded {
                    ownerBooks.append(book)
                }
            }
            completionHandler(ownerBooks)
        }
    }
    
    func returnMatchingBooks(with ownerName: String) -> [Book] {
        var matchingBooks: [Book] = []
        let myName = (Auth.auth().currentUser?.email)!
        let myBooks = books.filter { $0.ownerName == myName }
        let ownerBooks = books.filter { $0.ownerName == ownerName }
        for myBook in myBooks {
            for ownerBook in ownerBooks {
                if myBook.bookName == ownerBook.bookName {
                    matchingBooks.append(myBook)
                }
            }
        }
        return matchingBooks
    }
    
    func setupNavBar(){
        let leftBarButton = UIBarButtonItem(image:UIImage(named:"list"), style: .plain, target: self, action: #selector(listTapped))
        self.navigationItem.leftBarButtonItem  = leftBarButton
        leftBarButton.tintColor = .white
    }
    
    //Button bar tapped
    
    @objc func listTapped(){
        self.present(appDelegate.menuManager.menuLeftNavigationController!, animated: true)
    }
    
    func color(){
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.firstBg.cgColor, UIColor.secondBg.cgColor]
        self.view.layer.insertSublayer(gradient, at: 0)
    }
}

//MARK: - UITableViewDelegate and DataSource

extension SearchViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredBooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MGSwipeTableCell
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .clear
        cell.textLabel?.font = UIFont(name:"Avenir", size: 17)
        cell.textLabel?.text = filteredBooks[indexPath.row].bookName + " - \(filteredBooks[indexPath.row].ownerName)"
        cell.rightButtons = [MGSwipeButton(title: "", icon: UIImage(named:"mess"), backgroundColor: .firstBg),
                             MGSwipeButton(title: "", icon: UIImage(named:"switch"), backgroundColor: .secondBg)]
        cell.rightSwipeSettings.transition = .rotate3D
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ownerName = filteredBooks[indexPath.row].ownerName
        if !returnMatchingBooks(with: ownerName).isEmpty {
            let alert = UIAlertController(title: "Success!", message: "You have a matching needs!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        } else {
            let alert = UIAlertController(title: "Error!", message: "You have no matching needs!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let ownerName = (Auth.auth().currentUser?.email)!
        if let searchText = searchBar.text, !searchText.isEmpty {
            filteredBooks = books.filter { book in
                return (book.bookName.lowercased().contains(searchText.lowercased()) && book.ownerName != ownerName)
            }
        } else {
            filteredBooks = books.filter { $0.ownerName != ownerName }
        }
        tableView.reloadData()
    }

}



extension SearchViewController: MGSwipeTableCellDelegate {
}
